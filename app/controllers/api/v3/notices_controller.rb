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
        @notice ||= Notices::CreateFromRaw.new(request.raw_post).call
      end
    end
  end
end
