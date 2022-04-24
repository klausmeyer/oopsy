module Notices
  class CreateFromRaw
    def initialize(project:, raw:, async: true)
      self.project = project
      self.raw     = raw
      self.async   = async
    end

    def call
      create_record
      schedule_parsing
      schedule_collection

      record
    end

    private

    attr_accessor :project, :raw, :record, :async

    def create_record
      self.record ||= project.notices.create! raw: JSON.parse(raw)
    end

    def schedule_parsing
      perform_job Notices::ParseRawDataJob, record
    end

    def schedule_collection
      perform_job Errors::CollectErrorUnitiesJob
    end

    def perform_job(klass, *args)
      async ? klass.perform_later(*args) : klass.perform_now(*args)
    end
  end
end
