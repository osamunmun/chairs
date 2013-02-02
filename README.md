# chairs

## Notes

### How to develop

* thin
* Procfile (web)
* ./.env

```
% cd chairs
% cp .env.sample .env #=> copy as .env
% (edit .env for PORT, SECRET_TOKEN etc.)
% bundle install --path .bundle/gems
% bundle exec foreman start web  # => thin is booted by foreman
```

### How to deploy

* unicorn
* config/unicorn.rb
* current/.env is copied from shared/.env at `deploy:set_dot_env` task after `deploy:create:symlink`

```
% cd chairs
% cp .env.sample .env #=> copy as .env
% (edit .env for DEPLOY_USER, DEPLOY_HOST etc.)
% bundle exec foreman run cap deploy #=> deploy to production (assets:precompile and unicorn:restart tasks are also called)
(shortcut)
% bundle exec foreman run deploy
```

#### unicorn tasks

* unicorn:start
* unicorn:stop
* unicorn:reload
* unicorn:restart
