class CreateIteasykitPartners < ActiveRecord::Migration[5.2]
  def change
    create_table :iteasykit_partners do |t|

      t.boolean :active

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Iteasykit::Partner.create_translation_table! :name => :string, :site => :string, :phone => :text, :address => :string,
                                                      :city_ukr => :string, :city_mold => :string, :coordinates => :string
      end

      dir.down do
        Iteasykit::Partner.drop_translation_table!
      end
    end
  end
end
