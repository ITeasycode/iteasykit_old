class CreateIteasykitRelCells < ActiveRecord::Migration[5.2]
  def change
    create_table :iteasykit_rel_cells do |t|
      t.references :iteasykit_cell, foreign_key: true
      t.string :relable_type
      t.integer :relable_id

      t.timestamps
    end
    add_index :iteasykit_rel_cells, ["relable_type", "relable_id"], name: "relablecell"
  end
end
