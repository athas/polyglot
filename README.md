# polyglot

[![Build Status](https://travis-ci.org/vmchale/polyglot.svg?branch=master)](https://travis-ci.org/vmchale/polyglot)

`poly` is a command-line tool that determines project contents.
The goal is to able to point it to any directory and get an accurate,
complete, and informative summary of its contents.

<img alt="Screenshot of sample output" src=https://github.com/vmchale/polyglot/raw/master/screenshot.png>

It also has the secondary goal of advancing the state-of-the art for ATS, by
writing practical, distributable software and supporting tooling.

## Pitch

Reasons to use polyglot:

  * Accurate: won't confuse Coq and Verilog
  * Fast: polyglot is faster than all other tools
  * Pretty: magenta output

Reasons not to use polyglot:

  * It's written in ATS
  * No regex-based exclusions
  * Best on Linux

### Benchmarks

On the Rust repo:

<table>
  <tr>
    <th>Tool</th>
    <th>Language</th>
    <th>Time</th>
  </tr>
  <tr>
    <td><code>polyglot</code></td>
    <td>ATS</td>
    <td>140.6 ms</td>
  </tr>
  <tr>
    <td><code>loc</code></td>
    <td>Rust</td>
    <td>172.9 ms</td>
  </tr>
  <tr>
    <td><code>tokei</code></td>
    <td>Rust</td>
    <td>297.8 ms</td>
  </tr>
  <tr>
    <td><code>scc</code></td>
    <td>Go</td>
    <td>452.0 ms</td>
  </tr>
  <tr>
    <td><code>gocloc</code></td>
    <td>Go</td>
    <td>844.2 ms</td>
  </tr>
  <tr>
    <td><code>cloc</code></td>
    <td>Perl</td>
    <td>17.36 s</td>
  </tr>
  <tr>
    <td><code>linguist</code></td>
    <td>Ruby</td>
    <td>17.73 s</td>
  </tr>
</table>

### Heuristics

Polyglot distinguishes itself from `tokei`, `gocloc`, `scc`, and `loc` by being able to disambiguate file names.
Thus, `poly` will not confuse Happy for Yacc (for instance).

## Installation

### From a Script

The easiest way to install is to use the installation script, like so:

```bash
curl -sSl https://raw.githubusercontent.com/vmchale/polyglot/master/bash/install.sh | bash -s
```

You may need to add `$HOME/.local/bin` to your `PATH` and
`$HOME/.local/share/man/man1` to your `MANPATH`.

You can optionally install [compleat](https://github.com/mbrubeck/compleat) for
shell completions as well.

### Vim Plugin

There is a [vim plugin](https://github.com/vmchale/polyglot-vim) available which
can count lines of code in a project.

## From Source

You can install [ats-pkg](http://hackage.haskell.org/package/ats-pkg)
with

```bash
curl -sSl https://raw.githubusercontent.com/vmchale/atspkg/master/bash/install.sh | bash -s
```

And install `poly` with

```bash
atspkg remote https://github.com/vmchale/polyglot/archive/master.zip --pkg-args '{ cross = False, parallel = True, static = True, icc = False }'
```

### Documentation

You can view manpages for `poly` with

```
man poly
```

## Contents

```
-------------------------------------------------------------------------------
 Language             Files       Lines         Code     Comments       Blanks
-------------------------------------------------------------------------------
 ATS                     10        2272         2157           32           83
 Dhall                    4          92           79            0           13
 Justfile                 1          53           47            1            5
 Markdown                 4         426          359            0           67
 TOML                     1           3            3            0            0
 YAML                     1          67           59            0            8
-------------------------------------------------------------------------------
 Total                   21        2913         2704           33          176
-------------------------------------------------------------------------------
```
