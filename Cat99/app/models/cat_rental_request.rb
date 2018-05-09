# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint(8)        not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord
  validates :cat_id, :start_date, :end_date, presence: true 
  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED) }
  validate :does_not_overlap_approved_request
  
  belongs_to :cat,
  primary_key: :id,
  foreign_key: :cat_id,
  class_name: :Cat 
  
  def overlapping_requests
    CatRentalRequest.all
    .where(cat_id: self[:cat_id])
    .where("(start_date BETWEEN :start_date AND :end_date) OR (end_date BETWEEN :start_date AND :end_date)",
     {start_date: self[:start_date], end_date: self[:end_date]})
    
  end
  
  def overlapping_approved_requests
    overlapping_requests.where(status: 'APPROVED')
  end
  
  def does_not_overlap_approved_request
    if overlapping_approved_requests.exists?
      self.errors[:start_date] << 'Another overlapping request exists'
    end
  end
end
