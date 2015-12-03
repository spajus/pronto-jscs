require 'pronto'
require 'pronto/jscs/wrapper'

module Pronto
  class JSCSRunner < Runner
    def run(patches, _)
      return [] unless patches
      patches.select { |p| p.additions > 0 }
        .select { |p| js_file?(p.new_file_full_path) }
        .map { |p| inspect(p) }
        .flatten
        .compact
    end

    private

    def inspect(patch)
      offences = JSCS::Wrapper.new(patch).lint
      offences.map do |_file_path, violations|
        violations.map do |offence|
          patch.added_lines.select { |line| line.new_lineno == offence['line'] }
            .map { |line| new_message(offence, line) }
        end
      end
    end

    def new_message(offence, line)
      path = line.patch.delta.new_file[:path]
      level = :warning
      Message.new(path, line, level, offence['message'])
    end

    def js_file?(path)
      %w(.js .erb .html).include?(File.extname(path))
    end
  end
end
