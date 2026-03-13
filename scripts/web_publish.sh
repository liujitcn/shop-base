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
  3. 执行 build 并发布 npm 公开包。
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

PKG_NAME="$(node -p "require('${WEB_DIR}/package.json').name")"
LOCAL_VERSION="$(node -p "require('${WEB_DIR}/package.json').version")"
NPM_VERSION="$(npm view "${PKG_NAME}" version 2>/dev/null || true)"

NEXT_VERSION="$(node -e '
const localVersion = process.argv[1];
const npmVersion = process.argv[2];

function parseSemver(v) {
  const m = /^(\d+)\.(\d+)\.(\d+)$/.exec(v || "");
  if (!m) return null;
  return [Number(m[1]), Number(m[2]), Number(m[3])];
}

function compare(a, b) {
  for (let i = 0; i < 3; i += 1) {
    if (a[i] > b[i]) return 1;
    if (a[i] < b[i]) return -1;
  }
  return 0;
}

const npm = parseSemver(npmVersion);
if (!npm) {
  const local = parseSemver(localVersion);
  if (!local) {
    console.error(`非法本地语义化版本: ${localVersion}`);
    process.exit(1);
  }
  const major = local[0];
  const minor = local[1];
  const patch = local[2] + 1;
  process.stdout.write(`${major}.${minor}.${patch}`);
  process.exit(0);
}

const major = npm[0];
const minor = npm[1];
const patch = npm[2] + 1;
process.stdout.write(`${major}.${minor}.${patch}`);
' "${LOCAL_VERSION}" "${NPM_VERSION}")"

echo "包名: ${PKG_NAME}"
echo "本地版本: ${LOCAL_VERSION}"
echo "npm 最新版本: ${NPM_VERSION:-<无>}"
echo "即将更新为: ${NEXT_VERSION}"

cd "${WEB_DIR}"

if [[ "${LOCAL_VERSION}" == "${NEXT_VERSION}" ]]; then
  echo "本地版本已是目标版本，无需修改版本号。"
else
  npm version "${NEXT_VERSION}" --no-git-tag-version
  echo "更新后版本: $(node -p "require('./package.json').version")"
fi

cd "${WEB_DIR}"
echo "开始构建..."
npm run build

echo "开始发布 npm 公开包..."
npm publish --access public
echo "发布完成: ${PKG_NAME}@$(node -p "require('./package.json').version")"
