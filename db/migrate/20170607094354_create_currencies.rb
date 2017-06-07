class CreateCurrencies < ActiveRecord::Migration[5.0]
  def change
    create_table :currencies do |t|
        t.string :title
        t.string :symbol
        t.float :rate
        t.timestamps
      t.timestamps
    end
  end
end
