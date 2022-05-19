class RemoveMeasurementUnitColumnFromFoods < ActiveRecord::Migration[7.0]
  def change
    remove_column :foods, :measurement_unit, :string
  end
end
