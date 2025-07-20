#!/bin/bash
# Set up VSM components as git submodules

echo "Setting up VSM components as git submodules..."

# Add each VSM component as a submodule
git submodule add https://github.com/viable-systems/vsm-starter.git vsm-starter
git submodule add https://github.com/viable-systems/vsm-telemetry.git vsm-telemetry
git submodule add https://github.com/viable-systems/vsm-goldrush.git vsm-goldrush
git submodule add https://github.com/viable-systems/vsm-rate-limiter.git vsm-rate-limiter
git submodule add https://github.com/viable-systems/vsm-docs.git vsm-docs

# Initialize and update submodules
git submodule update --init --recursive

echo "All VSM components have been added as submodules!"
echo ""
echo "To update all submodules in the future, run:"
echo "  git submodule update --remote --merge"