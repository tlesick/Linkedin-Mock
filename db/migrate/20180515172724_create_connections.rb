class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.references :user
      t.references :peer, index: true, foreign_key: true
      t.string :status

      t.timestamps null: false
    end
  end
end
