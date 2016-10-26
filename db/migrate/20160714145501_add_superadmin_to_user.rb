class AddSuperadminToUser < ActiveRecord::Migration
  def change
   add_column :users, :superadmin, :boolean, :null => false, :default => false

   User.create! do |r|
     r.email      = 'Admin@kelcoshippings.com'
     r.password   = 'kizzonia1'
     r.superadmin = true
   end

   end
end
