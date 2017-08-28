class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :meeting_id, null: false, index: true, unique: true
      t.string :review_text, null: false
      t.timestamps default: -> { "now()" }
    end

    add_foreign_key :reviews, :meetings

  end
end
