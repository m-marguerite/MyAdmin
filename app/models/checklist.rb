class Checklist < ApplicationRecord
  belongs_to :procedure, dependent: :destroy
  # belongs_to :user, through: :procedures
  has_many :documents, dependent: :destroy
  has_many :steps, dependent: :destroy

  def populate_task(checklist_json)
    steps_list = checklist_json["steps"]
    documents_list = checklist_json["documents"]
    steps_list.each do |step|
      Step.create!(description: step["description"], checked: step["checked"], checklist_id: self.id)
    end

    documents_list.each do |document|
      Document.create!(name: document["name"], checked: document["checked"], checklist_id: self.id)
    end
  end
end
