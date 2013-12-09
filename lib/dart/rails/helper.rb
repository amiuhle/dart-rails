require 'action_view'

module Dart
  module Rails
    module Helper

      def dart_include_tag(*sources, &block)
        options = sources.extract_options!.stringify_keys
        sources.uniq.map { |source|
          tag_options = {
            "src" => dart_path(source, options),
            "type" => "application/dart"
          }.merge(options)
          content_tag(:script, "", tag_options)
        }.join("\n").html_safe
      end

      def dart_path(source, options = {})
        path_to_asset(source, {:extname => ".dart"}.merge!(options))
      end
      alias_method :path_to_dart, :dart_path

    end
  end
end
