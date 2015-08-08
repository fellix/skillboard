require 'json'

module Api
  class Companies < Base
    def self.list(options = {})
      params = options.map { |k, v| "#{k}=#{v}" }.join('&')

      request_url = [URL, 'companies'].join('/')
      request_url = "#{request_url}?#{params}"

      response = RestClient.get(request_url, headers)

      JSON(response)
    end

    def self.get(id)
      request_url = [URL, 'companies', id].join('/')

      response = RestClient.get(request_url, headers)

      JSON(response)
    end
  end
end