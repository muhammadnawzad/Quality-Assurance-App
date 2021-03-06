class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new

    can :read, Question
    can :read, Answer

    if user.has_role?("QA-Engineer")
      can :create, Question
      can %i[update delete choose_the_best_answer], Question do |question|
        question.user_id == user.id
      end
    end

    if user.has_role?("SW-Engineer")
      can :create, Answer
      can %i[update delete], Answer do |answer|
        answer.user_id == user.id
      end
    end

  end

end
