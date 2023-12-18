module EnsureSocialSetting
  extend ActiveSupport::Concern

  # filter for checking if this feature is enabled or not before running any controller action
  included do
    before_action :ensure_social_setting_enabled
  end

  def ensure_social_setting_enabled
    raise CanCan::AccessDenied unless Flipper.enabled?(:social_setting, current_store.try(:id))
  end
end
