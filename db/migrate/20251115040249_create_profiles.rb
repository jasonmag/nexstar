class CreateProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :role
      t.string :hero_title
      t.string :hero_subtitle
      t.text :intro
      t.text :who_i_am
      t.text :what_i_do
      t.text :highlights
      t.text :toolbox
      t.text :availability_message
      t.string :email
      t.string :github_url
      t.string :linkedin_url

      t.timestamps
    end
  end
end
