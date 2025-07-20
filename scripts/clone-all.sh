#!/bin/bash
# Clone all VSM component repositories

echo "Setting up Viable Systems components..."

# Create a function to clone or update a repository
clone_or_update() {
    local repo_name=$1
    
    if [ -d "$repo_name" ]; then
        echo "Updating $repo_name..."
        cd "$repo_name"
        git pull
        cd ..
    else
        echo "Cloning $repo_name..."
        gh repo clone "viable-systems/$repo_name"
    fi
}

# Clone all VSM components
clone_or_update "vsm-starter"
clone_or_update "vsm-telemetry"
clone_or_update "vsm-goldrush"
clone_or_update "vsm-rate-limiter"
clone_or_update "vsm-docs"

echo "All VSM components have been set up!"
echo ""
echo "To start using VSM, try:"
echo "  cd vsm-starter"
echo "  mix deps.get"
echo "  mix test"