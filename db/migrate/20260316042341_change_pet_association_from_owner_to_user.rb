class ChangePetAssociationFromOwnerToUser < ActiveRecord::Migration[8.1]
  def change
    remove_reference :pets, :owner, null: false, foreign_key: true
    add_reference :pets, :user, null: false, foreign_key: true
  end
end
