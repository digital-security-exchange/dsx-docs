# DSX Documentation

**[docs.dsx.us](http://docs.dsx.us)**

## Setup

### MacOS

1. Open a terminal
2. If you do not have homebrew installed, [install homebrew](https://brew.sh/)
3. Change to the folder where you have the `dsx-docs` repo cloned
   You can do this by opening the folder in Finder and dragging it onto the
   Terminal icon in the dock.
4. From inside the dsx-docs folder runt the setup command
    ```bash
    make macos_setup
    ```
    Once it completes you should see a message stating that setup is complete.

Continue to "Editing the docs" section

### Linux - debian based

```bash
# install python and virtenv wrapper
apt install python3 virtualenvwrapper

# add virtenv wrapper config to bashrc
# if you use another shell, modify accordingly
echo 'source /usr/share/virtualenvwrapper/virtualenvwrapper.sh' >> ~/.bashrc

# source bashrc to pickup changes
source ~/.bashrc

# create the virtualenv
mkvirtualenv --python=/usr/bin/python3 -r requirements.txt  dsx-docs
```

Continue to "Editing the docs" section

### Editing the docs

### MacOS

1. Change to the folder where you have the `dsx-docs` repo cloned
   You can do this by opening the folder in Finder and dragging it onto the
   Terminal icon in the dock.
2. Start a local http server to view your changes to the documentation live
    ```bash
    make serve
    ```
3. Open your browser to: http://127.0.0.1:8000/

### Linux - debian based

Start a local http server to view your changes to the documentation live

```bash
mkdocs serve
```

Open your browser to: http://127.0.0.1:8000/

### Publishing the docs


When you are ready to publish the docs:

1. Add and commit all changes to the git repo
2. If you are not on the master branch, then merge your commits into master
3. Run `make deploy`

View the docs at [docs.dsx.us](http://docs.dsx.us)

## Copyright / License

Copyright © 2019 [Digital Security Exchange](https://dsx.us).

[![Creative Commons License](https://i.creativecommons.org/l/by-sa/4.0/80x15.png)](http://creativecommons.org/licenses/by-sa/4.0/)

This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/).
