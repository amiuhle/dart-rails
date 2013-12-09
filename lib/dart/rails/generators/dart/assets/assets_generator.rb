require "rails/generators/named_base"

module Dart
  module Generators
    class AssetsGenerator < ::Rails::Generators::NamedBase
      source_root File.expand_path("../templates", __FILE__)

      def copy_dart
        template "javascript.dart", File.join('app/assets/javascripts', class_path, "#{file_name}.dart")
        template "javascript.js.dart2js", File.join('app/assets/javascripts', class_path, "#{file_name}.js.dart2js")
      end
    end
  end
end