class ContactMailer < ApplicationMailer
  default to: "hello@jasonmag.com"

  def send_message
    @contact = params[:contact]
    mail(from: @contact.email, subject: "Contact Form Message from #{@contact.name}")
  end
end
