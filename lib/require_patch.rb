require 'require_patch/version'

module RequirePatch
  # It include patches to plugin
  # @param plugin_name [String] the plugin name
  # @param resources [Array] names of resources which will need patching
  # @param options [Hash] optional options
  # @example
  #   Rails.config.to_prepare do
  #     require_patch 'awesome_plugin', ['user', 'issue', 'user_controller', 'issue_helper']
  #   end
  def require_patch(plugin_name, resources, options = {})
    resources.to_a.each do |resource|
      require_dependency resource unless options[:skip_require_dependency]

      resource_patch = [plugin_name, [resource, 'patch'].join('_')].join('/')
      resource_constant, resource_patch_constant = [resource, resource_patch].map(&:camelize).map(&:constantize)

      resource_constant.send(:include, resource_patch_constant) unless resource_constant.included_modules.include? resource_patch_constant  
    end
  end
end

ActionDispatch::Reloader.send(:include, ::RequirePatch) unless ActionDispatch::Reloader.included_modules.include? ::RequirePatch
