require 'open3'
module Pronto
  module JSCS
    class Wrapper
      def initialize(patch)
        @patch = patch
      end

      def lint
        return [] if @patch.nil?
        path = @patch.new_file_full_path.to_s
        params = '--reporter=json'
        if ENV['JSCSRC_LOCATION']
          # Use a specific config file if specified
          params << " --config=#{ENV['JSCSRC_LOCATION']}"
        else
          # Fall back to airbnb default
          params << ' -p airbnb' unless File.exist?('.jscsrc')
        end
        stdout, stderr, _status = Open3.capture3("jscs \"#{path}\" #{params}")
        puts "WARN: pronto-jscs: #{stderr}" if stderr && stderr.size > 0
        return [] if stdout.nil? || stdout.size == 0
        JSON.parse(stdout)
      rescue => e
        puts "ERROR: pronto-jscs failed to process a diff: #{e}"
        []
      end
    end
  end
end
