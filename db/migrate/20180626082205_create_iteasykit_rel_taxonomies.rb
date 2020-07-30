class CreateIteasykitRelTaxonomies < ActiveRecord::Migration[5.2]
  def change
    create_table :iteasykit_rel_taxonomies do |t|
      t.references :iteasykit_taxonomy, foreign_key: true
      t.string :relable_type
      t.integer :relable_id

      t.timestamps
    end
  end
end
