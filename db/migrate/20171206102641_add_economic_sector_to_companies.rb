class AddEconomicSectorToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_reference :companies, :economic_sector, index: true, foreign_key: true
  end
end
