#!/bin/bash
set -euo pipefail

# Stuff that should run before Django starts goes here.
# Note that waiting for the DB might be a bad idea, because you may want to run
# stuff that does not depend on the database.

exec $@
