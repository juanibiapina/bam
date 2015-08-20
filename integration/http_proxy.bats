#!/usr/bin/env bats

load test_helper

HTTP_PORT=12044

setup() {
  export ZAS_HOME="${FIXTURES_DIR}/zas_home"
  target/debug/zas 1>&2 &
  pid="$!"
}

teardown() {
  pkill -P "$pid" 1>&2 || true
  kill -9 "$pid" 1>&2 || true
  wait "$pid" 2>/dev/null || true
}

@test "http proxy: proxies to 'get' app" {
  sleep 1

  response="$(curl -s -H 'Host: get.dev' localhost:$HTTP_PORT)"

  [ "$response" = "MOCK GET" ]
}
