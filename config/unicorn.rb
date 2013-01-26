#!/usr/bin/env ruby
# encoding: utf-8

worker_processes 5
preload_app true

APP_PATH = "/usr/share/nginx/www"
working_directory APP_PATH

shared_path "#{APP_PATH}/shared"
stderr_path "#{shared_path}/log/unicorn.stderr.log"
stdout_path "#{shared_path}/log/unicorn.stdout.log"
listen      "#{APP_PATH}/tmp/unicorn.sock"
pid         "#{APP_PATH}/tmp/pids/unicorn.pid"

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
  old_pid = "#{server.config[:pid]}.oldbin"
  unless old_pid == server.pid
    begin
      Process.kill :QUIT, File.read(old_pid).to_i
    rescue Errno::ENOENT, Errno::ESRCH
      # pass
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end
