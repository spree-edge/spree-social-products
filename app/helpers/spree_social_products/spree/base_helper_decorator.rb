module SpreeSocialProducts
  module Spree
    module BaseHelperDecorator
      def pin_it_button(product)
        return if product.images.empty?

        url = CGI.escape(spree.product_url(@product))
        media = absolute_product_image(product.images.first)
        description = CGI.escape(@product.name)

        link_to('Pin It',
                "http://pinterest.com/pin/create/button/?url=#{url}&media=#{media}&description=#{description}",
                class: 'pin-it-button',
                'count-layout' => 'none').html_safe
      end

      def absolute_product_image(image)
        escape absolute_image_url(main_app.rails_blob_path(image.attachment, only_path: true))
      end

      def absolute_image_url(product)
        image_url = begin
                      main_app.rails_blob_path(@product.images.first.attachment, only_path: true)
                    rescue
                      ''
                    end

        return image_url if image_url.starts_with? 'http'
        request.protocol + request.host + image_url
      end

      private

      def escape(string)
        URI.encode_www_form_component(string)
      end
    end
  end
end

::Spree::BaseHelper.prepend SpreeSocialProducts::Spree::BaseHelperDecorator
