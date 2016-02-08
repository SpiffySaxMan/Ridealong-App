class AddAddressToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :address, :string
  end
end
