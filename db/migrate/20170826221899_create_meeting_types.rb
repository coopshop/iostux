class CreateMeetingTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :meeting_types do |t|
      # t.meeting_type :name, null: false
      t.decimal :price

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        execute <<-SQL
        CREATE TYPE meeting_type AS ENUM (
          'coachee_pass',
          'consultation',
          'individual_coaching',
          'rank_evaluation',
          'team_coaching'
        );
        ALTER TABLE meeting_types ADD COLUMN name meeting_type NOT NULL;
        SQL
      end

      dir.down do
        execute <<-SQL
          ALTER TABLE meeting_types DROP COLUMN name;
          DROP TYPE meeting_type;
        SQL
      end
    end

  end
end
