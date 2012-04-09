class ContactMailer < ActionMailer::Base
  
  default :from => "admin@breeasy.com"
  
  def contact_email(contact)
      @contact = contact
      mail(:to => @contact.email, :subject => "Breeasy Contact Form Submitted")
    end
end
