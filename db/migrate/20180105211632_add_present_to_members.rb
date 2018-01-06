class AddPresentToMembers < ActiveRecord::Migration
  def change
    add_column :members, :present, :boolean
  end
end
