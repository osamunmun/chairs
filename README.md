# chairs

## Notes

### How to develop

* thin
* Procfile (web)
* ./.env

##### thin (default)

```
% cd chairs
% cp .env.sample .env #=> copy as .env
% (edit .env for PORT, SECRET_TOKEN etc.)
% bundle install --path .bundle/gems
% bundle exec foreman start web  # => thin is booted by foreman
```

##### unicorn

If you need to check on unicorn, then:


```
% RAILS_ENV=development bundle exec foreman run unicorn_rails
```


### How to deploy

* unicorn
* Procfile (web_production)
* current/.env is copied from shared/.env at `deploy:set_dot_env` task after `deploy:create:symlink`

```
% cd chairs
% cp .env.sample .env #=> copy as .env
% (edit .env for DEPLOY_USER, DEPLOY_HOST etc.)
% bundle exec foreman run deploy #=> deploy to production (assets:precompile and unicorn:restart tasks are also called)
```

##### unicorn tasks

* `bundle exec foreman run unicorn:start`
* `bundle exec foreman run unicorn:stop`
* `bundle exec foreman run unicorn:reload`
* `bundle exec foreman run unicorn:restart`

##### migration tasks

* `bundle exec foreman run deproy:migrate`
* `bundle exec foreman run deploy:seed`

##### assets tasks

* `bundle exec foreman run asstes:precompile`
* `bundle exec foreman run assets:clean`


Please note this issue https://github.com/ddollar/foreman/issues/274
