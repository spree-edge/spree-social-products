module SpreeSocialProducts
  module Spree
    module StoreDecorator
      def self.prepended(base)
        base.has_one :social_setting
      end
    end
  end
end

::Spree::Store.prepend SpreeSocialProducts::Spree::StoreDecorator
