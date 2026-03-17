#!/bin/bash

# 定义子系统列表
SUBSYSTEMS=("nexint-mem" "nexint-vfs" "nexint-mod" "nexint-bus")
BASE_DIR="nexint-subsystems"

# 确保子系统目录存在
mkdir -p $BASE_DIR

for sys in "${SUBSYSTEMS[@]}"; do
    echo "📦 Initializing $sys..."
    
    # 路径定义
    SYS_PATH="$BASE_DIR/$sys"
    
    # 1. 如果目录为空或不存在，初始化为库类型 crate
    if [ ! -d "$SYS_PATH/src" ]; then
        cargo init --lib "$SYS_PATH" --name "$sys"
    fi

    # 2. 注入基本的 Cargo.toml 模板（使用 workspace 依赖）
    cat <<EOF > "$SYS_PATH/Cargo.toml"
[package]
name = "$sys"
version = "0.1.0"
edition = "2021"
description = "Subsystem for NexInt AI Agent Runtime"

[dependencies]
tokio = { workspace = true }
tracing = { workspace = true }
serde = { workspace = true }
anyhow = { workspace = true }
EOF

    # 3. 进入子目录进行 Git 提交
    cd "$SYS_PATH"
    
    # 如果还没有 git 仓库则初始化（通常 submodule 已经是仓库了）
    if [ ! -d ".git" ]; then
        git init
    fi
    
    git add .
    git commit -m "init: bootstrap $sys with workspace config"
    
    # 返回根目录
    cd - > /dev/null
    echo "✅ $sys initialized and committed."
done

# 最后在主仓提交 submodule 的指针更新
echo "🚀 Updating main kernel repository..."
git add .
git commit -m "chore: sync all subsystems after initialization"

echo "Done! All subsystems are ready for development."

