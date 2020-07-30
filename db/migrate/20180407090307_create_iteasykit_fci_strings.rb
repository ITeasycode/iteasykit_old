class CreateIteasykitFciStrings < ActiveRecord::Migration[5.2]
  def change
    create_table :iteasykit_fci_strings do |t|
      t.references :iteasykit_fci, foreign_key: true
      t.string :fieldable_type
      t.integer :fieldable_id

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Iteasykit::FciString.create_translation_table! :value => :string
      end

      dir.down do
        Iteasykit::FciString.drop_translation_table!
      end
    end
    add_index :iteasykit_fci_strings, ["fieldable_id", "fieldable_type"], name: "fcis"
  end
end
