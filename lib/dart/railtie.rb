require 'rails'
require 'rails/railtie'
require 'dart_js'
require 'sprockets'
require 'dart/tilt/dart_js_template'
require 'dart/tilt/dart2js_template'
require 'dart/rails/engine'
require 'dart/rails/template_handler'
require 'dart/rails/version'
require 'dart/rails/helper'
require 'dart/rails/generators/assets/generator'

module Dart
  class Railtie < ::Rails::Railtie
    config.after_initialize do |app|

      # Register mime-types and Tilt-templates in assets environment
      app.assets.register_mime_type 'application/dart2js', '.dart2js'
      app.assets.register_mime_type 'application/dart', '.dart'
      app.assets.register_processor 'application/dart2js', Dart::Tilt::Dart2jsTemplate

      # Mixin helper-module in ActionView
      ActionView::Base.instance_eval do
        include Dart::Rails::Helper
      end
    end
  end
end