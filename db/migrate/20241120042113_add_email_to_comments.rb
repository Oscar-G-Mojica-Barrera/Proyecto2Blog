class AddEmailToComments < ActiveRecord::Migration[7.2]
  def change
    add_column :comments, :email, :string
  end
end
