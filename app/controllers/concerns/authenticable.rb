module Authenticable
  def current_user
    return @current_user if @current_user

    header = request.headers['Authorization']
     render json: { error: 'Not authenticated' }, status: 401 and return unless header

    decoded = JsonWebToken.decode(header.split(' ').last)

    @current_user = User.find(decoded[:user_id]) rescue ActiveRecord::RecordNotFound
  end
end
