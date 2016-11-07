class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.references :bucketlist, foreign_key: true
      t.boolean :done, default: false

      t.timestamps null: false
    end
  end
end
