#!/usr/bin/env bats

load support/test_helper
load support/run_zas
load support/config

@test "config: uses ZAS_APP_DIR from an environment variable" {
  response="$(curl -s -H 'Host: zas.dev' localhost:$ZAS_HTTP_PORT)"

  [ "$response" = "ZAS_APP_DIR: ${ZAS_APP_DIR}" ]
}
