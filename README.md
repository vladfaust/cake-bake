# Cake-Bake

[![Built with Crystal](https://img.shields.io/badge/built%20with-crystal-000000.svg?style=flat-square)](https://crystal-lang.org/)
[![Build status](https://img.shields.io/travis/com/vladfaust/cake-bake.cr/master.svg?style=flat-square)](https://travis-ci.com/vladfaust/cake-bake.cr)
[![API Docs](https://img.shields.io/badge/api_docs-online-brightgreen.svg?style=flat-square)](https://github.vladfaust.com/cake-bake.cr)
[![Releases](https://img.shields.io/github/release/vladfaust/cake-bake.cr.svg?style=flat-square)](https://github.com/vladfaust/cake-bake.cr/releases)
[![Awesome](https://awesome.re/badge-flat2.svg)](https://github.com/veelenga/awesome-crystal)
[![vladfaust.com](https://img.shields.io/badge/style-.com-lightgrey.svg?longCache=true&style=flat-square&label=vladfaust&colorB=0a83d8)](https://vladfaust.com)
[![Patrons count](https://img.shields.io/badge/dynamic/json.svg?label=patrons&url=https://www.patreon.com/api/user/11296360&query=$.included[0].attributes.patron_count&style=flat-square&colorB=red&maxAge=86400)](https://www.patreon.com/vladfaust)
[![Gitter chat](https://img.shields.io/badge/chat%20on-gitter-green.svg?colorB=ED1965&logo=gitter&style=flat-square)](https://gitter.im/vladfaust/Lobby)

Cake-Bake *[ka-ke-ba-ke]* allows to bake [Cakefile](https://github.com/axvm/cake) into native Crystal code.

## Supporters

Thanks to all my patrons, I can continue working on beautiful Open Source Software! 🙏

[Alexander Maslov](https://seendex.ru), [Lauri Jutila](https://github.com/ljuti)

*You can become a patron too in exchange of prioritized support and other perks*

[![Become Patron](https://vladfaust.com/img/patreon-small.svg)](https://www.patreon.com/vladfaust)

## About

Why? Because sometimes [cake]((https://github.com/axvm/cake)) tasks are wanted to be run as binaries.

For example, to run from a Docker container with an already built application: `docker run my-crystal-app bin/cake db:migrate`.

## Installation

Add this to your application's `shard.yml`:

```yaml
targets:
  cake:
    main: src/run/cake.cr

dependencies:
  cake-bake:
    github: vladfaust/cake-bake.cr
```

## Usage

Given `./Cakefile`:

```crystal
require "./src/some_file" # These requires

task :foo
  puts "bar"
end
```

`./src/run/cake.cr`:

```crystal
require "cake-bake"
Cake.bake("../../Cakefile") # Full path to Cakefile needed to properly resolve requires (see above)

# The Cakefile code will be put here, yay
```

Then execute from `./`:

```shell
$ crystal src/run/cake -- foo
bar

$ crystal build src/run/cake
$ ./cake foo
bar

$ shards build
$ ./bin/cake foo
bar
```

## Contributing

1. Fork it ( https://github.com/vladfaust/cake-bake.cr/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [@vladfaust](https://github.com/vladfaust) Vlad Faust - creator, maintainer
