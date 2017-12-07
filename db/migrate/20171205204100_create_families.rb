class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.text  :members
      t.timestamps
    end
  end
end
