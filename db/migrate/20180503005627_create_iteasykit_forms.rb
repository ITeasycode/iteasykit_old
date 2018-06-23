class CreateIteasykitForms < ActiveRecord::Migration[5.2]
  def change
    create_table :iteasykit_forms do |t|
      t.references :iteasykit_entity_type, foreign_key: true
      t.boolean :active
      t.boolean :sticky
      t.integer :position
      t.string :group
      t.string :machine_name
      t.references :iteasykit_seomore, foreign_key: true
      t.boolean :calc

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Iteasykit::Form.create_translation_table! :slug => {:type => :string, :null => false, :uniq => true, :index => true}
      end

      dir.down do
        Iteasykit::Form.drop_translation_table!
      end
    end
  end
end
