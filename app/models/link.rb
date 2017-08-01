class Link < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true
  
  belongs_to :user
  validate :valid_url
  
  def valid_url
    unless !url
      uri = URI.parse(url)
      unless (uri.is_a?(URI::HTTP) && !uri.host.nil?)
        errors.add(:url, 'Not a Valid URL')
      end
    end
  end
  
  def self.reverse_order
    order('id DESC')
  end
  
end
