#!/usr/bin/env bash

set -euo pipefail

# 计算仓库根目录与 web 目录
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
WEB_DIR="${ROOT_DIR}/web"

usage() {
  cat <<'EOF'
用法:
  ./scripts/web_publish.sh

说明:
  1. 读取 npm 上当前包的最新版本。
  2. 自动将 patch 版本号 +1 写入 web/package.json。
  3. 自动提交版本变更。
  4. 执行 build 并发布 npm 公开包。
EOF
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

if [[ ! -d "${WEB_DIR}" ]]; then
  echo "错误: 未找到 web 目录: ${WEB_DIR}" >&2
  exit 1
fi

if ! command -v node >/dev/null 2>&1; then
  echo "错误: 未安装 node。" >&2
  exit 1
fi

if ! command -v npm >/dev/null 2>&1; then
  echo "错误: 未安装 npm。" >&2
  exit 1
fi

if ! command -v git >/dev/null 2>&1; then
  echo "错误: 未安装 git。" >&2
  exit 1
fi

PKG_NAME="$(node -p "require('${WEB_DIR}/package.json').name")"
LOCAL_VERSION="$(node -p "require('${WEB_DIR}/package.json').version")"
NPM_VERSION="$(npm view "${PKG_NAME}" version 2>/dev/null || true)"

BASE_VERSION="${NPM_VERSION:-$LOCAL_VERSION}"

NEXT_VERSION="$(node -e '
const v = process.argv[1];
const m = /^(\d+)\.(\d+)\.(\d+)$/.exec(v);
if (!m) {
  console.error(`非法语义化版本: ${v}`);
  process.exit(1);
}
const major = Number(m[1]);
const minor = Number(m[2]);
const patch = Number(m[3]) + 1;
process.stdout.write(`${major}.${minor}.${patch}`);
' "${BASE_VERSION}")"

echo "包名: ${PKG_NAME}"
echo "本地版本: ${LOCAL_VERSION}"
echo "npm 最新版本: ${NPM_VERSION:-<无>}"
echo "即将更新为: ${NEXT_VERSION}"

cd "${WEB_DIR}"

npm version "${NEXT_VERSION}" --no-git-tag-version

echo "更新后版本: $(node -p "require('./package.json').version")"

cd "${ROOT_DIR}"
git add web/package.json
if git diff --cached --quiet; then
  echo "提示: 未检测到可提交的版本变更。"
else
  git commit -m "升级 web 发布版本到 v${NEXT_VERSION}"
  CURRENT_BRANCH="$(git branch --show-current)"
  if [[ -z "${CURRENT_BRANCH}" ]]; then
    echo "错误: 无法识别当前分支，无法推送。" >&2
    exit 1
  fi
  git push origin "${CURRENT_BRANCH}"
  echo "已提交并推送到远程分支: ${CURRENT_BRANCH}"
fi

cd "${WEB_DIR}"
echo "开始构建..."
npm run build

echo "开始发布 npm 公开包..."
npm publish --access public
echo "发布完成: ${PKG_NAME}@$(node -p "require('./package.json').version")"
