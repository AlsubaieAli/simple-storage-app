class CreateAwsStores < ActiveRecord::Migration[7.1]
  def change
    create_table :aws_stores do |t|
      t.string :url
      t.string :bucket

      t.timestamps
    end
  end
end
