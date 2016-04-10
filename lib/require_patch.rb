require 'require_patch/version'

module RequirePatch
  def self.included(base) # :nodoc:
    base.class_eval do
      # Method include patches to plugin
      # @param plugin_name [String] the plugin name
      # @param resources [Array] names of resources which will need patching
      # @param options [Hash] optional options
      # @example
      #   Rails.config.to_prepare do
      #     require_patch 'awesome_plugin', ['user', 'issue', 'user_controller', 'issue_helper']
      #   end
      def require_patch(plugin_name, resources, options = {})
        default_options = {
            dir: nil,
            prefix: nil,
            postfix: 'patch'
        }

        options = default_options.merge options

        resources.to_a.each do |resource|
          require_dependency resource unless options[:skip_require_dependency]

          patch_name = [options[:prefix], resource, options[:postfix]].select(&:present?).join('_')
          resource_patch = File.join *[plugin_name, options[:dir], patch_name].select(&:present?)
          resource_constant, resource_patch_constant = [resource, resource_patch].map(&:camelize).map(&:constantize)

          resource_constant.send(:include, resource_patch_constant) unless resource_constant.included_modules.include? resource_patch_constant
        end
      end
    end
  end
end

Kernel.send(:include, ::RequirePatch) unless Kernel.included_modules.include? ::RequirePatch
