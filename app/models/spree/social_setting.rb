class Spree::SocialSetting < ApplicationRecord
  belongs_to :store

  def self.facebook_layouts
    %w(standard button_count box_count button)
  end

  def self.facebook_verbs
    %w(like recommend)
  end

  def self.facebook_color_schemes
    %w(light dark)
  end

  def self.social_services
    %w(twitter facebook pinterest delicious reddit tumblr)
  end
end
