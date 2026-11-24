class Procedure < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy
  has_one :checklist
end
