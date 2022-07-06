module Api
  module V1
    class RolesController < ApplicationController
      before_action :set_role, only: %i[ show update destroy ]

      # GET /roles
      def index
        @roles = Role.all

        render jsonapi: @roles, class: { Role: SerializableRole, User: SerializableUser }, include: 'user'
      end


      # GET /roles/1
      def show
        render jsonapi: @role, class: { Question: SerializableQuestion, User: SerializableUser, Role: SerializableRole, Answer: SerializableAnswer}, include: 'user'
      end

      # POST /roles
      def create
        @role = Role.new(role_params)

        if @role.save
          render jsonapi: @role, class: { Question: SerializableQuestion, User: SerializableUser, Role: SerializableRole, Answer: SerializableAnswer}, include: 'user', status: :created, location: @role
        else
          render jsonapi_errors: @role.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /roles/1
      def update
        if @role.update(role_params)
          render jsonapi: @role, class: { Question: SerializableQuestion, User: SerializableUser, Role: SerializableRole, Answer: SerializableAnswer}, include: 'user'
        else
          render jsonapi_errors: @role.errors, status: :unprocessable_entity
        end
      end

      # DELETE /roles/1
      def destroy
        @role.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_role
          @role = Role.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def role_params
          params.require(:role).permit(:name, :user_id)
        end
    end
  end
end
