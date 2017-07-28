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
  
  def self.reverse
    order('id DESC')
  end
  
  def hot_links_status
    if url == HotLinksService.hot_links[0]
      "TOP LINK"
    elsif HotLinksService.hot_links.include?(url)
      "HOT"
    else
      ""
    end
  end
  
end
