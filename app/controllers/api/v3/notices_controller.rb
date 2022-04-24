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
          url: trestle.notices_admin_url(notice)
        }
      end

      def notice
        @notice ||= Notices::CreateFromRaw.new(
          project: project,
          raw:     request.raw_post
        ).call
      end

      def project
        @project ||= Project.find(params[:project_id]).tap do |p|
          raise UnauthorizedError unless p.api_key == api_key
        end
      end

      def api_key
        request.headers["HTTP_AUTHORIZATION"]&.split(" ")&.last || params[:key]
      end
    end
  end
end
