class AlterTimestampsForTz < ActiveRecord::Migration[5.0]
  def change
    execute <<-SQL
do
$$
declare
  l_rec record;
begin
  for l_rec in (select table_schema, table_name, column_name
                from information_schema.columns
                where table_schema = 'public'
                  and column_name = 'created_at') loop
     execute format ('alter table %I.%I alter column %I type timestamptz', l_rec.table_schema, l_rec.table_name, l_rec.column_name);
  end loop;

  for l_rec in (select table_schema, table_name, column_name
                from information_schema.columns
                where table_schema = 'public'
                  and column_name = 'updated_at') loop
     execute format ('alter table %I.%I alter column %I type timestamptz', l_rec.table_schema, l_rec.table_name, l_rec.column_name);
  end loop;
end;
$$
SQL
  end
end
