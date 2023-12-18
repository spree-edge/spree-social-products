class CreateSpreeSocialSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_social_settings do |t|
      t.boolean :twitter_button, default: true
      t.boolean :tumblr_button, default: false
      t.boolean :pinterest_button, default: true
      t.boolean :facebook_button, default: false
      t.boolean :delicious_button, default: false
      t.boolean :reddit_button, default: false
      t.string :facebook_app_id
      t.string :facebook_layout, default: 'standard'
      t.boolean :facebook_show_faces, default: false
      t.string :facebook_verb_to_display, default: 'like'
      t.string :facebook_color_scheme, default: 'light'
      t.boolean :facebook_send_button, default: false
      t.string :twitter_id
      t.integer :store_id
      t.timestamps
    end
  end
end
