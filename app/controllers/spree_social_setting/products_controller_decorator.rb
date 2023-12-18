module SpreeSocialSetting
  module ProductsControllerDecorator
    def self.prepended(base)
      base.before_action :find_social_settings
    end

    private

    def find_social_settings
      @social_setting = current_store.social_setting
    end
  end
end

::Spree::ProductsController.prepend SpreeSocialSetting::ProductsControllerDecorator
