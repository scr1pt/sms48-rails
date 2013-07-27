#Отправка SMS из Ruby приложения через sms48.ru

Sms48::count - Количество оставшихся SMS

Sms48::snd from, to, msg, status_url

status_url - на этот URL будет передаваться с параметрами статус доставки.
Пример:
``
http://example.com/sms/1/%d
``
(%d - статус, значение 8 - отправлено, 1 - доставлено, 2 - не удалось)

До использования необходимо установить логин 
и паролем к sms48.ru.

При использовании Rails в файле /config/initializers/sms48.rb

```ruby
module Sms48
  EMAIL = 'yourmail@mail.com'
  PASS = 'yourpassword'
end
```
