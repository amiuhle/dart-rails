require 'tilt/template'
require 'fileutils'

module Dart
  module Tilt
    class DartJsTemplate < ::Tilt::Template
      self.default_mime_type = 'application/dart'

      def self.engine_initialized?
        defined? ::DartJs
      end

      def initialize_engine
        require_template_library('dart-js')
      end

      def prepare
        tmp_path = ::Rails.root.join('tmp', 'dart').to_s
        FileUtils.mkdir_p tmp_path
        options[:tmp_path] ||= tmp_path
      end

      def evaluate(scope, locals, &block)
        if @file
          @output ||= DartJs.compile(File.new(@file), options)
        else
          @output ||= DartJs.compile(data, options)
        end
      end
    end
  end
end