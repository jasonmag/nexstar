class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :tech_stack
      t.string :url
      t.string :github_url
      t.date :released_on

      t.timestamps
    end
  end
end
