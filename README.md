# sadman-ishtiak.github.io

My personal website and blog.

## Quick Start (Local Development)

To run this project locally, simply run the provided script. It handles everything: installing dependencies locally (contained within this folder) and starting the server.

1.  **Run the script:**
    ```bash
    bash local_run.sh
    ```

2.  **Open your browser:**
    Go to [http://127.0.0.1:4000/](http://127.0.0.1:4000/).

---

### Manual Setup Details

If you prefer to run commands manually, here is what `local_run.sh` does:

1.  **Sets up local gem paths** to avoid using system-wide Ruby gems:
    ```bash
    export GEM_HOME="$PWD/vendor/gems"
    export PATH="$GEM_HOME/bin:$PATH"
    ```

2.  **Installs Bundler** (if missing):
    ```bash
    gem install bundler
    ```

3.  **Installs Dependencies** into `vendor/bundle`:
    ```bash
    bundle config set --local path 'vendor/bundle'
    bundle install
    ```

4.  **Runs the Server**:
    ```bash
    bundle exec jekyll serve --livereload
    ```

## Deployment

This site is deployed to GitHub Pages. The workflow is automated via GitHub Actions.

## Credits

Based on the [Chirpy](https://github.com/cotes2020/jekyll-theme-chirpy) theme.
