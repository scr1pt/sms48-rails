#encoding:utf-8

#SmsSend::count - Количество оставшихся SMS
#SmsSend::snd from, to, msg, status_url

#status_url - на этот URL будет передаваться с
#параметрами статус доставки
#пример: http://example.com/sms/1/%d
#(%d - статус, значение 8 - отправлено,
#1 - доставлено, 2 - не удалось)

# До использования необходимо установить логин
# с паролем к sms48.ru следующим образом:
# При использовании Rails
# в файле /config/initializers/sms48.rb

# module Sms48
#   EMAIL = 'yourmail@mail.com'
#   PASS = 'yourpassword'
# end

require 'net/http'
require 'digest'

module Sms48

  def self.snd(from, to, msg, status_url, debug = dbg)
    phone = get_phone to

    msg = msg.encode("cp1251")

    msg = URI::encode(msg);
    dlr = URI::encode(status_url);

    checksumm = md5("#{EMAIL}#{md5(PASS)}#{phone}");
    url = "/send_sms.php?login=#{EMAIL}&to=#{phone}&msg=#{msg}&from=#{from}&check2=#{checksumm}&dlr_url=#{dlr}"

    if dbg
      puts url
    end

    res = Net::HTTP.get('sms48.ru', url)
    return res == "1"
  end

  def self.get_phone phone
    phone.gsub!(/[- ]/, '')
    "7#{/.*(\d{10})/.match(phone)[1]}"
  end

  def self.md5 text
    Digest::MD5.hexdigest(text)
  end

  def self.count
    check = md5("#{EMAIL}#{md5(PASS)}")
    Net::HTTP.get('sms48.ru', "/get_balance?login=#{EMAIL}&check=#{check}").to_i
  end
end
