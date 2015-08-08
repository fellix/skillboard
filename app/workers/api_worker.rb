class ApiWorker
  include Sidekiq::Worker

  def perform
    ApiTranslator.translate
  end
end