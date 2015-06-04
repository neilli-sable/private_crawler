# coding: utf-8
require 'mail'

module PrivateCrawler
  class SendReporter

    def sendMail
      body = File.open(__dir__ + '/../report.txt').read

      mail = Mail.new(:charset => "UTF-8") do
        from    ENV['MAIL_FROM']
        to      ENV['MAIL_TO']
        subject 'テニス空きコートのお知らせ'
        body    body
      end

      mail.delivery_method :smtp, {
        :address => 'smtp.sendgrid.net',
        :port => '587',
        :domain => 'escesc.info',
        :user_name => 'neilli',
        :password => '6JOtzD7dur1u',
        :authentication => :plain,
        :enable_starttls_auto => true
      }

      mail.deliver
    end
  end
end
