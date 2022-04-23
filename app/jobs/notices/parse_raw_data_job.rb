class Notices::ParseRawDataJob < ApplicationJob
  queue_as :default

  def perform(notice)
    self.notice = notice

    parse_errors
  end

  private

  attr_accessor :notice

  def parse_errors
    Array.wrap(notice.raw["errors"]).each do |error|
      notice.error_occurrences.create!(
        error_type:    error["type"],
        error_message: error["message"],
        backtrace:     error["backtrace"]
      )
    end
  end
end
