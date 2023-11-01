class CreateStorageRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :storage_records do |t|
      t.references :storable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
