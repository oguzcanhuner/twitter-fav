run lambda { |env| [200, {'Content-Type'=>'text/plain'}, StringIO.new("Running Twitter Fav Server")] }
