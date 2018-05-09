class RemoveStatusFromCatRentalRequests < ActiveRecord::Migration[5.1]
  def change
    remove_column :cat_rental_requests, :status
    add_column :cat_rental_requests, :status, :string, default: "PENDING"
  end
end
