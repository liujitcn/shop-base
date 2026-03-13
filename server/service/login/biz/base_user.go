package biz

import (
	"context"

	"github.com/liujitcn/shop-base/server/data"
	"github.com/liujitcn/shop-gorm-gen/models"
)

type BaseUserCase struct {
	data.BaseUserRepo
}

// NewBaseUserCase new a BaseUser use case.
func NewBaseUserCase(baseUserRepo data.BaseUserRepo) *BaseUserCase {
	return &BaseUserCase{
		BaseUserRepo: baseUserRepo,
	}
}

func (c *BaseUserCase) GetFromUserName(ctx context.Context, userName string) (*models.BaseUser, error) {
	return c.Find(ctx, &data.BaseUserCondition{UserName: userName})
}
