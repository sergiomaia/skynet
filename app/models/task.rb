class Task < ApplicationRecord
  belongs_to :user
  validates :description, presence: true

  def completed?
    self.completed = false
  end

  def incompleted?
    self.incompleted = true
  end
end
