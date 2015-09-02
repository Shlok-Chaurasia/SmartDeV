class ErrorsController < ApplicationController
  def error
    @message = params[:message]
    respond_to do |format|
      format.html { render "errors/error" }
    end
  end
end