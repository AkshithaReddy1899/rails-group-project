class ChangeMeasurementUnitToBeStringInFoods < ActiveRecord::Migration[7.0]
  def change
    change_column :foods, :measurement_unit, :string
    change_column :foods, :price, :decimal
  end
end
