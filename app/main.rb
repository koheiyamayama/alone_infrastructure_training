# require 'mysql2'

# client=''
# success_connect_to_mysql = false
# until success_connect_to_mysql
#   puts "\e[34m connecting to mariadb... \e[0m"
#   sleep 5
#   begin
#     client = Mysql2::Client.new(
#       host: ENV['DATABASE_HOSTNAME'],
#       password: ENV['DATABASE_PASSWORD'],
#       port: ENV['DATABASE_PORT'],
#       username: ENV['DATABASE_USERNAME'],
#       reconnect: true
#     )
#   rescue Mysql2::Error::ConnectionError => exception
#     next
#   rescue StandardError => exception
#     raise exception
#     p $!
#     p $@
#   end
#   success_connect_to_mysql = true
#   puts "\e[32m success!! connect to mariadb!! \e[0m"
# end

# p client

puts 'Hello World!'
count = 0
while true
  File.open('./logs/logs.txt', 'a+') do |f|
    sleep 1
    count += 1
    f.write(count, "\n")
  end
end
