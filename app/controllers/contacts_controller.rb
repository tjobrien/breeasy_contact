class ContactsController < ApplicationController
  # GET /contacts
  # GET /contacts.json
  # def index
  #   @contacts = Contact.all
  # 
  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.json { render json: @contacts }
  #   end
  # end
  # 
  # # GET /contacts/1
  # # GET /contacts/1.json
  # def show
  #   @contact = Contact.find(params[:id])
  # 
  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.json { render json: @contact }
  #   end
  # end

  # GET /contacts/new
  # GET /contacts/new.json
  def new
    @contact = Contact.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contact }
    end
  end

  # # GET /contacts/1/edit
  # def edit
  #   @contact = Contact.find(params[:id])
  # end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(params[:contact])
    ContactMailer.contact_email(@contact).deliver
    respond_to do |format|
      if @contact.save
        format.html { redirect_to(thank_you_path(@contact), :notice => 'Request was successfully created.') }
        format.json { render json: @contact, status: :created, location: @contact }
      else
        format.html { render action: "new" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def thank_you
     @contact = Contact.find(params[:id])

   end

  # PUT /contacts/1
  # PUT /contacts/1.json
  # def update
  #   @contact = Contact.find(params[:id])
  # 
  #   respond_to do |format|
  #     if @contact.update_attributes(params[:contact])
  #       format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @contact.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

end
