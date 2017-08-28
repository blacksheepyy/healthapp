class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :score
      t.text :comment
    end
  end
end
