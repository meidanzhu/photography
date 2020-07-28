class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.string :title
      t.text :caption
      t.belongs_to :user
      t.belongs_to :category
      
      t.timestamps
    end
  end
end
