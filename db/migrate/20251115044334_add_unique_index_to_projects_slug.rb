class AddUniqueIndexToProjectsSlug < ActiveRecord::Migration[8.0]
  def change
    add_index :projects, :slug, unique: true
  end
end
