Autoparts - A Package Manager for Nitrous.IO
============================================

## EXPERIMENTAL - WORK IN PROGRESS

### Installation

1. Check out Autoparts into `~/.parts/autoparts`

   ```sh
   $ git clone https://github.com/action-io/autoparts.git ~/.parts/autoparts
   ```

2. Run bundler in `~/.parts/autoparts`

    ```sh
    $ cd ~/.parts/autoparts
    .parts/autoparts $ bundle install --path .bundle
    ```

3. Add `~/.parts/autoparts/bin` to your `$PATH` for access to the
   `parts` command-line utility.

    **bash:**
    ```sh
    $ echo 'export PATH="$HOME/.parts/autoparts/bin:$PATH"' >> ~/.bash_profile
    ```

    **zsh:**
    ```sh
    $ echo 'export PATH="$HOME/.parts/autoparts/bin:$PATH"' >> ~/.zshrc
    ```

4. Add `parts init` to your shell to load environment variables required
   by Autoparts.

    **bash:**
    ```sh
    $ echo 'eval "$(parts init -)"' >> ~/.bash_profile
    ```

    **zsh:**
    ```sh
    $ echo 'eval "$(parts init -)"' >> ~/.zshrc
    ```

5. Restart your shell to load changes.
    You can now begin using Autoparts.

    ```sh
    $ exec $SHELL -l
    ```

### TODO

* Install Script
* Dependency Tracking (dsl: depends\_on)
* Package mutual exclusion (dsl: conflicts\_with)
* don't move download if sha1 verification fails

Copyright (c) 2013 Irrational Industries Inc.
This software is licensed under the BSD 2-Clause license.
