class AddJobTitleToPortfolio < ActiveRecord::Migration
  def change
    add_column :portfolios, :JobTitle, :string
  end
end
