// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require ace-rails-ap
//= require codemirror
//= require codemirror/modes/ruby
//= require turbolinks
//= require_tree .
$(function(){
  window.codemirror_editors = {};
  $('.codemirror').each(function(){
    var $el = $(this);
    codemirror_editors[$el.attr('id')] = CodeMirror.fromTextArea($el[0],
      { mode: "text/html",
        tabMode: "indent",
        textWrapping: false,
        lineNumbers: true
      });
  });
});
