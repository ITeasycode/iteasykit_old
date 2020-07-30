class CreateIteasykitBlocks < ActiveRecord::Migration[5.2]
  def change
    create_table :iteasykit_blocks do |t|
      t.string :region
      t.string :type_url
      t.text :url
      t.string :etl_type
      t.text :entity_type_lists
      t.string :machine_name
      t.boolean :active
      t.integer :position
      t.boolean :system
      t.references :iteasykit_entity_type, foreign_key: true
      t.string :elementcls
      t.string :idcls
      t.string :csscls

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Iteasykit::Block.create_translation_table! :admin_name => :string, :description_admin => :text
      end

      dir.down do
        Iteasykit::Block.drop_translation_table!
      end
    end
  end
end
