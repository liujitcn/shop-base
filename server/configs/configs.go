package configs

import (
	"errors"

	bootstrapConf "github.com/liujitcn/kratos-kit/api/gen/go/conf"
	"github.com/liujitcn/kratos-kit/bootstrap"
)

func ParseOss(ctx *bootstrap.Context) (*bootstrapConf.OSS, error) {
	cfg := ctx.GetConfig()
	if cfg == nil || cfg.GetOss() == nil {
		return nil, errors.New("config oss is nil")
	}
	return cfg.GetOss(), nil
}

func ParseData(ctx *bootstrap.Context) (*bootstrapConf.Data, error) {
	cfg := ctx.GetConfig()
	if cfg == nil || cfg.GetData() == nil {
		return nil, errors.New("config data is nil")
	}
	return cfg.GetData(), nil
}

func ParseDatabase(cfg *bootstrapConf.Data) *bootstrapConf.Data_Database {
	return cfg.GetDatabase()
}

func ParseQueue(cfg *bootstrapConf.Data) *bootstrapConf.Data_Queue {
	return cfg.GetQueue()
}

func ParseRedis(cfg *bootstrapConf.Data) *bootstrapConf.Data_Redis {
	return cfg.GetRedis()
}

func ParsePprof(ctx *bootstrap.Context) (*bootstrapConf.Pprof, error) {
	cfg := ctx.GetConfig()
	if cfg == nil || cfg.GetPprof() == nil {
		return nil, errors.New("config pprof is nil")
	}
	return cfg.GetPprof(), nil
}

func ParseAuthnJwt(ctx *bootstrap.Context) *bootstrapConf.Authentication_Jwt {
	cfg := ctx.GetConfig()
	if cfg == nil || cfg.GetAuthn() == nil || cfg.GetAuthn().GetJwt() == nil {
		return &bootstrapConf.Authentication_Jwt{
			Method: "HS256",
			Secret: "shop-admin",
		}
	}
	return cfg.GetAuthn().GetJwt()
}
