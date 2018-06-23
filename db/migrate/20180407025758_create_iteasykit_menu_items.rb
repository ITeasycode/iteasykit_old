class CreateIteasykitMenuItems < ActiveRecord::Migration[5.2]
  def change
    create_table :iteasykit_menu_items do |t|
      t.string :itemable_type
      t.integer :itemable_id
      t.references :iteasykit_menu, foreign_key: true
      t.string :ancestry
      t.integer :ancestry_depth, :default => 0
      t.boolean :active
      t.integer :position
      t.boolean :blocked
      t.string :elementcls
      t.string :idcls
      t.string :csscls

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Iteasykit::MenuItem.create_translation_table! :name => :string, :title => :string, :url => :string
      end

      dir.down do
        Iteasykit::MenuItem.drop_translation_table!
      end
    end
    add_index :iteasykit_menu_items, ["itemable_type", "itemable_type"], name: "ib"
    add_index :iteasykit_menu_items, :ancestry
  end
end
