# Type a script or drag a script file from your workspace to insert its path.
if [[ "$(uname -m)" == arm64 ]]
then
    export PATH="/opt/homebrew/bin:$PATH"
fi

CONFIG_PATH="$1"

if command -v swiftlint >/dev/null 2>&1
then
    swiftlint lint --config "$CONFIG_PATH"
else
    echo "warning: \`swiftlint\` command not found - See https://github.com/realm/SwiftLint#installation for installation instructions."
fi