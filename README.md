# shop-base

`shop-base` 包含两部分：

- `server`：Proto、Go 服务端代码与生成脚本。
- `web`：基于 Proto 生成的 TypeScript 类型包（npm 包：`@liujitcn/shop-base`）。

## 目录结构

```text
shop-base/
├── server/                 # 服务端与 proto 生成入口
│   ├── api/
│   └── Makefile
└── web/                    # TS 类型包
    ├── src/
    ├── dist/
    └── package.json
```

## 常用命令（server）

在 `server` 目录执行：

```bash
cd server
```

安装生成工具：

```bash
make init
```

生成 Go 代码：

```bash
make api
```

生成 OpenAPI 文档：

```bash
make openapi
```

生成 TypeScript 代码（输出到 `../web/src/rpc`）：

```bash
make ts
```

一键生成全部接口产物（Go + OpenAPI + TypeScript）：

```bash
make gen
```

## web 包构建

在 `web` 目录执行：

```bash
cd web
pnpm install
pnpm run build
```

产物输出到 `web/dist`。

## 发布到 npm（公开包）

当前包名：

```text
@liujitcn/shop-base
```

发布命令：

```bash
cd web
npm publish --access public --otp=<6位验证码>
```

也可以在仓库根目录一键执行自动发布流程（自动升 patch 版本、构建并发布）：

```bash
make web-publish
```

说明：

- 若 npm 开启了 2FA，发布时需要 `--otp`。
- 每次发布前请先更新 `web/package.json` 的 `version`，避免版本重复发布失败。
