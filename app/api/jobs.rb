require 'json'

module Api
  class Jobs < Base
    def self.list(options = {})
      params = options.map { |k, v| "#{k}=#{v}" }.join('&')

      request_url = [URL, 'offers'].join('/')
      request_url = "#{request_url}?#{params}"

      response = RestClient.get(request_url, headers)

      JSON(response)
    end
  end
end