class ContactsController < ApplicationController
  def new
    @contact = ContactForm.new
  end

  def create
    @contact = ContactForm.new(contact_form_params)

    if @contact.valid?
      # Email to you (owner)
      ContactMailer.with(contact: @contact).notify_owner.deliver_now

      # Auto reply to sender
      ContactMailer.with(contact: @contact).auto_reply.deliver_now

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
