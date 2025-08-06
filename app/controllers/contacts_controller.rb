class ContactsController < ApplicationController
  def new
    @contact = ContactForm.new
  end

  def create
    @contact = ContactForm.new(contact_form_params)
    if @contact.valid?
      ContactMailer.with(contact: @contact).send_message.deliver_now
      flash[:success] = "Your message has been sent successfully!"
      redirect_to new_contact_path
    else
      flash.now[:error] = "Please fix the errors below"
      render :new
    end
  end

  private
  def contact_form_params
    params.require(:contact_form).permit(:name, :email, :message)
  end
end
