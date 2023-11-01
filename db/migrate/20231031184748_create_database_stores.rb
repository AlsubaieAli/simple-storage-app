class CreateDatabaseStores < ActiveRecord::Migration[7.1]
  def change
    create_table :database_stores do |t|
      t.text :data

      t.timestamps
    end
  end
end
