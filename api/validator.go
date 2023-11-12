package api

import (
	"github.com/celtic01/bank_project/util"
	"github.com/go-playground/validator/v10"
)

var validCurrency validator.Func = func(fieldLevel validator.FieldLevel) bool {
	if currency, ok := fieldLevel.Field().Interface().(string); ok {
		// check currency is supported
		return util.ISSupportedCurrency(currency)
	}
	return false
}
