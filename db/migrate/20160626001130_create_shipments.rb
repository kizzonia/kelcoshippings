class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.string :first_name
      t.string :last_name
      t.string :e_mail
      t.integer :order_id
      t.integer :country
      t.string :billing_address1
      t.string :billing_address2
      t.string :delivery_address
      t.string :delivery_address_first_name
      t.string :delivery_address_last_name
      t.integer :postcode
      t.integer :phone_number
      t.string :quntity
      t.string :tax
      t.string :notes

      t.timestamps null: false
    end
  end
end
