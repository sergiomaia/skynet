class CreatePaymentsWorker
  include Sidekiq::Worker

  def perform(*args)
    CreatePaymentService.perform_async(*args)
  end
end
