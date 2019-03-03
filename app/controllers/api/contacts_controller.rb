class Api::ContactsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @contacts = Contact.all.order(:id)
    render "index.json.jbuilder"
  end

  def create
    @contacts = Contact.create(
      {first_name: params[:first_name], 
      last_name: params[:last_name], 
      email: params[:email], 
      phone_number: params[:phone_number]}
    )
    @done = "Contact created!"
    render "create.json.jbuilder"
  end

  def show
    @contact = Contact.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def update
    @contact = Contact.find_by(id: params[:id])
    
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.phone_number = params[:phone_number]
    @contact.save

    @done = "Contact updated!"
    render "update.json.jbuilder"
  end

  def delete
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy

    @done = "Contact deleted"
    render "delete.json.jbuilder"
  end
end