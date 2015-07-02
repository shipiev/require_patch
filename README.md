# RequirePatch

The gem adds a command "require_patch" that includes plugin patches. It used by my team to develop Redmine plugins

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
    plugins/awesome_plugin/lib/awesome_plugin/users_controller_patch.rb
    plugins/awesome_plugin/lib/awesome_plugin/issues_helper_patch.rb
    plugins/awesome_plugin/lib/awesome_plugin/form/builder_patch.rb

    # plugins/awesome_plugin/init.rb
    Rails.config.to_prepare do
        require_patch 'awesome_plugin', %w{user issue users_controller issues_helper}
        require_patch 'awesome_plugin', ['form/builder'], skip_require_dependency: true
        # or require_patch 'awesome_plugin', 'form/builder', skip_require_dependency: true
    end

## Contributing

1. Fork it ( http://github.com/<my-github-username>/require_patch/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
