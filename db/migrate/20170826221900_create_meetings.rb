class CreateMeetings < ActiveRecord::Migration[5.0]
  def change
    create_table :meetings do |t|
      t.timestamp :start_time, null: false
      t.timestamp :end_time, null: false
      t.boolean :completed
      t.integer :coachee_id, index: true
      t.integer :coach_id, index: true
      t.string :notes
      t.integer :meeting_type_id, null: false, index: true
      t.timestamps default: -> { "now()" }
    end

    add_foreign_key :meetings, :users, column: :coachee_id
    add_foreign_key :meetings, :users, column: :coach_id
    add_foreign_key :meetings, :meeting_types

  end
end
