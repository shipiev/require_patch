require 'require_patch/version'

module RequirePatch
  # It include patches to plugin
  # @param plugin_name [String] the plugin name
  # @param *resources [String] names of resources which will need patching
  # @example
  #   Rails.config.to_prepare do
  #     require_patch 'awesome_plugin', 'user', 'issue', 'user_controller', 'issue_helper'
  #   end
  def require_patch(plugin_name, *resources)
    resources.each do |resource|  
      begin
        require_dependency resource
      rescue LoadError
        Rails.logger.warn "Can't find '#{resource}' for require_dependency"
      end

      resource_patch = [plugin_name, [resource, 'patch'].join('_')].join('/')
      resource_constant, resource_patch_constant = [resource, resource_patch].map(&:camelize).map(&:constantize)

      resource_constant.send(:include, resource_patch_constant) unless resource_constant.included_modules.include? resource_patch_constant  
    end
  end
end

ActionDispatch::Reloader.send(:include, ::RequirePatch) unless ActionDispatch::Reloader.included_modules.include? ::RequirePatch
