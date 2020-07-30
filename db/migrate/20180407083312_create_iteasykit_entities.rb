class CreateIteasykitEntities < ActiveRecord::Migration[5.2]
  def change
    create_table :iteasykit_entities do |t|
      t.string :machine_name
      t.references :iteasykit_entity_type, foreign_key: true
      t.boolean :active
      t.boolean :sticky
      t.references :iteasykit_seomore, foreign_key: true

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Iteasykit::Entity.create_translation_table! :slug => {:type => :string, :null => false, :uniq => true, :index => true}
      end

      dir.down do
        Iteasykit::Entity.drop_translation_table!
      end
    end
  end
end
