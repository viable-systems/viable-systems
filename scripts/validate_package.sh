#\!/bin/bash
# Validate package before publishing to Hex.pm

set -e

echo "🔍 Validating vsm-goldrush package..."
echo ""

# Check if we're in the right directory
if [ \! -f "mix.exs" ]; then
    echo "❌ Error: mix.exs not found. Run this script from the project root."
    exit 1
fi

# Run tests
echo "📋 Running tests..."
mix test
echo "✅ Tests passed"
echo ""

# Check formatting
echo "🎨 Checking code formatting..."
mix format --check-formatted
echo "✅ Code is properly formatted"
echo ""

# Compile with warnings as errors
echo "🔨 Compiling with warnings as errors..."
mix compile --warnings-as-errors
echo "✅ No compiler warnings"
echo ""

# Run Credo
echo "📊 Running Credo..."
mix credo --strict
echo "✅ Credo analysis passed"
echo ""

# Run Dialyzer (if PLTs exist)
if [ -d "priv/plts" ]; then
    echo "🔬 Running Dialyzer..."
    mix dialyzer
    echo "✅ Dialyzer passed"
    echo ""
else
    echo "⚠️  Skipping Dialyzer (no PLTs found)"
    echo ""
fi

# Build docs
echo "📚 Building documentation..."
mix docs
echo "✅ Documentation built successfully"
echo ""

# Build package
echo "📦 Building Hex package..."
mix hex.build
echo "✅ Package built successfully"
echo ""

# Show package info
echo "📋 Package information:"
mix hex.info
echo ""

echo "🎉 All validation checks passed\! Package is ready for publishing."
echo ""
echo "To publish, run: mix hex.publish"
EOF < /dev/null