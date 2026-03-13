package biz

import (
	"context"

	"github.com/liujitcn/shop-base/server/data"
	genData "github.com/liujitcn/shop-gorm-gen/data"
	"github.com/liujitcn/shop-gorm-gen/models"
)

type BaseRoleCase struct {
	tx genData.Transaction
	data.BaseRoleRepo
}

// NewBaseRoleCase new a BaseRole use case.
func NewBaseRoleCase(
	tx genData.Transaction,
	baseRoleRepo data.BaseRoleRepo,
) *BaseRoleCase {
	return &BaseRoleCase{
		tx:           tx,
		BaseRoleRepo: baseRoleRepo,
	}
}

func (c *BaseRoleCase) GetFromID(ctx context.Context, id int64) (*models.BaseRole, error) {
	return c.Find(ctx, &data.BaseRoleCondition{Id: id})
}
