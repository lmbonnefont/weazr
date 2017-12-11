class AddPixelIdToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :pixel_id, :string
  end
end
