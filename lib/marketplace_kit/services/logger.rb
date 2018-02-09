module MarketplaceKit
  module Services
    class Logger
      def deploy_started
        puts 'Deploy command started'
      end

      def compressing_folder
        puts 'Compressing marketplace_builder folder'
      end

      def sending_zip
        puts 'Sending zip file to the server'
      end

      def wait_for_deploy_finish
        puts 'Waiting for deploy to finish'
      end

      def deploy_succeeded
        puts 'Deploy command succeded'
      end

      def pull_started
        puts 'Pull command started'
      end

      def request_backup
        puts 'Requesting system backup...'
      end

      def wait_for_backup_finish
        puts 'Waiting for backup to finish'
      end

      def pull_succeeded
        puts 'Pull command succeded'
      end

      def sync_command_started
        puts 'Sync mode enabled'
      end

      def sync_updating(file_path)
        puts "Updating: #{file_path}"
      end

      def ask_for_email
        puts 'Enter your email:'
      end

      def ask_for_password
        puts 'Enter your password:'
      end

      def redirect_tip
        puts 'Server returned redirect code (possible a wrong domain in config file?)'
      end

      def version(version)
        puts "marketplace-kit #{version}"
      end

      def usage
        puts ''
        puts 'Usage: marketplace-kit sync | deploy | pull'
        puts '  -e endpoint     endpoint from your config file'
        puts '  -v              show current version'
      end

      def json_error(source)
        puts 'Error while parsing JSON'
        puts "Raw body:\n#{source}"
      end

      def api_error(message, details)
        puts "Builder error: #{message}"
        puts 'Details:' if details
        puts details
      end

      def standard_error(error)
        puts '```'
        puts "Error: #{error.message} (#{error.class})"
        puts '```'
      end
    end
  end
end
