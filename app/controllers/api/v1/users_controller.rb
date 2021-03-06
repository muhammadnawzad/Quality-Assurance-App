module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: %i[ show update destroy ]
      before_action :check_owner, only: %i[ update destroy ]

      # GET /users
      def index
        @users = User.all.includes(:role, {questions: :answers}, :answers)
        render jsonapi: @users,
               class: { Question: SerializableQuestion, User: SerializableUser, Role: SerializableRole, Answer: SerializableAnswer},
               include: ['role', {questions: [:answers]}, {role: :users}, 'answers']
      end



      # GET /users/1
      def show
        #render json: @user
        render jsonapi: @user,
               class: { Question: SerializableQuestion, User: SerializableUser, Role: SerializableRole, Answer: SerializableAnswer},
               include: ['role', {questions: [:answers]}, {role: :users}, 'answers']
      end

      # POST /users
      def create
        @user = User.new(user_params)

        if @user.save
          render jsonapi: @user, status: :created,
                 class: { Question: SerializableQuestion, User: SerializableUser, Role: SerializableRole, Answer: SerializableAnswer},
                 include: ['role', {questions: [:answers]}, {role: :users}, 'answers']
        else
          render jsonapi_errors: @user.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /users/1
      def update
        if @user.update(user_params)
          render jsonapi: @user,
                 class: { Question: SerializableQuestion, User: SerializableUser, Role: SerializableRole, Answer: SerializableAnswer},
                 include: ['role', {questions: [:answers]}, {role: :users}, 'answers']
        else
          render jsonapi_errors: @user.errors, status: :unprocessable_entity
        end
      end

      # DELETE /users/1
      def destroy
        @user.destroy
      end

      def login
        @user = User.find_by_email(user_params[:email])
        if @user&.authenticate(user_params[:password])
          render json: {token: JsonWebToken.encode(user_id: @user.id), email: @user.email}
        else
          head :unauthorized
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_user
          @user = User.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def user_params
          params.require(:user).permit(:email, :password_digest, :password)
        end

        # Check if the user is the owner of the user
        def check_owner
          head :forbidden unless @user.id == current_user&.id
        end

    end
  end
end
