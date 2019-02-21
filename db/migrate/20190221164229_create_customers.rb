class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :auth_token
      t.references :address, foreign_key: true

      t.timestamps
    end
  end
end
