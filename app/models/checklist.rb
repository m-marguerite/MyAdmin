class Checklist < ApplicationRecord
  belongs_to :procedure
  has_many :documents, dependent: :destroy
  has_many :steps, dependent: :destroy
end
