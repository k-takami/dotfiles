#   実行には以下のライブラリが必要です。#   $ gem install tmail tlsmail
require 'rubygems';require 'tmail';require "tlsmail"
class Mailer
  def initialize
    @mail = TMail::Mail.new;@mail.date = Time.now;@mail.mime_version = '1.0'
    @mail.set_content_type 'text', 'plain', {'charset'=>'utf-8'} #=>'iso-2022-jp'}
#     @mail.set_content_type 'text', 'plain', {'charset'=>'shift-jis'} #=>'iso-2022-jp'}
    # メールはNet::SMTPで送信。# gmailはTLSによる暗号化が必要なので、tlsmailを利用する。# また、認証も必須。
    Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)
  end
  def gmail(to,from,subject,body,output)#,accountID,accountPW)
    # tmailでメールを作成
#     @mail=1
    to !=nil ? @mail.to=to : @mail.to = 'example@docomo.ne.jp'
    from !=nil ? @mail.from=from : @mail.from = 'example@gmail.com'
    subject !=nil ? @mail.subject=subject : @mail.subject = 'test mail'
    body !=nil ? @mail.body =body : @mail.body = 'This is test mail.漢字'
    if output =="stdout" then puts @mail.to_s end # 作成されるメールを確認したい場合はこちら。
    Net::SMTP.start( "smtp.gmail.com",  587, "localhost.localdomain", "example@gmail.com", "alison1919", "plain"){ |smtp|
      smtp.sendmail(@mail.encoded, @mail.from, @mail.to)
    }
  end
end
if __FILE__ == $0
 Mailer.new.gmail('example@willcom.com','unistandard@gmail.com','test mail','This is test mail.漢字',"stdout")
end

