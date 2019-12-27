#!/bin/sh

set -e

./bin/portishead eval "Portishead.Release.migrate"
./bin/portishead start
