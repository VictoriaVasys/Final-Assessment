require 'rails_helper'

feature "HOT links service" do
  scenario "can find urls for hot links" do
      urls = HotLinksService.hot_links

      expect(urls).to be_an(Array)
      expect(urls.first).to be_a(String)
  end
end