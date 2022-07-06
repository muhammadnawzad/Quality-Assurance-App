moudle Api
  module V1
    class GuardController < ApplicationController

      prepend_before_action :set_ability, :current_user
      def set_ability
        @ability = Ability.new(current_user)
      end

    end
  end
end

