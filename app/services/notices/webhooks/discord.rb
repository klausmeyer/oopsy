module Notices::Webhooks
  class Discord
    def self.enabled?
      ENV["WEBHOOK_DISCORD_ENABLED"].in? %w[true 1 yes]
    end

    def initialize(notice)
      self.notice = notice
    end

    def execute
      client.post(nil, body.to_json)
    end

    private

    attr_accessor :notice

    def client
      @client ||= Faraday.new(url: url) do |faraday|
        faraday.request :json
        faraday.response :json
        faraday.response :raise_error
        faraday.response :logger unless Rails.env.test?
      end
    end

    def url
      ENV.fetch("WEBHOOK_DISCORD_URL")
    end

    def body
      {
        embeds: [{
          title:       "Project «#{notice.project.name}» has #{errors.size} new #{"error".pluralize(errors.size)}",
          description: errors.join("\n"),
          url:         Trestle::Engine.routes.url_helpers.notices_admin_url(notice)
        }]
      }
    end

    def errors
      notice.reported_errors.reverse_order.map { |e| "* `#{e.error_type}`" }
    end
  end
end
