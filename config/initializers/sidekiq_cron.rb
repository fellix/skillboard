# Schedule the worker to run every 60min
Sidekiq::Cron::Job.create(
  name: 'Api update - every 60min',
  cron: '0 * * * *',
  klass: 'ApiWorker'
)