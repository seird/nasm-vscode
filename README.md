[![build](https://github.com/seird/nasm-vscode/actions/workflows/build.yml/badge.svg)](https://github.com/seird/nasm-vscode/actions)


a template for a simple c + nasm vscode project


## Clone 

```bash
$ git clone https://github.com/seird/nasm-vscode.git
```


## Run

    $ make run


## Debug in vscode

Build the project and start gdb debugger in vscode (*Does not step into assembly*):

    F5

Gdb commands can be entered in the debug console, e.g.: 
    
    -exec disas main

    -exec stepi


## Debug in ddd

Build the project and launch ddd:

    $ make ddd
