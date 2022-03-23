class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :description
      t.string :cover_url
      t.string :author_name

      t.timestamps
    end
  end
end
