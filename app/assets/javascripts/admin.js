//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap.min
//= require i18n
//= require i18n/translations
//= require_tree ./admin
$(document).on('turbolinks:load', function(){
  init_chart_basic_line();
})
