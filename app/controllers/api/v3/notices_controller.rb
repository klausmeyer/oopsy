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
        @notice ||= Notice.create! raw: JSON.parse(request.raw_post)
      end
    end
  end
end
