# Oopsy

Rails based error tracker with [Airbrake compatible API](https://airbrake.io/docs/api/#create-notice-v3)

## Screenshots

[![Screenshot 1](https://github.com/klausmeyer/oopsy/raw/master/_docs/screenshot-1-thumb.png)](https://github.com/klausmeyer/oopsy/raw/master/_docs/screenshot-1.png)
[![Screenshot 1](https://github.com/klausmeyer/oopsy/raw/master/_docs/screenshot-2-thumb.png)](https://github.com/klausmeyer/oopsy/raw/master/_docs/screenshot-2.png)
[![Screenshot 1](https://github.com/klausmeyer/oopsy/raw/master/_docs/screenshot-3-thumb.png)](https://github.com/klausmeyer/oopsy/raw/master/_docs/screenshot-3.png)

## Dependencies

* PostgreSQL Database
* Redis Database

## Configuration

| Environment Variable       | Description                                       | Example                                           |
| -                          | -                                                 | -                                                 |
| `DATABASE_URL`             | Connection info (URL) for the PostgreSQL database | `postgresql://user:password@server:5432/database` |
| `FORCE_SSL`                | Enforce HTTPS on application level                | `true`                                            |
| `PUBLIC_HOST`              | Hostname to use for public links                  | `oopsy.example.com`                               |
| `PUBLIC_PORT`              | Port to use for public links                      | `443`                                             |
| `PUBLIC_SCHEME`            | Scheme / protocol to use for public links         | `https`                                           |
| `RAILS_ENV`                | Mode to run the application in                    | `production`                                      |
| `REDIS_URL`                | Connection info (URL) for the Redis database      | `redis://username:password@server:6379/0`         |
| `SECRET_KEY_BASE`          | Secret key used for signing and encryption        | `54a8a8bb94[...]`                                 |
| `WEBHOOK_DISCORD_ENABLED`  | Flag to enable discord webhooks                   | `true`                                            |
| `WEBHOOK_DISCORD_URL`      | URL to use for discord webhooks                   | `https://discord.com/api/webhooks/123/456`        |
| `WEBHOOKS_ENABLED`         | Flag to enable webhooks in general                | `true`                                            |

## Deployment / Installation

### Docker / Kubernetes

An official Docker image is available at [klausmeyer/oopsy](https://hub.docker.com/r/klausmeyer/oopsy) on Docker Hub:

```shell
$ docker pull klausmeyer/oopsy:latest
```

Also there is a helm-chart available at [klausmeyer/helm-charts](https://github.com/klausmeyer/helm-charts/tree/master/charts/oopsy).

## License

The application is available as open source under the terms of the MIT License.
