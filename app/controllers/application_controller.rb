class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_admin!

  def index
  	# creek = Creek::Book.new "public/imports/asset-manages.xlsx"
  	# @sheets = creek.sheets[0]

  	# creek = Creek::Book.new "public/imports/budget.xlsx"
  	# @sheets = creek.sheets[0]

    creek = Creek::Book.new "public/imports/logs.xlsx"
    @sheets = creek.sheets[0]
  end
  
end
