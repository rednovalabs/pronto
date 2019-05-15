require 'json'

module Pronto
  module Formatter
    class CodeclimateFormatter < Base
      def format(messages, _, _)
        messages.map do |message|
          lineno = message.line.new_lineno if message.line

          description = "(#{message.level[0].upcase}) #{message.msg}"
          description << " (#{message.runner})" if message.runner

          result = {
            description: description,
            location: {}
          }

          result[:location][:path] = message.path if message.path
          result[:location][:lines] = {begin: lineno} if lineno
          result[:fingerprint] = message.commit_sha if message.commit_sha

          result
        end.to_json
      end
    end
  end
end
