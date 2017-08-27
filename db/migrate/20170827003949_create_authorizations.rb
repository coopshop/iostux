class CreateAuthorizations < ActiveRecord::Migration[5.0]
  def change
    create_table :authorizations do |t|
      t.string :provider, null: false, default: 'discord'
      t.integer :user_id, null: false
      t.string :uid, null: false

      t.timestamps
    end

    add_foreign_key 'public.authorizations.user_id', 'public.users.id', column: :user_id, on_delete: :cascade
  end
end
