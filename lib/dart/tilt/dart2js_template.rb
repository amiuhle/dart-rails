require 'tilt/template'
require 'fileutils'
require 'sprockets/directive_processor'

module Dart
  module Tilt

    # Nasty magic DirectiveProcessor to deliver
    # result of dart2js
    class Dart2jsTemplate < ::Sprockets::DirectiveProcessor
      HEADER_PATTERN = /\A ((?m:\s*) (\/\/ .* \n?)+)+/x
      DIRECTIVE_PATTERN = /^ \W* = \s* (\w+.*?) (\*\/)? $/x

      # TODO: Artifact from DartJsTemplate, not needed, delete!
      def prepare
        super
        tmp_path = ::Rails.root.join('tmp', 'dart').to_s
        FileUtils.mkdir_p tmp_path
        options[:tmp_path] ||= tmp_path
      end

      # set content_type to 'application/dart'
      # workaround for "Sprockets::ContentTypeMismatch"
      def process_require_directive(path)

        # TODO: this definetly needs fixing, Xmas is coming and nasty devs only get unexpected behavior!
        @context.instance_eval do
          def content_type
            'application/dart'
          end
        end

        super
      end

      # Returns dart2js processed code.
      # This is mostly copied because the super method
      # does not provide the ability to set custom processor.
      # TODO: needs fixing, no reward for copycats!
      def process_source
        unless @has_written_body || processed_header.empty?
          @result << processed_header << "\n"
        end

        included_pathnames.each do |pathname|
          @result << context.evaluate(pathname, { :processors => [Dart::Tilt::DartJsTemplate] })
        end

        unless @has_written_body
          @result << body
        end

        if compat? && constants.any?
          @result.gsub!(/<%=(.*?)%>/) { constants[$1.strip] }
        end
      end
    end
  end
end