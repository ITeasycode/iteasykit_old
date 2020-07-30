class CreateIteasykitFciBooleans < ActiveRecord::Migration[5.2]
  def change
    create_table :iteasykit_fci_booleans do |t|
      t.boolean :value
      t.references :iteasykit_fci, foreign_key: true
      t.string :fieldable_type
      t.integer :fieldable_id

      t.timestamps
    end

    add_index :iteasykit_fci_booleans, ["fieldable_id", "fieldable_type"], name: "fcib"
  end
end
