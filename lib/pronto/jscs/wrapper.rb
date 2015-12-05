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
        params << ' -p airbnb' unless File.exist?('.jscsrc')
        output = `jscs "#{path}" #{params}`
        JSON.parse(output)
      end
    end
  end
end
