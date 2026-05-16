#!/usr/bin/env bash

set -e

MIN_NODE_MAJOR=20
MIN_NODE_MINOR=19

GREEN="\033[0;32m"
RED="\033[0;31m"
YELLOW="\033[1;33m"
BLUE="\033[0;34m"
NC="\033[0m"

pass() {
  echo -e "${GREEN}✅ $1${NC}"
}

warn() {
  echo -e "${YELLOW}⚠️  $1${NC}"
}

fail() {
  echo -e "${RED}❌ $1${NC}"
  FAILED=1
}

info() {
  echo -e "${BLUE}ℹ️  $1${NC}"
}

check_command() {
  if command -v "$1" >/dev/null 2>&1; then
    pass "$1 is installed: $($1 --version 2>/dev/null | head -n 1)"
  else
    fail "$1 is not installed"
  fi
}

check_node_version() {
  if ! command -v node >/dev/null 2>&1; then
    fail "Node.js is not installed"
    return
  fi

  NODE_VERSION=$(node -v | sed 's/v//')
  NODE_MAJOR=$(echo "$NODE_VERSION" | cut -d. -f1)
  NODE_MINOR=$(echo "$NODE_VERSION" | cut -d. -f2)

  if [ "$NODE_MAJOR" -gt "$MIN_NODE_MAJOR" ]; then
    pass "Node.js version is compatible: v$NODE_VERSION"
  elif [ "$NODE_MAJOR" -eq "$MIN_NODE_MAJOR" ] && [ "$NODE_MINOR" -ge "$MIN_NODE_MINOR" ]; then
    pass "Node.js version is compatible: v$NODE_VERSION"
  else
    fail "Node.js v$NODE_VERSION found. n8n currently requires Node.js 20.19 or above, up to 24.x."
  fi
}

check_docker_running() {
  if ! command -v docker >/dev/null 2>&1; then
    warn "Docker is not installed. Required only if using Docker-based n8n."
    return
  fi

  if docker info >/dev/null 2>&1; then
    pass "Docker is installed and running"
  else
    warn "Docker is installed but not running. Open Docker Desktop before using Docker workflows."
  fi
}

check_env_file() {
  if [ -f ".env" ]; then
    pass ".env file exists"
  elif [ -f ".env.example" ]; then
    warn ".env file not found. Copy .env.example to .env before running the project."
  else
    warn "No .env or .env.example file found. Add .env.example for safe configuration sharing."
  fi
}

echo "======================================"
echo " AI Training Scheduler Readiness Check"
echo "======================================"
echo ""

FAILED=0

info "Checking required developer tools..."
check_command git
check_node_version
check_command npm

echo ""
info "Checking optional but recommended tools..."
check_docker_running

if command -v code >/dev/null 2>&1; then
  pass "VSCode CLI is installed: $(code --version | head -n 1)"
else
  warn "VSCode CLI not found. In VSCode, run: Shell Command: Install 'code' command in PATH"
fi

if command -v n8n >/dev/null 2>&1; then
  pass "n8n is installed: $(n8n --version 2>/dev/null | head -n 1)"
else
  warn "n8n is not installed globally. You can still run it using: npx n8n"
fi

echo ""
info "Checking project files..."
check_env_file

echo ""
echo "======================================"

if [ "$FAILED" -eq 0 ]; then
  pass "Your machine is ready to start learning n8n with this repo."
  echo ""
  echo "Next command:"
  echo "  npx n8n"
  exit 0
else
  fail "Some required checks failed. Please fix the items above before continuing."
  exit 1
fi
