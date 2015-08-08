module Api
  class Base
    URL = 'https://www.landing.jobs/api/v1'
    API_TOKEN = 'f76d724e394e2e80743bbb1f2d86b29b'

    def self.headers
      {
        :Authorization => "Token token=#{API_TOKEN}"
      }
    end
  end
end