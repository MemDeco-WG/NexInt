# NexInt (Nexus Intelligence)

[English](#nexint-nexus-intelligence) | [中文](#nexint-nexus-intelligence-中文版)

NexInt is a high-performance, modular AI Agent runtime kernel developed in Rust. Inspired by the Linux kernel architecture, it treats AI Agent operations as system-level processes, featuring a microkernel core with pluggable subsystems.

The name NexInt represents the junction (Nexus) of light and intelligence (Intelligence), providing a robust infrastructure for next-generation autonomous agents.

## 🏛 Architecture

NexInt adopts a multi-repo, multi-crate layout. The system is decomposed into a minimalist core and several specialized subsystems, each managed as a Git Submodule and capable of being published independently to crates.io.

### Core Subsystems

| Subsystem | Repository | Description |
|---|---|---|
| `nexint-core` | main | The microkernel responsible for lifecycle management and task scheduling. |
| `nexint-mem` | subsystems/mem | Token-based Memory Management. Handles context as paged memory units with LRU swapping. |
| `nexint-vfs` | subsystems/vfs | Virtual Function System. Abstracts LLM tools and APIs into a unified file-like interface. |
| `nexint-mod` | subsystems/mod | Kernel Module Loader. Supports hot-swappable extensions via WebAssembly (Wasm) sandboxing. |
| `nexint-bus` | subsystems/bus | Signal Bus. High-concurrency IPC for inter-agent and intra-subsystem communication. |

## 🚀 Key Features

*   **Rust-Native Performance**: Leverages Rust's memory safety and zero-cost abstractions for low-latency agent execution.
*   **Token Paging**: Advanced memory controller that manages LLM context windows using OS-style paging and eviction strategies.
*   **Wasm Extensions**: Safe, cross-platform plugin system based on WebAssembly, ensuring kernel stability even if a plugin fails.
*   **Scalable Workspace**: Managed via Git Submodules and Rust Workspaces for a seamless developer experience in complex multi-repo environments.

## 🛠 Getting Started

### Prerequisites

*   Rust (latest stable)
*   direnv (highly recommended for environment automation)

### Installation

1.  Clone the repository with submodules:

    ```bash
    git clone --recursive https://github.com/your-repo/NexInt
    cd NexInt
    ```

2.  Allow environment automation (if using direnv):

    ```bash
    direnv allow .
    ```

3.  Build the entire workspace:

    ```bash
    cargo build --workspace
    ```

## 🏗 Development Workflow

This project uses a kernel-style development flow:

*   **Subsystem Isolation**: Each subdirectory in `nexint-subsystems/` is an independent Git repository.
*   **Workspace Sync**: Use the provided `init.sh` or `direnv` hooks to keep submodules in sync with the upstream.

## 📄 License

Copyright (C) 2026 LIghtJUNction <lightjunction.me@gmail.com>

NexInt is distributed under the terms of the GNU General Public License v3.0 (GPLv3).

---

# NexInt (Nexus Intelligence) 中文版

NexInt 是一个使用 Rust 开发的高性能、模块化 AI Agent 运行时内核。受 Linux 内核架构启发，它将 AI Agent 操作视为系统级进程，采用微内核核心配合可插拔子系统的设计。

NexInt 这个名字代表了连接 (Nexus) 与智慧 (Intelligence) 的交汇点，为下一代自主智能体提供了稳健的基础设施。

## 🏛 架构

NexInt 采用多仓库 (multi-repo)、多 crate 的布局。系统被分解为一个极简的核心和多个专门的子系统，每个子系统都作为一个 Git 子模块管理，并能够独立发布到 crates.io。

### 核心子系统

| 子系统 | 仓库 | 描述 |
|---|---|---|
| `nexint-core` | main | 负责生命周期管理和任务调度的微内核。 |
| `nexint-mem` | subsystems/mem | 基于 Token 的内存管理。将上下文作为分页内存单元处理，支持 LRU 交换。 |
| `nexint-vfs` | subsystems/vfs | 虚拟功能系统。将 LLM 工具和 API 抽象为统一的类文件接口。 |
| `nexint-mod` | subsystems/mod | 内核模块加载器。支持基于 WebAssembly (Wasm) 沙箱的热插拔扩展。 |
| `nexint-bus` | subsystems/bus | 信号总线。用于 Agent 之间和子系统内部通信的高并发 IPC。 |

## 🚀 核心特性

*   **Rust 原生性能**: 利用 Rust 的内存安全和零成本抽象，实现低延迟的 Agent 执行。
*   **Token 分页**: 先进的内存控制器，使用操作系统风格的分页和驱逐策略管理 LLM 上下文窗口。
*   **Wasm 扩展**: 基于 WebAssembly 的安全、跨平台插件系统，确保即使插件崩溃也能保持内核稳定。
*   **可扩展工作区**: 通过 Git 子模块和 Rust Workspaces 管理，为复杂的多仓库环境提供无缝的开发者体验。

## 🛠 快速开始

### 先决条件

*   Rust (最新稳定版)
*   direnv (强烈推荐用于环境自动化)

### 安装

1.  克隆带有子模块的仓库：

    ```bash
    git clone --recursive https://github.com/your-repo/NexInt
    cd NexInt
    ```

2.  允许环境自动化 (如果使用 direnv)：

    ```bash
    direnv allow .
    ```

3.  构建整个工作区：

    ```bash
    cargo build --workspace
    ```

## 🏗 开发工作流

本项目使用类内核风格的开发流程：

*   **子系统隔离**: `nexint-subsystems/` 中的每个子目录都是一个独立的 Git 仓库。
*   **工作区同步**: 使用提供的 `init.sh` 或 `direnv` 钩子保持子模块与上游同步。

## 📄 许可证

Copyright (C) 2026 LIghtJUNction <lightjunction.me@gmail.com>

NexInt 根据 GNU 通用公共许可证 v3.0 (GPLv3) 的条款分发。