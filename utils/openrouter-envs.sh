#!/bin/sh
# Usage: source ./openrouter-envs.sh export|remove
# Must be sourced (not executed) for changes to affect the current shell.

_openrouter_export() {
    export OPENROUTER_API_KEY="open-router-api-key"
    export ANTHROPIC_BASE_URL="https://openrouter.ai/api"
    export ANTHROPIC_AUTH_TOKEN="$OPENROUTER_API_KEY"
    export ANTHROPIC_API_KEY=""
    export ANTHROPIC_MODEL="openrouter/free"
    echo "OpenRouter env vars exported."
}

_openrouter_remove() {
    unset OPENROUTER_API_KEY
    unset ANTHROPIC_BASE_URL
    unset ANTHROPIC_AUTH_TOKEN
    unset ANTHROPIC_API_KEY
    unset ANTHROPIC_MODEL
    echo "OpenRouter env vars removed."
}

case "$1" in
    export) _openrouter_export ;;
    remove) _openrouter_remove ;;
    *)
        echo "Usage: source $0 export|remove"
        return 1 2>/dev/null || exit 1
        ;;
esac
