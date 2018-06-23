class CreateIteasykitFciImages < ActiveRecord::Migration[5.2]
  def change
    create_table :iteasykit_fci_images do |t|
      t.string :title
      t.string :alt
      t.references :iteasykit_fci, foreign_key: true
      t.string :fieldable_type
      t.integer :fieldable_id

      t.timestamps
    end
    add_index :iteasykit_fci_images, ["fieldable_id", "fieldable_type"], name: "fciim"
  end
end
