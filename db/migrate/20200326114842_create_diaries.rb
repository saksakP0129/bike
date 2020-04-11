class CreateDiaries < ActiveRecord::Migration[5.0]
  def change
    create_table :diaries do |t|
      t.string :title, null:false
      t.text :text
      t.string :image
      t.references :user, foreigh_key: true 
      t.timestamps
    end
  end
end
