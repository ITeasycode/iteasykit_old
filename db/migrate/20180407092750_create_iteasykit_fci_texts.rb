class CreateIteasykitFciTexts < ActiveRecord::Migration[5.2]
  def change
    create_table :iteasykit_fci_texts do |t|
      t.references :iteasykit_fci, foreign_key: true
      t.string :fieldable_type
      t.integer :fieldable_id

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Iteasykit::FciText.create_translation_table! :value => :text
      end

      dir.down do
        Iteasykit::FciText.drop_translation_table!
      end
    end
    add_index :iteasykit_fci_texts, ["fieldable_id", "fieldable_type"], name: "fcit"
  end
end
