------------------------------
NexInt (Nexus Intelligence)
NexInt is a high-performance, modular AI Agent runtime kernel developed in Rust. Inspired by the Linux kernel architecture, it treats AI Agent operations as system-level processes, featuring a microkernel core with pluggable subsystems.
The name NexInt represents the junction (Nexus) of light and intelligence (Intelligence), providing a robust infrastructure for next-generation autonomous agents.
🏛 Architecture
NexInt adopts a multi-repo, multi-crate layout. The system is decomposed into a minimalist core and several specialized subsystems, each managed as a Git Submodule and capable of being published independently to crates.io.
Core Subsystems

| Subsystem | Repository | Description |
|---|---|---|
| nexint-core | main | The microkernel responsible for lifecycle management and task scheduling. |
| nexint-mem | subsystems/mem | Token-based Memory Management. Handles context as paged memory units with LRU swapping. |
| nexint-vfs | subsystems/vfs | Virtual Function System. Abstracts LLM tools and APIs into a unified file-like interface. |
| nexint-mod | subsystems/mod | Kernel Module Loader. Supports hot-swappable extensions via WebAssembly (Wasm) sandboxing. |
| nexint-bus | subsystems/bus | Signal Bus. High-concurrency IPC for inter-agent and intra-subsystem communication. |

🚀 Key Features

* Rust-Native Performance: Leverages Rust's memory safety and zero-cost abstractions for low-latency agent execution.
* Token Paging: Advanced memory controller that manages LLM context windows using OS-style paging and eviction strategies.
* Wasm Extensions: Safe, cross-platform plugin system based on WebAssembly, ensuring kernel stability even if a plugin fails.
* Scalable Workspace: Managed via Git Submodules and Rust Workspaces for a seamless developer experience in complex multi-repo environments.

🛠 Getting StartedPrerequisites

* Rust (latest stable)
* direnv (highly recommended for environment automation)

Installation

   1. Clone the repository with submodules:
   
   git clone --recursive https://github.com
   cd NexInt
   
   2. Allow environment automation (if using direnv):
   
   direnv allow .
   
   3. Build the entire workspace:
   
   cargo build --workspace
   
   
🏗 Development Workflow
This project uses a kernel-style development flow:

* Subsystem Isolation: Each subdirectory in nexint-subsystems/ is an independent Git repository.
* Workspace Sync: Use the provided init.sh or direnv hooks to keep submodules in sync with the upstream.
