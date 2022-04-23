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
          url: "https://example.com/todo"
        }
      end

      def notice
        @notice ||= Notices::CreateFromRaw.new(
          project: project,
          raw:     request.raw_post
        ).call
      end

      def project
        @project ||= Project.find(params[:project_id])
      end
    end
  end
end
