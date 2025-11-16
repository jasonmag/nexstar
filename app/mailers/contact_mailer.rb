class ContactMailer < ApplicationMailer
  DEFAULT_FROM = Rails.application.credentials.dig(:smtp, :username)

  default from: DEFAULT_FROM

  def notify_owner
    @contact = params[:contact]

    mail(
      to: DEFAULT_FROM,
      subject: "Message from #{@contact.name} via Contact Form"
    )
  end

  def auto_reply
    @contact = params[:contact]

    mail(
      to: @contact.email,
      subject: "Thanks for reaching out, #{@contact.name}!"
    )
  end
end
