class CreateGatherings < ActiveRecord::Migration
  def change
    create_table :gatherings do |t|
      t.text :families
      t.timestamps
    end
  end
end
