// Remap scripts for browsers that are not "Dartium"
(function() {
  if(navigator.userAgent.indexOf('(Dart)') === -1) {
    var scripts = document.getElementsByTagName("script");
    var length = scripts.length;
    // run through all script tags and find the ones with type="application/dart"
    for(var i = 0; i < length; ++i) {
      if(scripts[i].type == "application/dart") {
        if(scripts[i].src && scripts[i].src != '') {
          var script = document.createElement('script');
          // rewrite file extension to .js
          script.src = scripts[i].src.replace(/\.dart(?=\?|$)/, '.js');
          script.type = "application/javascript";
          var parent = scripts[i].parentNode;
          document.currentScript = script;
          // finally replace script tag
          parent.replaceChild(script, scripts[i]);
        }
      }
    }
  }
})();
