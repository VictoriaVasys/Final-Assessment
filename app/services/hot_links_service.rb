class HotLinksService

  def self.hot_links
    response = Faraday.get("https://vv-m4-final-hot-links.herokuapp.com/api/v1/links")
    JSON.parse(response.body).map do |link|
      link["url"]
    end
  end

end