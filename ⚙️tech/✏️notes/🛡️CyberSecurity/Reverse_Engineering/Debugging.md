# gdb
[cheatsheet](https://cs.brown.edu/courses/cs033/docs/guides/gdb.pdf)
## Common Commands
### breakpoints
> get breakpoints: `i[nfo] b[reakpoint]`
> set breakpoint at symbol: `b[reakpoint] <symbol>` e.g. `b main`
> set breakpoint at address: `b[reakpoint] *<address>` e.g. `b *0x0800ffcc*`
> delete all: `d[elete] br[reakpoint]`
> disable/enable: `disab[le] b[reakpoints] <range>`
### set file
`fil[e] <file path>`
### decompile to assembly
`layout asm`
### run file
`r[un]`
### runtime commands
> next instruction: `n[ext] i[nstruction]`
> continue: `c[ontinue]`
