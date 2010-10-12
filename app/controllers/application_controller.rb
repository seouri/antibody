class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :sort_column, :sort_direction

  private

  def sort_direction  
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"  
  end

  def order_string
    sort_column + ' ' + sort_direction
  end
end
