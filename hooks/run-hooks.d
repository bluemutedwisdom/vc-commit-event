#!/bin/sh
#
# An example hook script for the "post-receive" event.
#
# The "post-receive" script is run after receive-pack has accepted a pack
# and the repository has been updated.  It is passed arguments in through
# stdin in the form
#  <oldrev> <newrev> <refname>
# For example:
#  aa453216d1b3e49e7f6f98441fa56946ddcd6a20 68f7abf4e6f922807889f52bc043ecd31b79f814 refs/heads/master
#
# see contrib/hooks/ for a sample, or uncomment the next line and
# rename the file to "post-receive".

T=$(tempfile) || exit 1

cleanup() {
    rm -f "$T"
}

cat - > "$T"
echo "T:"
cat "$T"
echo "---------"

trap cleanup EXIT

run_hook () {
    HOOK="$1"
    printf "Running: ${HOOK} "
    $GIT_DIR/hooks/hooks.d/post-receive.d/$HOOK
    local exit_code=$?
    if [ $exit_code -eq 0 ]; then
	printf "success\n"
    else
	printf "failure (exit ${exit_code})\n"
    fi
}
 
hooks=$(git config --get hooks.run)
if [ -n "$hooks" ]; then
    printf "Running hooks:\n"
    for hook in $hooks; do
	run_hook $hook < $T
    done
fi
