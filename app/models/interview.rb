# frozen_string_literal: true

class Interview < ApplicationRecord
  belongs_to :candidate
  belongs_to :job_opportunity

  validates :interview_date, :hour, :address, presence: true

  validate :interview_date_cannot_be_in_the_past

  def interview_date_cannot_be_in_the_past
    errors.add(:interview_date, 'não pode estar no passado') if interview_date.present? && interview_date < Date.today
  end
end
