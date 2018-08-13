class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.string :name
      t.string :version
      t.string :publication_date
      t.string :title
      t.text :description
      t.text :authors
      t.text :maintainers
      t.timestamps
    end
  end
end
