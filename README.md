# SampleByRate

Method to do sampling for `Enumerable` objects in specified rate.

```ruby
# Prints 10% of numbers in (1..100000)
(1..100000).sample_by_rate(0.1).each do |n|
  puts n
end
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sample_by_rate'
```

Or if you want to import `sample_by_rate` method into `Enumerable` module by default, Add this line.

```ruby
gem 'sample_by_rate', require: 'sample_by_rate/core_ext'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sample_by_rate

## Usage

### Importing sample_by_rate method into some Enumerable class

```ruby
class SomeEnumerableClass
  include SampleByRate
end
```

### Importing sample_by_rate method into Enumerable module by default

Recommended way is to specify in `Gemfile` which explained in `Installation` section above.

Or do like below manually.

```ruby
require 'sample_by_rate/core_ext'
```

## Contributing

1. Fork it ( https://github.com/yuya-takeyama/sample_by_rate/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
