//= require jquery
//= require jquery_ujs
//= require_tree .

(function() {
  var head = document.getElementsByTagName('head')[0];
  var script = document.createElement('script');
  script.type = 'text/javascript';    
  script.src = '//use.typekit.net/pic5vzu.js';
  var callback = function() {
    try {
      Typekit.load();     
    } catch(e) { 
      // report error     
    }
  }
  script.onreadystatechange = callback;
  script.onload = callback;
  head.appendChild(script);
})();
