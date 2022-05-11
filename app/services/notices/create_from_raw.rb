module Notices
  class CreateFromRaw
    def initialize(project:, raw:)
      self.project = project
      self.raw     = raw
    end

    def call
      create_record
      schedule_parsing

      record
    end

    private

    attr_accessor :project, :raw, :record

    def create_record
      self.record ||= project.notices.create! raw: JSON.parse(raw)
    end

    def schedule_parsing
      Notices::ParseRawDataJob.perform_later record
    end
  end
end
