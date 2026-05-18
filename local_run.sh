#!/bin/bash
set -e

# 1. Setup local gem environment (install gems here instead of system-wide)
export GEM_HOME="$PWD/vendor/gems"
export PATH="$GEM_HOME/bin:$PATH"

echo "=> Using local gem directory: $GEM_HOME"

# 2. Define the local bundler path explicitly
BUNDLE_BIN="$GEM_HOME/bin/bundle"

# 3. Install Bundler locally if not found
if [ ! -f "$BUNDLE_BIN" ]; then
    echo "=> Bundler not found at $BUNDLE_BIN. Installing locally..."
    gem install bundler
fi

# 4. Configure Bundler to install project dependencies into vendor/bundle
echo "=> Configuring Bundler..."
"$BUNDLE_BIN" config set --local path 'vendor/bundle'

# 5. Install dependencies defined in Gemfile
echo "=> Installing dependencies..."
"$BUNDLE_BIN" install

# 6. Run the Jekyll site
echo "=> Starting Jekyll server..."
echo "   Site will be available at http://127.0.0.1:4000"
"$BUNDLE_BIN" exec jekyll serve --livereload
