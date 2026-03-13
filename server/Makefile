# Makefile 常用目标：初始化工具、生成代码、启动服务、打 tag
.PHONY: help init plugin cli api openapi ts gen

# 初始化开发环境
init: plugin cli

# 安装 protoc 插件
plugin:
	# Go 相关插件
	@go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
	@go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
	@go install github.com/go-kratos/kratos/cmd/protoc-gen-go-http/v2@latest
	@go install github.com/go-kratos/kratos/cmd/protoc-gen-go-errors/v2@latest
	@go install github.com/google/gnostic/cmd/protoc-gen-openapi@latest
	@go install github.com/envoyproxy/protoc-gen-validate@latest
	@go install github.com/menta2k/protoc-gen-redact/v3@latest
	@go install github.com/go-kratos/protoc-gen-typescript-http@latest

# 安装 CLI 工具
cli:
	@go install github.com/go-kratos/kratos/cmd/kratos/v2@latest
	@go install github.com/google/gnostic@latest
	@go install github.com/bufbuild/buf/cmd/buf@latest
	@go install entgo.io/ent/cmd/ent@latest
	@go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest

# 生成 Protobuf 的 Go 代码
api:
	@cd api && \
	buf generate

# 生成 OpenAPI v3 文档
openapi:
	@cd api && \
	buf generate --template buf.openapi.gen.yaml --exclude-path protos/conf

# 生成 TypeScript 代码（输出到 ../web/src/rpc）
ts:
	@cd api && \
	buf generate --template buf.typescript.gen.yaml --exclude-path protos/conf

# 一键生成全部接口产物（Go 代码 + OpenAPI 文档 + TypeScript 代码）
gen: api openapi ts

# 显示帮助信息
# 通过解析注释输出可用目标及说明
help:
	@echo ""
	@echo "Usage:"
	@echo " make [target]"
	@echo ""
	@echo 'Targets:'
	@awk '/^[a-zA-Z\-_0-9]+:/ { \
	helpMessage = match(lastLine, /^# (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")-1); \
			helpMessage = substr(lastLine, RSTART + 2, RLENGTH); \
			printf "\033[36m%-22s\033[0m %s\n", helpCommand,helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help
