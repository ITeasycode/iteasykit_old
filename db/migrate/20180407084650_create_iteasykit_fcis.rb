class CreateIteasykitFcis < ActiveRecord::Migration[5.2]
  def change
    create_table :iteasykit_fcis do |t|
      t.string :elementcls
      t.string :idcls
      t.string :classcls
      t.string :machine_name
      t.string :type_fci
      t.boolean :active
      t.boolean :is_required
      t.integer :position
      t.boolean :is_filter
      t.boolean :is_multi
      t.string :fciable_type
      t.integer :fciable_id

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Iteasykit::Fci.create_translation_table! :name => :string, :help => :text, placeholder: :string, value: :text,
                                                 prefix: :string, suffix: :string
      end

      dir.down do
        Iteasykit::Fci.drop_translation_table!
      end
    end

    add_index :iteasykit_fcis, ["fciable_type", "fciable_type"], name: "fci"
  end
end
