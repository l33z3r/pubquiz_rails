class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider, index: true
      t.string :uid, index: true
      t.string :name, index: true
      t.string :email, index: true
      t.string :image
      t.string :oauth_token, index: true
      t.datetime :oauth_expires_at

      t.timestamps
    end
  end
end
