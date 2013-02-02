class DropChairsTable < ActiveRecord::Migration
  def up
    drop_table :chairs
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
