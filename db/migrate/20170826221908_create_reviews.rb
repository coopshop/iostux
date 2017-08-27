class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :meeting_id, null: false, index: true
      t.string :review_text
      t.timestamps
    end
  end
end
