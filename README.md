# Cake-Bake

Cake-Bake *[ka-ke-ba-ke]* allows to bake [Cakefile](https://github.com/axvm/cake) into native Crystal code.

## Why?

Because sometimes [cake]((https://github.com/axvm/cake)) tasks are wanted to be run as binaries.

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
