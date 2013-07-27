#Отправка SMS из Ruby приложения через sms48.ru

SmsSend::count - Количество оставшихся SMS
SmsSend::snd from, to, msg, status_url

status_url - на этот URL будет передаваться с
параметрами статус доставки 
пример: http://example.com/sms/1/%d
(%d - статус, значение 8 - отправлено,
1 - доставлено, 2 - не удалось)

До использования необходимо установить логин 
с паролем к sms48.ru следующим образом:
При использовании Rails
в файле /config/initializers/sms48.rb

``ruby
module Sms48
  EMAIL = 'yourmail@mail.com'
  PASS = 'yourpassword'
end
``