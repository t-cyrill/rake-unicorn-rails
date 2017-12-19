# Rake::Unicorn::Rails

Unicorn start/stop task.

## Requirement

* Rails ~> 4.2, < 5.2
* rake ~> 12.0

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rake-unicorn-rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rake-unicorn-rails

## Usage

```
rake -T

rake unicorn:force_stop                   # Stop unicorn immediately (Send TERM signal)
rake unicorn:reload                       # Restart unicorn (Send USR2 signal)
rake unicorn:restart                      # Restart unicorn (stop/start)
rake unicorn:start                        # Start unicorn
rake unicorn:stop                         # Stop unicorn gracefully (Send QUIT signal)
```

### Override configrations

You can override unicorn configration path, BUNDLE_GEMFILE_PATH. i.e) in `config/environments/development.rb`

```
config.x.unicorn.config_path = Rails.root.join('config/unicorn/development.rb').to_s
config.x.unicorn.bundle_gemfile_path = Rails.root.join('Gemfile').to_s
```

## Development

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version.

