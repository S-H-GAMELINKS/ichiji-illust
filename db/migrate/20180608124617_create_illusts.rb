class CreateIllusts < ActiveRecord::Migration[5.2]
  def change
    create_table :illusts do |t|
      t.text :title
      t.text :memo
      t.text :author
      t.string :illust
      t.integer :user_id

      t.timestamps
    end
  end
end
