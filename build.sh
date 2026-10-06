#!/bin/sh
set -eu

export CC_wasm32_unknown_unknown="${CC_wasm32_unknown_unknown:-clang}"
export AR_wasm32_unknown_unknown="${AR_wasm32_unknown_unknown:-llvm-ar}"

wasm-pack build --locked --target nodejs --out-dir pkg-node
wasm-pack build --locked --target web --out-dir pkg-web
jq '.name = "uplc-wasm-web"' pkg-web/package.json > pkg-web/package.json.tmp
mv pkg-web/package.json.tmp pkg-web/package.json
