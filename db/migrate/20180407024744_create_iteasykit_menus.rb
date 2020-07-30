class CreateIteasykitMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :iteasykit_menus do |t|
      t.boolean :active
      t.string :machine_name
      t.string :elementcls
      t.string :idcls
      t.string :csscls

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Iteasykit::Menu.create_translation_table! :name => :string, :description => :text
      end

      dir.down do
        Iteasykit::Menu.drop_translation_table!
      end
    end
  end
end
