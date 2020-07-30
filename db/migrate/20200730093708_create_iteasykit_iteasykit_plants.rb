class CreateIteasykitIteasykitPlants < ActiveRecord::Migration[5.2]
  def change
    create_table :iteasykit_plants do |t|
      t.boolean :active

      t.timestamps
    end


    reversible do |dir|
      dir.up do
        Iteasykit::Plant.create_translation_table! :site => :string, :phone => :string, :address_map => :string, :geodanniye => :string,
                                                      :country => :string, :email => :string, :cordinates => :string
      end

      dir.down do
        Iteasykit::Plant.drop_translation_table!
      end
    end
  end
end
