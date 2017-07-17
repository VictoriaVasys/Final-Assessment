class Link < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true
  
  belongs_to :user
  before_validation :check_url
  
  def check_url
    binding.pry
    errors.add(:url, "is not valid") if !URI(url).host
  end
  
end
