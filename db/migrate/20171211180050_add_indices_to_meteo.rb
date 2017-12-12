class AddIndicesToMeteo < ActiveRecord::Migration[5.1]
  def change
    add_column :meteos, :indice_rain, :float
    add_column :meteos, :indice_damp, :float
    add_column :meteos, :indice_temperature, :float
    add_column :meteos, :indice_day_absolute, :float
    add_column :meteos, :indice_day_relative, :float
  end
end
