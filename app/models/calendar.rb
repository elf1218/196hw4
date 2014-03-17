class Calendar < ActiveRecord::Base
  belongs_to :user
  has_many :events, :dependent => :destroy
  validates :title, presence: true, uniqueness: true, length: {maximum: 50}
end
