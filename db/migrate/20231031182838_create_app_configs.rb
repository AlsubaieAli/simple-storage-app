class CreateAppConfigs < ActiveRecord::Migration[7.1]
  def change
    create_table :app_configs do |t|
      t.references :storage_option, null: false, foreign_key: true
      t.string :local_storage_path, null: true

      t.timestamps
    end
  end
end
