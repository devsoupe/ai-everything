# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**ai-everything** is a multi-agent AI CLI router system. The main tool `aiyolo` routes commands between Claude Code and Google Gemini CLI under a single interface. Default routing goes to Claude; use `-g` for Gemini.

## Installation & Usage

```bash
# Install (creates symlinks in ~/.local/bin)
bash bin/install.sh

# Ensure PATH includes ~/.local/bin
export PATH="$HOME/.local/bin:$PATH"

# Usage
aiyolo              # show help
aiyolo -c           # Claude Code (also default for unknown flags)
aiyolo -g           # Google Gemini CLI
aiyolo "prompt"     # routes to Claude by default
```

## Architecture

- **bin/aiyolo** — Zsh script, the main CLI router. Validates command availability before execution, clears screen on run, passes all remaining args to the selected backend.
- **bin/install.sh** — Bash installer that symlinks everything in `bin/` (except itself) to `~/.local/bin`.
- **docs/** — PDCA methodology documentation organized by phase: `01-plan/`, `02-design/`, `03-analysis/`, `04-report/`. Each feature gets a file per phase (e.g., `aiyolo-cli.plan.md`).
- **.gemini/** — Gemini CLI configuration and permission policies (TOML-based, restrictive by default).
- **.pdca-status.json** — Tracks current PDCA phase and session state.

## Conventions

- Shell scripts: Zsh for tools (`#!/usr/bin/env zsh`), Bash for installation scripts
- Documentation and comments are written in Korean
- PDCA cycle governs feature development workflow: Plan → Design → Analysis → Report
- Gemini runs with `NODE_NO_WARNINGS=1` to suppress Node.js warnings

## Required Dependencies

- `zsh`, `bash`
- `claude` CLI (Claude Code)
- `gemini` CLI (Google Gemini CLI)
