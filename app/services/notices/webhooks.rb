module Notices::Webhooks
  TARGETS = [Discord]

  class << self
    def enabled?
      ENV["WEBHOOKS_ENABLED"].in? %w[true 1 yes]
    end

    def execute(notice)
      TARGETS.filter(&:enabled?).map { |target| target.new(notice) }.each(&:execute)
    end
  end
end
