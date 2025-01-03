Rails.application.config.after_initialize do
  if Spree::Core::Engine.backend_available?
      Rails.application.config.spree_backend.main_menu.add_to_section('settings',
      ::Spree::Admin::MainMenu::ItemBuilder.new('social.settings', ::Spree::Core::Engine.routes.url_helpers.edit_admin_social_settings_path).
        with_manage_ability_check(::Spree::SocialSetting).
        with_match_path('/admin/social_settings/edit').
        build
      )
  end
end
