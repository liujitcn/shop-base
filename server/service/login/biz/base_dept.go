package biz

import (
	"context"

	"github.com/liujitcn/shop-base/server/data"
	"github.com/liujitcn/shop-gorm-gen/models"
)

type BaseDeptCase struct {
	data.BaseDeptRepo
}

// NewBaseDeptCase new a BaseDept use case.
func NewBaseDeptCase(baseDeptRepo data.BaseDeptRepo) *BaseDeptCase {
	return &BaseDeptCase{
		BaseDeptRepo: baseDeptRepo,
	}
}

func (c *BaseDeptCase) GetFromID(ctx context.Context, id int64) (*models.BaseDept, error) {
	return c.Find(ctx, &data.BaseDeptCondition{
		Id: id,
	})
}
