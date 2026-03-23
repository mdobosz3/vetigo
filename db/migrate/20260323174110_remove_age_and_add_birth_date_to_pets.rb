class RemoveAgeAndAddBirthDateToPets < ActiveRecord::Migration[8.1]
  def change
    remove_column :pets, :age, :integer
    add_column :pets, :birth_date, :date
  end
end
