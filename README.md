# chef-joe

[![Build Status](https://travis-ci.org/cmur2/chef-joe.png)](https://travis-ci.org/cmur2/chef-joe)

## Description

Installs [JOE](http://joe-editor.sourceforge.net/) (Joe's Own Editor) and the [improved syntax files](https://github.com/cmur2/joe-syntax) if requested.

## Usage

Use `recipe[joe::default]` for simply installing JOE, and `recipe[joe::syntax]` for installing the improved syntax coloring and highlighting files for JOE.

## Requirements

### Platform

Should run on any platform (that provides a JOE package) with path adjustments - tested only for Debian.

It depends on the git cookbook.

## Recipes

### default

Not much to say here, installs the JOE package.

### syntax

Clones the [improved syntax files](https://github.com/cmur2/joe-syntax) repository to */usr/local/share/joe/syntax*, and then sets up symlinks from */usr/share/joe/syntax* (overwriting some of the previously installed files) to the cloned repository.

Finally sets up */etc/joe/ftyperc* to make the new languages available to JOE.

Most of the pathes are configurable via attributes.

## License

chef-joe is licensed under the Apache License, Version 2.0. See LICENSE for more information.
