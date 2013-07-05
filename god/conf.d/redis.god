God.watch do |w|
  w.name = "redis"
  w.start = "/usr/local/bin/redis-server /etc/redis/6379.conf"
  w.pid_file = "/var/run/redis_6379.pid"
  w.log = "/var/log/god.log"
  
  w.behavior(:clean_pid_file)
  
  w.start_if do |start|
   start.condition(:process_running) do |c|
     c.interval = 4.seconds
     c.running = false
   end
  
  end 
end
