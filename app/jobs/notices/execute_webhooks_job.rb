class Notices::ExecuteWebhooksJob < ApplicationJob
  queue_as :default

  def perform(notice)
    Notices::Webhooks.execute(notice)
  end
end
