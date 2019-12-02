# Raylib

This is a more ruby-like interface for the great [raylib](https://www.raylib.com) library.

## Compile raylib

Recommended Ubuntu, Raspbian install:
```bash
$ sudo apt install build-essential
$ sudo apt install cmake
$ sudo apt install libasound2-dev mesa-common-dev libx11-dev libxrandr-dev libxi-dev xorg-dev libgl1-mesa-dev libglu1-mesa-dev
$ wget https://github.com/raysan5/raylib/archive/2.5.0.tar.gz
$ tar xvfz 2.5.0.tar.gz
$ cd raylib-2.5.0
$ mkdir build
$ cd build
$ cmake -DSHARED=ON -DSTATIC=ON ..    # note the two dots
$ make -j 4
$ sudo make -j4 install
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'raylib'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install raylib

## Usage

Please see the ported [examples](https://github.com/a0/raylib-ruby/tree/master/examples) for usage.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/a0/raylib-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Raylib project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/a0/raylib-ruby/blob/master/CODE_OF_CONDUCT.md).
