#London Traffic App

## features
- fetches the XML feed on a regular interval from London TIMS.
- stores the data locally in a mongoDB
- intervals can be configured via sidetiq for the sidekiq worker
- display of disruptions is done via leaflet and angular
- disruptions are exposed as a json API at /api/v1/disruptions

## requirements

### required software
- mongodb
- redis (for sidekiq)
- optional: heroku account with mongolab, redis-to-go, newrelic plugins

### local startup

Mac OS X mongoDB and redis installed via homebrew

```
    $ redis-server /usr/local/etc/redis.conf
```

```
    $ mongod --config /usr/local/etc/mongod.conf
```


```
    $ bundle exec sidekiq
```


```
    $ bundle exec rails server
```
