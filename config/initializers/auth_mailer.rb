class AuthMailer < Devise::Mailer

  require 'rubygems'
  require 'send_with_us' #after installing sendwithus_ruby gem, require the send_with_us.rb initializer file
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`

  default from: "rememberlenny@gmail.com"

  def confirmation_instructions(record, token, opts={})
    begin
      result = SendWithUs::Api.new.send_with(ENV['LB_SENDWITHUS'],
               { address: record.email },
               { confirmation_email: confirmation_url(record, :confirmation_token => token)  })
      puts result
    rescue => e
      puts "Error - #{e.class.name}: #{e.message}"
    end
  end

  def reset_password_instructions(record, token, opts={})
    begin
      result = SendWithUs::Api.new.send_with(ENV['LB_SENDWITHUS'],
               { address: record.email },
               { email: record.email, reset_password_link: edit_password_url(record, :reset_password_token => token) })
      puts result
    rescue => e
      puts "Error - #{e.class.name}: #{e.message}"
    end
  end

end
