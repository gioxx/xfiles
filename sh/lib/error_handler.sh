#!/bin/bash
set -euo pipefail
trap 'echo "❌ Error on line $LINENO. Last command: $BASH_COMMAND"' ERR
