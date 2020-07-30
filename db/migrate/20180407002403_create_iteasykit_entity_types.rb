class CreateIteasykitEntityTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :iteasykit_entity_types do |t|
      t.string :machine_name
      t.string :rel_model
      t.boolean :active
      t.boolean :nesting
      t.boolean :relation
      t.boolean :path_root_url
      t.boolean :comment
      t.boolean :position

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Iteasykit::EntityType.create_translation_table! :name => :string, :description => :text, :help => :text
      end

      dir.down do
        Iteasykit::EntityType.drop_translation_table!
      end
    end
  end
end
