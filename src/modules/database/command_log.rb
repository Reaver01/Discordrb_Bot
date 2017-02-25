module Bot
  module Database
    # Player table
    class CommandLog < Sequel::Model
      def self.resolve_name(command)
        find(command_name: command) || create(command_name: command)
      end

      def log
        update(count: count + 1, last_used: Time.now)
      end
    end
  end
end
