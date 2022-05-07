# Oopsy

Rails based error tracker with [Airbrake compatible API](https://airbrake.io/docs/api/#create-notice-v3)

## Screenshots

[![Screenshot 1](docs/screenshot-1-thumb.png)](docs/screenshot-1.png)
[![Screenshot 1](docs/screenshot-2-thumb.png)](docs/screenshot-2.png)
[![Screenshot 1](docs/screenshot-3-thumb.png)](docs/screenshot-3.png)

## Dependencies

* PostgreSQL Database
* Redis Database

## Configuration

| Environment Variable       | Description                                       | Example                                           |
| -                          | -                                                 | -                                                 |
| `DATABASE_URL`             | Connection info (URL) for the PostgreSQL database | `postgresql://user:password@server:5432/database` |
| `FORCE_SSL`                | Enforce HTTPS on application level                | `enabled`                                         |
| `RAILS_ENV`                | Mode to run the application in                    | `production`                                      |
| `RAILS_LOG_TO_STDOUT`      | Tell the application to log to STDOUT             | `enabled`                                         |
| `RAILS_SERVE_STATIC_FILES` | Deliver assets via application server             | `enabled`                                         |
| `REDIS_URL`                | Connection info (URL) for the Redis database      | `redis://username:password@server:6379/0`         |
| `SECRET_KEY_BASE`          | Secret key used for signing and encryption        | `54a8a8bb94[...]`                                 |

## Deployment / Installation

### Heroku

The application is ready to be deployed on Heroku.

Make sure to have all requirements in place before the first deployment (See Dependencies).

### Kubernetes

Coming soon

## License

The application is available as open source under the terms of the MIT License.
