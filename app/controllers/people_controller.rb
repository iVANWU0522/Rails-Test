class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def import
    Person.import(params[:file])
    flash[:notice] = "People uploaded successfully"
    redirect_to root_path
  end
end
