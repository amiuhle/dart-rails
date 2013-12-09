# DartRails

## Installation:

Gemfile

    gem 'ruby-dart', :git => 'https://github.com/m0gg/ruby-dart_js.git'
    gem 'dart-rails', :git => 'https://github.com/m0gg/dart-rails.git'

Currently you still need to add following to the bottom of your body in the layout

layout.html.erb

    <%= dart_include_tag 'application' %>
    <%= javascript_include_tag 'dart' %>

`dart_include_tag` adds the dart asset.

## Compatibility

###### ruby-dart_js
Needed use the dart2js transcoder for compatibility.

See [ruby-dart_js on github](https://github.com/m0gg/ruby-dart_js "ruby-dart_js home") for setup.

`<%= javascript_include_tag 'dart' %>` needs to stay as it is unless you want to drop
compatibility for browsers without dart support. It includes the bundled `javascripts/dart.js`
from this gem.

This will parse all script-tags with `type="application/dart"` and replace them with tags that request
the appropriate js file.

    <script type="application/dart" src="/assets/application.dart"></script>

would get

    <script type="application/javascript" src="/assets/application.js"></script>

To provide the transcoded version of you dart-file you'll need a `application.js.dart2js` which could look
like this

    //= include application

`Dart::Tilt::Dart2jsTemplate` gets registered as `DirectiveProcessor` in `Sprockets` and thus each dart-file
included in the `.dart2js` template gets transcoded and served as js.