class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.date :date_published
      t.string :tags
      t.string :url
      t.references :user, index: true

      t.timestamps
    end
  end
end
