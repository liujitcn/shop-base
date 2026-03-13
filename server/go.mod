module github.com/liujitcn/shop-base/server

go 1.26.0

require (
	github.com/go-kratos/kratos/v2 v2.9.2
	github.com/google/gnostic v0.7.1
	github.com/google/wire v0.7.0
	github.com/liujitcn/go-utils v0.0.11
	github.com/liujitcn/gorm-kit v0.0.4
	github.com/liujitcn/kratos-kit v0.0.5
	github.com/liujitcn/kratos-kit/api v0.0.9
	github.com/liujitcn/kratos-kit/auth v0.0.3
	github.com/liujitcn/kratos-kit/auth/authn v0.0.4
	github.com/liujitcn/kratos-kit/bootstrap v0.0.3
	github.com/liujitcn/kratos-kit/cache v0.0.4
	github.com/liujitcn/kratos-kit/captcha v0.0.1
	github.com/liujitcn/kratos-kit/database/gorm v0.0.6
	github.com/liujitcn/kratos-kit/oss v0.0.4
	github.com/liujitcn/kratos-kit/pprof v0.0.1
	github.com/liujitcn/kratos-kit/queue v0.0.4
	github.com/liujitcn/shop-gorm-gen v0.0.5
	google.golang.org/genproto/googleapis/api v0.0.0-20260226221140-a57be14db171
	google.golang.org/grpc v1.79.2
	google.golang.org/protobuf v1.36.11
	gorm.io/gen v0.3.27
)

require (
	dario.cat/mergo v1.0.0 // indirect
	filippo.io/edwards25519 v1.1.0 // indirect
	github.com/ClickHouse/ch-go v0.61.5 // indirect
	github.com/ClickHouse/clickhouse-go/v2 v2.30.0 // indirect
	github.com/aliyun/aliyun-oss-go-sdk v3.0.2+incompatible // indirect
	github.com/andybalholm/brotli v1.1.1 // indirect
	github.com/beorn7/perks v1.0.1 // indirect
	github.com/bsm/redislock v0.9.4 // indirect
	github.com/cenkalti/backoff/v5 v5.0.3 // indirect
	github.com/cespare/xxhash/v2 v2.3.0 // indirect
	github.com/clipperhouse/displaywidth v0.6.0 // indirect
	github.com/clipperhouse/stringish v0.1.1 // indirect
	github.com/clipperhouse/uax29/v2 v2.3.0 // indirect
	github.com/dgryski/go-rendezvous v0.0.0-20200823014737-9f7001d12a5f // indirect
	github.com/dustin/go-humanize v1.0.1 // indirect
	github.com/fatih/color v1.15.0 // indirect
	github.com/fsnotify/fsnotify v1.6.0 // indirect
	github.com/go-faster/city v1.0.1 // indirect
	github.com/go-faster/errors v0.7.1 // indirect
	github.com/go-ini/ini v1.67.0 // indirect
	github.com/go-kratos/aegis v0.2.0 // indirect
	github.com/go-logr/logr v1.4.3 // indirect
	github.com/go-logr/stdr v1.2.2 // indirect
	github.com/go-playground/form/v4 v4.3.0 // indirect
	github.com/go-sql-driver/mysql v1.8.1 // indirect
	github.com/goccy/go-json v0.10.3 // indirect
	github.com/golang-jwt/jwt/v5 v5.2.2 // indirect
	github.com/golang/freetype v0.0.0-20170609003504-e2365dfdc4a0 // indirect
	github.com/golang/protobuf v1.5.4 // indirect
	github.com/google/gnostic-models v0.7.0 // indirect
	github.com/google/subcommands v1.2.0 // indirect
	github.com/google/uuid v1.6.0 // indirect
	github.com/gorilla/mux v1.8.1 // indirect
	github.com/grafana/pyroscope-go v1.2.7 // indirect
	github.com/grafana/pyroscope-go/godeltaprof v0.1.9 // indirect
	github.com/grpc-ecosystem/go-grpc-middleware v1.4.0 // indirect
	github.com/grpc-ecosystem/grpc-gateway/v2 v2.28.0 // indirect
	github.com/hashicorp/errwrap v1.1.0 // indirect
	github.com/hashicorp/go-multierror v1.1.1 // indirect
	github.com/hashicorp/go-version v1.6.0 // indirect
	github.com/inconshreveable/mousetrap v1.1.0 // indirect
	github.com/jackc/pgpassfile v1.0.0 // indirect
	github.com/jackc/pgservicefile v0.0.0-20231201235250-de7065d80cb9 // indirect
	github.com/jackc/pgx/v5 v5.5.5 // indirect
	github.com/jackc/puddle/v2 v2.2.1 // indirect
	github.com/jinzhu/inflection v1.0.0 // indirect
	github.com/jinzhu/now v1.1.5 // indirect
	github.com/jlaffaye/ftp v0.2.0 // indirect
	github.com/klauspost/compress v1.18.0 // indirect
	github.com/klauspost/cpuid/v2 v2.2.8 // indirect
	github.com/lithammer/shortuuid/v4 v4.2.0 // indirect
	github.com/liujitcn/gorm-kit/api v0.0.2 // indirect
	github.com/liujitcn/kratos-kit/auth/authn/middleware v0.0.4 // indirect
	github.com/liujitcn/kratos-kit/auth/authz v0.0.4 // indirect
	github.com/liujitcn/kratos-kit/auth/authz/middleware v0.0.4 // indirect
	github.com/liujitcn/kratos-kit/config v0.0.4 // indirect
	github.com/liujitcn/kratos-kit/database/gorm/driver v0.0.6 // indirect
	github.com/liujitcn/kratos-kit/locker v0.0.1 // indirect
	github.com/liujitcn/kratos-kit/logger v0.0.4 // indirect
	github.com/liujitcn/kratos-kit/queue/redisqueue v0.0.4 // indirect
	github.com/liujitcn/kratos-kit/registry v0.0.4 // indirect
	github.com/liujitcn/kratos-kit/tracer v0.0.4 // indirect
	github.com/liujitcn/kratos-kit/utils v0.0.4 // indirect
	github.com/mattn/go-colorable v0.1.13 // indirect
	github.com/mattn/go-isatty v0.0.19 // indirect
	github.com/mattn/go-runewidth v0.0.19 // indirect
	github.com/matttproud/golang_protobuf_extensions v1.0.4 // indirect
	github.com/minio/md5-simd v1.1.2 // indirect
	github.com/minio/minio-go/v7 v7.0.80 // indirect
	github.com/mojocn/base64Captcha v1.3.8 // indirect
	github.com/olekukonko/cat v0.0.0-20250911104152-50322a0618f6 // indirect
	github.com/olekukonko/errors v1.1.0 // indirect
	github.com/olekukonko/ll v0.1.3 // indirect
	github.com/olekukonko/tablewriter v1.1.2 // indirect
	github.com/openzipkin/zipkin-go v0.4.3 // indirect
	github.com/paulmach/orb v0.11.1 // indirect
	github.com/pierrec/lz4/v4 v4.1.21 // indirect
	github.com/pkg/errors v0.9.1 // indirect
	github.com/prometheus/client_golang v1.17.0 // indirect
	github.com/prometheus/client_model v0.4.1-0.20230718164431-9a2bf3000d16 // indirect
	github.com/prometheus/common v0.44.0 // indirect
	github.com/prometheus/procfs v0.11.1 // indirect
	github.com/redis/go-redis/extra/rediscmd/v9 v9.18.0 // indirect
	github.com/redis/go-redis/extra/redisotel/v9 v9.18.0 // indirect
	github.com/redis/go-redis/v9 v9.18.0 // indirect
	github.com/rs/xid v1.6.0 // indirect
	github.com/segmentio/asm v1.2.0 // indirect
	github.com/shopspring/decimal v1.4.0 // indirect
	github.com/spf13/cobra v1.10.2 // indirect
	github.com/spf13/pflag v1.0.9 // indirect
	go.newcapec.cn/ncttools/nmskit/log v0.1.2 // indirect
	go.opentelemetry.io/auto/sdk v1.2.1 // indirect
	go.opentelemetry.io/otel v1.42.0 // indirect
	go.opentelemetry.io/otel/exporters/otlp/otlptrace v1.42.0 // indirect
	go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracegrpc v1.42.0 // indirect
	go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracehttp v1.42.0 // indirect
	go.opentelemetry.io/otel/exporters/stdout/stdouttrace v1.42.0 // indirect
	go.opentelemetry.io/otel/exporters/zipkin v1.42.0 // indirect
	go.opentelemetry.io/otel/metric v1.42.0 // indirect
	go.opentelemetry.io/otel/sdk v1.42.0 // indirect
	go.opentelemetry.io/otel/trace v1.42.0 // indirect
	go.opentelemetry.io/proto/otlp v1.9.0 // indirect
	go.uber.org/atomic v1.11.0 // indirect
	go.yaml.in/yaml/v3 v3.0.4 // indirect
	golang.org/x/crypto v0.48.0 // indirect
	golang.org/x/image v0.23.0 // indirect
	golang.org/x/mod v0.33.0 // indirect
	golang.org/x/net v0.51.0 // indirect
	golang.org/x/sync v0.20.0 // indirect
	golang.org/x/sys v0.41.0 // indirect
	golang.org/x/text v0.35.0 // indirect
	golang.org/x/time v0.15.0 // indirect
	golang.org/x/tools v0.42.0 // indirect
	google.golang.org/genproto/googleapis/rpc v0.0.0-20260217215200-42d3e9bedb6d // indirect
	gopkg.in/yaml.v3 v3.0.1 // indirect
	gorm.io/datatypes v1.2.4 // indirect
	gorm.io/driver/clickhouse v0.7.0 // indirect
	gorm.io/driver/mysql v1.6.0 // indirect
	gorm.io/driver/postgres v1.5.11 // indirect
	gorm.io/gorm v1.31.1 // indirect
	gorm.io/hints v1.1.0 // indirect
	gorm.io/plugin/dbresolver v1.6.2 // indirect
	gorm.io/plugin/opentelemetry v0.1.16 // indirect
	gorm.io/plugin/prometheus v0.1.0 // indirect
)
