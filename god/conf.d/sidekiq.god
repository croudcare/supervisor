sidekiq_pid = File.join(ENV["RAILS_SHARED"],"pids", "sidekiq.pid")
sidekiq_config = File.join(ENV["RAILS_ROOT"], "config", "sidekiq.yml")
sidekiq_log = File.join(ENV["RAILS_ROOT"], "log", "sidekiq.log")

touch_file = File.join(ENV["RAILS_ROOT"], "tmp", "restart.txt")

God.watch do |w|
  w.name  = "sidekiq"
  w.dir   = ENV["RAILS_ROOT"]
  w.start ="bundle exec sidekiq -C #{sidekiq_config}"
  w.stop  = "bundle exec sidekiqctl stop #{sidekiq_pid} 5"
  w.behavior(:clean_pid_file)
  w.log   = sidekiq_log
 	
  w.start_if do |start|
   start.condition(:process_running) do |c|
     c.interval = 30.seconds
     c.running = false
   end
  end
  
  w.restart_if do |restart|
    restart.condition(:memory_usage) do |c|
      c.above = 200.megabytes
      c.interval = 5.seconds
    end
   
    restart.condition(:touched) do |c|
      c.path = touch_file
      c.interval = 5.seconds
    end
  end
 
end
