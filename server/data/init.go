package data

import (
	"github.com/google/wire"
	genData "github.com/liujitcn/shop-gorm-gen/data"
)

// ProviderSet is server providers.
var ProviderSet = wire.NewSet(
	genData.NewData,
	genData.NewTransaction,
	NewBaseConfigRepo,
)
