class AddFieldToMoreBase < ActiveRecord::Migration[5.2]
  def change
    add_column :iteasykit_taxonomies, :machine_name, :string
    add_column :iteasykit_entity_types, :id_title_fci, :integer

    reversible do |dir|
      dir.up do
        Iteasykit::Taxonomy.create_translation_table! :slug => {:type => :string, :null => false, :uniq => true, :index => true}
      end

      dir.down do
        Iteasykit::Taxonomy.drop_translation_table!
      end
    end
  end
end
