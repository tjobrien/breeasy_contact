class ContactMailer < ActionMailer::Base
  
  default :from => "contact@breeasy.com"
  
  def contact_email(contact)
      @contact = contact
      mail(:to => "tobrien@breeasy.com", :subject => "Breeasy Contact Form Submitted")
    end
end
