#!/bin/bash
function marco {
foo=$(pwd)
export MARCO=$foo
}
function polo {
cd "$MARCO" || echo "cd error"
}
