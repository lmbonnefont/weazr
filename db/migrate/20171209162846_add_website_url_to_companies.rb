class AddWebsiteUrlToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :website_url, :string
  end
end
