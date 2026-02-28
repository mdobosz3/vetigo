class AddClinicToOwners < ActiveRecord::Migration[8.1]
  def change
    add_reference :owners, :clinic, null: false, foreign_key: true
  end
end
