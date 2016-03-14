if !Rails.const_defined?('Console') && !($0 =~ /rake$/) && !Rails.env.test?
	Rails.application.config.after_initialize do
		(1..2).each do |thread|
			Thread.new {
				Thread.current[:thread_name] = "DJ Worker #{thread}"
				ActiveRecord::Base.connection_pool.with_connection do |con|
					dj = Delayed::Worker.new
					Rails.logger.warn "Snapshot Is Booting Up #{Thread.current[:thread_name]}"
					at_exit {Rails.logger.warn "Snapshot is Booting down"; dj.stop}
					dj.start
				end
			}
		end
	end
end