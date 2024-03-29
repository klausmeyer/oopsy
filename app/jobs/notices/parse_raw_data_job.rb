class Notices::ParseRawDataJob < ApplicationJob
  queue_as :default

  def perform(notice)
    self.notice = notice

    parse_data
    parse_errors
    group_errors
    execute_webhooks
  end

  private

  attr_accessor :notice

  def parse_data
    %w[context environment session params].each do |key|
      notice.public_send("#{key}=", notice.raw[key])
    end

    notice.save!
  end

  def parse_errors
    Array.wrap(notice.raw["errors"]).each do |error|
      notice.reported_errors.create!(
        error_type:    error["type"],
        error_message: error["message"],
        backtrace:     error["backtrace"]
      )
    end

    notice.parsed!
  end

  def group_errors
    Errors::GroupJob.perform_later
  end

  def execute_webhooks
    return unless Notices::Webhooks.enabled?

    Notices::ExecuteWebhooksJob.perform_later(notice)
  end
end
