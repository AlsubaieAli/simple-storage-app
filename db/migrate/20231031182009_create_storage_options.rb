class CreateStorageOptions < ActiveRecord::Migration[7.1]
  def change
    create_table :storage_options do |t|
      t.string :name

      t.timestamps
    end
    add_index :storage_options, :name, unique: true
  end
end
