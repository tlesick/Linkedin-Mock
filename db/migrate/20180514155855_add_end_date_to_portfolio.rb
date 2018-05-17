class AddEndDateToPortfolio < ActiveRecord::Migration
  def change
    add_column :portfolios, :endDate, :date
  end
end
