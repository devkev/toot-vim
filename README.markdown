### Quick install

    git clone git://github.com/devkev/toot-vim.git
    cd toot-vim
    cp -R * ~/.vim

This plugin gives syntax highlighting to Toot format todo files. It also defines a few mappings, to help with editing these files:

Mark as done:  
`<localleader>x`   Mark current task as done  
`<localleader>y`   Mark current task as done
`<localleader>n`   Mark current task as won't do
`<localleader>D`   Move completed tasks to `done` file

This plugin detects any text file with the name `todo` or `done` with an optional prefix that ends in a period (e.g. `second.todo`, `example.done`).

If you want the help installed, run `:helptags ~/.vim/doc` inside vim after having copied the files.
Then you will be able to get the commands help with `:h toot`.
