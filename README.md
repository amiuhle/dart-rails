# DartRails

## Installation:

    gem 'ruby-dart', :git => 'https://github.com/amiuhle/ruby-dart.git'
    gem 'dart-rails', :git => 'https://github.com/amiuhle/dart-rails.git'

    # config/initializers/dart.rb
    DartHost::Application.assets.register_engine '.dart', Dart::Tilt::DartJsTemplate