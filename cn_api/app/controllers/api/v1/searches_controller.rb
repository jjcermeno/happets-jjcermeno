module Api
  module V1
    class SearchesController < ApplicationController

      # GET /api/v1/searches
      def index
        data_result = Manager.list_searches(params)
        status = data_result.errors.present? ? :unprocessable_entity : :ok
        json = Oj.dump(data_result.as_json)
        render json: json, status: status
      end

      # GET /api/v1/searches/:id
      def show
        data_result = Manager.get_search(params)
        status = data_result.data.present? ? :ok : :not_found
        json = Oj.dump(data_result.as_json)
        render json: json, status: status
      end

      # GET /api/v1/searches/:id/resend_email
      def resend_email
        data_result = Manager.resend_email(params)
        status = data_result.errors.present? ? :not_found : :ok
        json = Oj.dump(data_result.as_json)
        render json: json, status: status
      end

      # POST /api/v1/searches
      def create
        data_result = Manager.create_search(params)
        status = data_result.data.present? ? :created : :unprocessable_entity
        json = Oj.dump(data_result.as_json)
        render json: json, status: status
      end
    end
  end
end
