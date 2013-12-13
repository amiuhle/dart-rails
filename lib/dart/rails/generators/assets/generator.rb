require 'rails/generators'

module Dart
  module Generators
    class AssetsGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      # Copies contents of template/darts to assets
      # invoke with:
      #
      #   $# rails g dart:assets
      #
      def generate_darts
        directory 'darts', 'app/assets/darts/'
      end
    end
  end
end