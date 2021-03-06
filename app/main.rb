require 'mysql2'
require 'sinatra'

set :bind, '0.0.0.0'
set :port, 4567

success_connect_to_mysql = false
until success_connect_to_mysql
  puts "\e[34m connecting to mariadb... \e[0m"
  sleep 5
  begin
    client = Mysql2::Client.new(
      host: ENV['DATABASE_HOSTNAME'],
      password: ENV['DATABASE_PASSWORD'],
      port: ENV['DATABASE_PORT'],
      username: ENV['DATABASE_USERNAME'],
      database: ENV['DATABASE_NAME'],
      reconnect: true
    )
  rescue Mysql2::Error::ConnectionError => exception
    puts "\e[31m retry connecting to mariadb... \e[0m"
    next
  rescue StandardError => exception
    raise exception
    p $!
    p $@
  end
  success_connect_to_mysql = true
  puts "\e[32m success!! connect to mariadb!! \e[0m"
end

get '/' do
  erb :index
end
