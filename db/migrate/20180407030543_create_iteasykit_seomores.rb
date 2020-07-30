class CreateIteasykitSeomores < ActiveRecord::Migration[5.2]
  def change
    create_table :iteasykit_seomores do |t|
      t.boolean :noindex
      t.boolean :nofollow
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Iteasykit::Seomore.create_translation_table! :title => :string, :keywords => :string, :description => :text, :canonical => :string,
                                                      :author => :string, :publisher => :string, :alternate => :string, :refresh => :string
      end

      dir.down do
        Iteasykit::Seomore.drop_translation_table!
      end
    end
  end
end
