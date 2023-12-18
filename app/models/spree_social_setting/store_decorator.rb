module SpreeSocialSetting
  module StoreDecorator
    def self.prepended(base)
      base.has_one :social_setting
    end

  end
end

::Spree::Store.prepend SpreeSocialSetting::StoreDecorator
