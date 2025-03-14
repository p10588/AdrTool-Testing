#!/bin/bash

test="$2{path}"
echo "root path $test"
converted_path=$(echo "$test" | sed 's#\\#/#g')
echo "convert_path $converted_path"

# 檢查 ADR 目錄是否存在
if [ ! -d "$2{path}\\doc\\adr" ]; then
    echo "ADR directory not found. Initializing ADR at $2{path}..."
    cd $converted_path
    pwd
    adr init
else
    echo "ADR directory found at $2{path}."
fi

# 創建新的 ADR 記錄
cd $converted_path
pwd
adr new "#1{test}"
echo "New ADR created at $converted_path"