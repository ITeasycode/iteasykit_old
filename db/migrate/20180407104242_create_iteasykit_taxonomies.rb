class CreateIteasykitTaxonomies < ActiveRecord::Migration[5.2]
  def change
    create_table :iteasykit_taxonomies do |t|
      t.string :ancestry
      t.integer :ancestry_depth, :default => 0
      t.boolean :active
      t.integer :position
      t.boolean :blocked
      t.boolean :sticky
      t.references :iteasykit_entity_type, foreign_key: true
      t.references :iteasykit_seomore, foreign_key: true

      t.timestamps
    end
    add_index :iteasykit_taxonomies, :ancestry
  end
end
