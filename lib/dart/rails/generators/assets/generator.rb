module Dart
  module Generators
    class AssetsGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def generate_darts
        directory 'darts', 'app/assets/darts/'
      end
    end
  end
end