module Api
  module V1
    class QuestionsController < GuardController
      before_action :set_question, only: %i[ show update destroy ]

      # GET /questions
      def index
        @questions = Question.all.accessible_by(current_ability, :list)
        render jsonapi: @questions, class: { Question: SerializableQuestion, User: SerializableUser, Role: SerializableRole, Answer: SerializableAnswer}, include: ['user', 'answers']
      end

      # GET /questions/1
      def show
        authorize! :read, @question
        render jsonapi: @question, class: { Question: SerializableQuestion, User: SerializableUser, Role: SerializableRole, Answer: SerializableAnswer}, include: ['user', 'answers']
      end

      # POST /questions
      def create
        authorize! :create, Question
        @question = current_user.questions.build(question_params)

        if @question.save
          render jsonapi: @question, class: { Question: SerializableQuestion, User: SerializableUser, Role: SerializableRole, Answer: SerializableAnswer}, include: ['user', 'answers'], status: :created
        else
          render jsonapi_errors: @question.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /questions/1
      def update
        authorize! :update, @question
        if @question.update(question_params)
          render json: @question, class: { Question: SerializableQuestion, User: SerializableUser, Role: SerializableRole, Answer: SerializableAnswer}, include: ['user', 'answers']
        else
          render jsonapi_errors: @question.errors, status: :unprocessable_entity
        end
      end

      # DELETE /questions/1
      def destroy
        authorize! :manage, @question
        @question.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_question
          @question = Question.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def question_params
          params.require(:question).permit(:title, :content)
        end
    end
  end
end
