# Rail-random-chat
Rail-random-chat is random matching chat with Rails 5 Actioncable.

## Installation

First, install gems and migrate db.

```sh
$ bundle install
$ rake db:migrate
```

Second, install figaro for setting enviroment variables. This gem helps SMTP Setting.

```bash
$ bundle exec figaro install
```

and set application.yml as below.

```yaml
# config/application.yml

SMTP_ADDRESS: ""
SMTP_DOMAIN: ""
SMTP_USERNAME: ""
SMTP_PASSWORD: ""
```

### Todos

 - Mailer set in Production
