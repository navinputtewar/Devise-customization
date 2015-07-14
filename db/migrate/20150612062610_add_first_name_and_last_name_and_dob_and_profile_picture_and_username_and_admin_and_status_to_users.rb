class AddFirstNameAndLastNameAndDobAndProfilePictureAndUsernameAndAdminAndStatusToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :dob, :date
    add_column :users, :profile_picture, :string
    add_column :users, :username, :string
    add_column :users, :admin, :boolean, :default => false
    add_column :users, :status, :integer, :default => 0, :limit => 1
  end
end
