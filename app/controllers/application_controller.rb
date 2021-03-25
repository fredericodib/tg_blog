class ApplicationController < ActionController::API
  before_action :authorize_request
  def not_found
    render json: { error: 'not_found' }
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    @current_user = User.find_by_token(header) if header
  end
end
