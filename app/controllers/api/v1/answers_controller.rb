module Api
  module V1
    class AnswersController < ApplicationController
      before_action :set_answer, only: %i[ show update destroy choose_the_best_answer ]

      # GET /answers
      def index
        # @answers = Answer.all.accessible_by(current_ability, :list)
        @answers = Answer.all
        render jsonapi: @answers,
               class: { Question: SerializableQuestion, User: SerializableUser, Role: SerializableRole, Answer: SerializableAnswer}
      end

      # GET /answers/1
      def show
        authorize! :read, @answer
        render jsonapi: @answer,
               class: { Question: SerializableQuestion, User: SerializableUser, Role: SerializableRole, Answer: SerializableAnswer}
      end

      # POST /answers
      def create
        authorize! :create, Answer
        @answer = current_user.answers.build(answer_params)

        if @answer.save
          render jsonapi: @answer, status: :created,
                 class: { Question: SerializableQuestion, User: SerializableUser, Role: SerializableRole, Answer: SerializableAnswer}
        else
          render jsonapi_errors: @answer.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /answers/1
      def update
        authorize! :update, @answer
        if @answer.update(answer_params)
          render jsonapi: @answer,
                 class: { Question: SerializableQuestion, User: SerializableUser, Role: SerializableRole, Answer: SerializableAnswer}
        else
          render jsonapi_errors: @answer.errors, status: :unprocessable_entity
        end
      end

      # DELETE /answers/1
      def destroy
        authorize! :delete, @answer
        @answer.destroy
      end

      def choose_the_best_answer
        authorize! :choose_the_best, @answer.question
        @answer.choose_the_best

        if @answer.save
          render jsonapi: @answer.question,
                 class: { Question: SerializableQuestion, User: SerializableUser, Role: SerializableRole, Answer: SerializableAnswer}
        else
          render jsonapi_errors: @answer.errors, status: :unprocessable_entity
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_answer
          @answer = Answer.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def answer_params
          params.require(:answer).permit(:content, :question_id)
        end
    end
  end
end
