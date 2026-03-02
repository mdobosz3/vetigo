class CreateVets < ActiveRecord::Migration[8.1]
  def change
    create_table :vets do |t|
      t.string :first_name
      t.string :last_name
      t.string :specialization
      t.references :clinic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
