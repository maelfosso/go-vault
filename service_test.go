package vault

import (
	"context"
	"testing"
)

func TestHasherService(t *testing.T) {
	srv := NewService()
	ctx := context.Background()
	h, err := srv.Hash(context, "password")
	if err != nil {
		t.Errorf("Hash: %s", err)
	}
	ok, err := srv.Validate(context, "password", h)
	if err != nil {
		t.Errorf("Valid: %s", err)
	}
	if !ok {
		t.Error("expected true from valid")
	}
	ok, err = srv.Validate(context, "wrong password", h)
	if err != nil {
		t.Errorf("Valid: %s", err)
	}
	if ok {
		t.Error("expected false from Valid")
	}
}
