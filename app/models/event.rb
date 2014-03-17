class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :calendar
  validates :desc, length: {maximum: 50}, presence: true
end
