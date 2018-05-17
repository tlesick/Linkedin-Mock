class RemoveBirthdayFromPortfolio < ActiveRecord::Migration
  def change
    remove_column :portfolios, :birthday, :date
  end
end
