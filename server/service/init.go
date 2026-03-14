package service

import (
	"github.com/google/wire"
	"github.com/liujitcn/shop-base/server/service/config"
	configBiz "github.com/liujitcn/shop-base/server/service/config/biz"
	"github.com/liujitcn/shop-base/server/service/file"
	fileBiz "github.com/liujitcn/shop-base/server/service/file/biz"
	"github.com/liujitcn/shop-base/server/service/login"
	loginBiz "github.com/liujitcn/shop-base/server/service/login/biz"
)

// ProviderSet is server providers.
var ProviderSet = wire.NewSet(
	configBiz.NewConfigCase,
	fileBiz.NewFileCase,
	loginBiz.NewBaseDeptCase,
	loginBiz.NewBaseRoleCase,
	loginBiz.NewBaseUserCase,

	config.NewConfigService,

	file.NewFileService,

	login.NewLoginService,
)
