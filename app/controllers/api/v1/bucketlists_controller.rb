module API
  module V1
    class BucketlistsController < ApplicationController
      before_action :set_bucketlist, only: [:show, :update, :destroy]
      before_action :user_bucketlists, only: [:index, :create]

      def index
        @queried_bucketlists = search_and_paginate || paginate_only
        json_response(@queried_bucketlists)
      end

      def create
        @new_bucketlist = @bucketlists.new(list_params).save!
        json_response(@new_bucketlist, :created)
      end

      def update
        @bucketlist.update!(list_params)
        head :no_content
      end

      def show
        json_response(@bucketlist)
      end

      def destroy
        @bucketlist.destroy
        head :no_content
      end

      private

      def list_params
        params.permit(:name, :user_id)
      end

      def pagination_params
      end

      def search_and_paginate
        @bucketlists.search(params[:q]).paginate(params[:limit], params[:page]) if params[:q]
      end

      def paginate_only
        @bucketlists.paginate(params[:limit], params[:page])
      end
    end
  end
end
