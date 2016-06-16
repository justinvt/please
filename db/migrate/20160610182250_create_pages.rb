class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :user_id
      t.string :url
      t.string :domain
      t.integer :size
      t.integer :image

      t.timestamps
    end
  end
end
