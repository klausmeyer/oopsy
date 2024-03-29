module Api
  module V3
    class NoticesController < BaseController
      def create
        render json: notice_response, status: :created
      end

      private

      def notice_response
        {
          id:  notice.id,
          url: trestle.notices_admin_url(notice, default_url_options)
        }
      end

      def notice
        @notice ||= Notices::CreateFromRaw.new(
          project: project,
          raw:     request.raw_post
        ).call
      end

      def project
        @project ||= Project.find_by(api_key: api_key) or raise UnauthorizedError
      end

      def api_key
        request.headers["HTTP_AUTHORIZATION"]&.split(" ")&.last || params[:key]
      end

      def default_url_options
        Trestle::Engine.routes.default_url_options
      end
    end
  end
end
