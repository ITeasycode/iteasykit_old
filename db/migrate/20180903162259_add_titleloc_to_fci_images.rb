class AddTitlelocToFciImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :iteasykit_fci_images, :title
    remove_column :iteasykit_fci_images, :alt

    reversible do |dir|
      dir.up do
        Iteasykit::FciImage.create_translation_table! :title => :string, :alt => :string
      end

      dir.down do
        Iteasykit::FciImage.drop_translation_table!
      end
    end
  end
end
