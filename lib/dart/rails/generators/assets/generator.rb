module Dart
  module Generators
    class DartGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def generate_darts
        assets_path = File.join(Rails.root, 'app', 'assets')
        Dir.mkdir assets_path
        darts_path = File.join(assets_path, 'darts')
        copy_file 'dart_app.dart', darts_path.path
        copy_file 'dart_app.js.dart2js', darts_path.path
        copy_file 'pubspec.yaml', darts_path.path
      end
    end
  end
end