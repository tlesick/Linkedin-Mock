class AddStartDateToPortfolio < ActiveRecord::Migration
  def change
    add_column :portfolios, :startDate, :date
  end
end
