module Notices
  class CreateFromRaw
    def initialize(raw)
      self.raw = raw
    end

    def call
      create_record
      schedule_parsing

      record
    end

    private

    attr_accessor :raw, :record

    def create_record
      self.record ||= Notice.create! raw: JSON.parse(raw)
    end

    def schedule_parsing
      Notices::ParseRawDataJob.perform_later(record)
    end
  end
end
