#!/usr/bin/env bash

echo "🔎 Running ALX script checks in $(pwd)..."

for file in [0-9]*-*; do
    echo "-----------------------------------"
    echo "📂 Checking: $file"

    # Check for executable permission
    if [ -x "$file" ]; then
        echo "✅ Executable"
    else
        echo "❌ NOT Executable"
    fi

    # Check shebang
    first_line=$(head -n 1 "$file")
    if [[ "$first_line" == "#!/usr/bin/env bash" ]]; then
        echo "✅ Shebang OK"
    else
        echo "❌ Missing or incorrect shebang"
    fi

    # Check final newline
    if [ -z "$(tail -c 1 "$file")" ]; then
        echo "✅ Ends with newline"
    else
        echo "❌ Missing final newline"
    fi

    # Check for syntax errors
    if bash -n "$file" 2>/dev/null; then
        echo "✅ Bash syntax OK"
    else
        echo "❌ Syntax error detected"
    fi

    echo "-----------------------------------"
done
