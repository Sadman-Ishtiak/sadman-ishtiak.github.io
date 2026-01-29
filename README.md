# sadman-ishtiak.github.io

My personal website and blog.

## Local Development Setup

Follow these steps to set up the project locally on your machine.

### 1. Prerequisites

Ensure you have **Ruby** installed.
```bash
ruby -v
```

### 2. Clean Global Gems (Optional)

If you have globally installed gems that might conflict or if you want a clean slate, you can uninstall them.
**Warning:** This will remove all Ruby gems installed globally on your system.

```bash
# List global gems to see what you have
gem list --local

# Uninstall all global gems
gem uninstall -a -I -x
```

### 3. Installation

This project is configured to install dependencies locally in the `vendor/bundle` directory to avoid polluting your global environment.

1.  Install Bundler (if not already installed):
    ```bash
    gem install bundler
    ```

2.  Configure Bundler to use the local `vendor/bundle` directory:
    ```bash
    bundle config set --local path 'vendor/bundle'
    ```

3.  Install dependencies:
    ```bash
    bundle install
    ```

### 4. Running the Site

You can start the local development server using the provided script or directly with bundler.

**Using the script:**
```bash
bash tools/run.sh
```

**Using Bundler directly:**
```bash
bundle exec jekyll serve
```

The site will be available at `http://127.0.0.1:4000/`.

## Deployment

This site is deployed to GitHub Pages. The workflow is automated via GitHub Actions.

## Credits

Based on the [Chirpy](https://github.com/cotes2020/jekyll-theme-chirpy) theme.