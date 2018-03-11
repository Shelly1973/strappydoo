#!/usr/bin/env bash

( test -f ".ruby-version" && test -z "$(rbenv version-name 2>/dev/null)" ) || return 1

_rbenv_bootstrap() {
  echo "==> Installing Ruby…"
  rbenv install --skip-existing
  which bundle >/dev/null 2>&1  || {
    gem install bundler
    rbenv rehash
  }
}
