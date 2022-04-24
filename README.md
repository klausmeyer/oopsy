# Oopsy

Rails based error tracker with Airbrake compatible API

## Dependencies

* PostgreSQL Database
* Redis Database

## Configuration

| Environment Variable       | Description                                       | Example                                           |
| -                          | -                                                 | -                                                 |
| `DATABASE_URL`             | Connection info (URL) for the PostgreSQL database | `postgresql://user:password@server:5432/database` |
| `REDIS_URL`                | Connection info (URL) for the Redis database      | `redis://username:password@server:6379/0`         |
| `RAILS_ENV`                | Mode to run the application in                    | `production`                                      |
| `RAILS_LOG_TO_STDOUT`      | Tell the application to log to STDOUT             | `enabled`                                         |
| `RAILS_SERVE_STATIC_FILES` | Deliver assets via application server             | `enabled`                                         |
| `SECRET_KEY_BASE`          | Secret key used for signing and encryption        | `54a8a8bb94[...]`                                 |

## Deployment / Installation

### Heroku

The application is ready to be deployed on Heroku.

Make sure to have all requirements in place before the first deployment (See Dependencies).

### Kubernetes

Coming soon
