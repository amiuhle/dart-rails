require 'rails/engine'

module Dart
  module Rails
    class Engine < ::Rails::Engine
      config.app_generators.javascript_engine :dart
    end
  end
end