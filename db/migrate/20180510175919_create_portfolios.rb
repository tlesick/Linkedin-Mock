class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.references :user, index: true, foreign_key: true
      t.text :description
      t.date :birthday

      t.timestamps null: false
    end
  end
end
