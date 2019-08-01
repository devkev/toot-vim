Based on https://github.com/freitass/todo.txt-vim, but much lighter (simpler format/controls).

### Quick install

    git clone git://github.com/devkev/toot-vim.git
    cd toot-vim
    cp -R * ~/.vim

This plugin gives syntax highlighting to Toot format todo files. It also defines a few mappings, to help with editing these files:

Task completion:
`<localleader>x`   Mark current task as done
`<localleader>y`   Mark current task as done
`<localleader>d`   Mark current task as done
`<localleader>n`   Mark current task as won't do
`<localleader>D`   Move completed tasks to `done` file

New lines:
`o`                Start editing new line below with leading "- "
`O`                Start editing new line above with leading "- "

Moving lines:
`J`                Move line(s) down
`K`                Move line(s) up
`<C-J>`            Move line(s) to next heading
`<C-K>`            Move line(s) to previous heading

This plugin detects any text file with the name `todo` or `done` with an optional prefix that ends in a period (e.g. `second.todo`, `example.done`).

If you want the help installed, run `:helptags ~/.vim/doc` inside vim after having copied the files.
Then you will be able to get the commands help with `:h toot`.
