module TflApi
  class Tims
    include HTTParty
    format :xml
    base_uri 'http://data.tfl.gov.uk'
  
    attr_accessor :header, :disruptions
  
    def initialize(header, disruptions)
      self.header = header
      self.disruptions = disruptions
    end
  
    def self.feed
      response = get('/tfl/syndication/feeds/tims_feed.xml?app_id=5ab7117a&app_key=e975ed062b4650c6b17c180fd02712db')
      if response.success?
        self.new(response.parsed_response["Root"]["Header"], response.parsed_response["Root"]["Disruptions"]["Disruption"])
      else
        # this just raises the net/http response that was returned
        raise response.response
      end
    end
  
  end
end
