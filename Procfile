web: rails s thin -p $PORT
web_production: unicorn_rails -c config/unicorn.rb -E production -D
deploy: cap deploy
job_venue: rake sq:venue
job_herenow: rake sq:herenow
job_chair: rake sq:chair
job_clean: rake sq:clean
clock_job_chair: bundle exec clockwork lib/tasks/clockworks.rb
