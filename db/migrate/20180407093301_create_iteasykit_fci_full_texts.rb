class CreateIteasykitFciFullTexts < ActiveRecord::Migration[5.2]
  def change
    create_table :iteasykit_fci_full_texts do |t|
      t.string :format_field
      t.references :iteasykit_fci, foreign_key: true
      t.string :fieldable_type
      t.integer :fieldable_id

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Iteasykit::FciFullText.create_translation_table! :value => :text, shortvalue: :text
      end

      dir.down do
        Iteasykit::FciFullText.drop_translation_table!
      end
    end
    add_index :iteasykit_fci_full_texts, ["fieldable_id", "fieldable_type"], name: "fcift"
  end
end
