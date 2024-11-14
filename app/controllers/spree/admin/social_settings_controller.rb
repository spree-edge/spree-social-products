module Spree
  module Admin
    class SocialSettingsController < ResourceController
      before_action :find_social_settings, only: [:edit, :update]

      def edit
        unless @social_setting = current_store.social_setting
          @social_setting =  Spree::SocialSetting.create!(store: current_store)
        end
      end

      def update
        @social_setting.update(social_setting_params)

        flash[:success] = Spree.t(:successfully_updated, resource: Spree.t(:settings, scope: :social))
        redirect_to edit_admin_social_settings_path
      end

      private

      def find_social_settings
        @social_setting = current_store.social_setting
      end

      def social_setting_params
        params.require(:social_setting).permit(:twitter_button, :facebook_button, :pinterest_button,
                                              :pinterest_button, :reddit_button, :tumblr_button,
                                              :facebook_show_faces, :facebook_send_button,
                                              :facebook_app_id, :facebook_layout,
                                              :facebook_verb_to_display, :facebook_color_scheme,
                                              :twitter_id, :delicious_button).merge(store: current_store)
      end
    end
  end
end
