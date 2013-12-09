require 'rails'
require 'rails/railtie'
require 'dart-js'
require 'sprockets'
require 'dart/tilt/dart_js_template'
require 'dart/tilt/dart2js_template'
require 'dart/rails/engine'
require 'dart/rails/template_handler'
require 'dart/rails/version'
require 'dart/rails/helper'

module Dart
  class Railtie < ::Rails::Railtie
    config.after_initialize do |app|
      app.assets.register_mime_type 'application/dart2js', '.dart2js'
      app.assets.register_mime_type 'application/dart', '.dart'
      app.assets.register_processor 'application/dart2js', Dart::Tilt::Dart2jsTemplate

      ActionView::Base.instance_eval do
        include Dart::Rails::Helper
      end
    end
  end
end