class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :image
      t.string :title
      t.text :description
      t.integer :user_id
      t.integer :position
      t.boolean :is_hidden,   default: true
      t.text :summary
      t.timestamps
    end
  end
end
