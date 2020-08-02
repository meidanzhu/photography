class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.string :title
      t.text :caption
      t.belongs_to :user, foreign_key: true
      t.belongs_to :category, foreign_key: true
      
      t.timestamps
    end
  end
end
