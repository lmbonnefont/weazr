class AddPageIdToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :page_id, :string
  end
end
