class ContactsController < ApplicationController
  def new
    @contact = ContactForm.new
  end

  def create
    @contact = ContactForm.new(contact_form_params)

    unless verify_recaptcha(action: 'contact_form', minimum_score: 0.5, response: params[:recaptcha_token])
      flash.now[:error] = "reCAPTCHA failed. Please try again."
      return render :new, status: :unprocessable_entity
    end

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
