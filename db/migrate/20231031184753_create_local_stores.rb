class CreateLocalStores < ActiveRecord::Migration[7.1]
  def change
    create_table :local_stores do |t|
      t.string :path
      t.string :name

      t.timestamps
    end
  end
end
