class CreateAuthorizations < ActiveRecord::Migration[5.0]
  def change
    create_table :authorizations do |t|
      t.string :provider, null: false, default: 'discord'
      t.integer :user_id, null: false
      t.string :uid, null: false

      t.timestamps default: -> { "(now() at time zone 'utc')" }
    end

    add_foreign_key :authorizations, :users
  end
end
