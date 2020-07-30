class CreateIteasykitCells < ActiveRecord::Migration[5.2]
  def change
    create_table :iteasykit_cells do |t|
      t.references :iteasykit_entity_type, foreign_key: true
      t.boolean :active
      t.boolean :sticky
      t.integer :position
      t.string :group
      t.string :machine_name

      t.timestamps
    end
  end
end
