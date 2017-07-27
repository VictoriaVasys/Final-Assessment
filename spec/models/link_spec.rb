require 'rails_helper'

describe Link, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:url) }
  it { should belong_to :user}
  
  it "should return links in reverse order" do
    links = create_list(:link, 3)
    
    reversed_links = links.reverse
    
    expect(reversed_links.first.id).to eq(links.last.id)
  end
end

