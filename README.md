# RequirePatch

The gem adds a command "require_patch" that connects patches plugins. It used by my team to develop Redmine plugins

## Installation

Add this line to your application's Gemfile:

    gem 'require_patch'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install require_patch

## Usage

    plugins/awesome_plugin/lib/awesome_plugin
    plugins/awesome_plugin/lib/awesome_plugin/user_patch.rb
    plugins/awesome_plugin/lib/awesome_plugin/issue_patch.rb
    plugins/awesome_plugin/lib/awesome_plugin/user_controller_patch.rb
    plugins/awesome_plugin/lib/awesome_plugin/issue_helper_patch.rb

    # plugins/awesome_plugin/init.rb
    Rails.config.to_prepare do
        require_patch 'awesome_plugin', 'user', 'issue', 'user_controller', 'issue_helper'
    end

## Contributing

1. Fork it ( http://github.com/<my-github-username>/require_patch/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
