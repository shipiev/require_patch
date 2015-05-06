require "require_patch/version"

module RequirePatch
  def require_patch(plugin_name, *resources)
    resources.each do |resource|  
      require_dependency resource

      resource_patch = [plugin_name, [resource, 'patch'].join('_')].join('/')
      resource_constant, resource_patch_constant = [resource, resource_patch].map(&:camelize).map(&:constantize)

      resource_constant.send(:include, resource_patch_constant) unless resource_constant.included_modules.include? resource_patch_constant  
    end
  end
end

ActionDispatch::Reloader.send(:include, RequirePatch) unless ActionDispatch::Reloader.included_modules.include? RequirePatch
