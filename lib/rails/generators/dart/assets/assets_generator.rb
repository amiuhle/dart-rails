require "rails/generators/named_base"

module Dart
  module Generators
    class AssetsGenerator < ::Rails::Generators::NamedBase
      source_root File.expand_path("../templates", __FILE__)

      def copy_dart
        template "javascript.js.dart", File.join('app/assets/javascripts', class_path, "#{file_name}.js.dart")
      end
    end
  end
end