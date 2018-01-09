class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
      t.string :Topic
      t.text :body
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
