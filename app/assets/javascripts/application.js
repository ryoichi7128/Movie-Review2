// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require_tree .










fetch('https://api.themoviedb.org/3/movie/now_playing?api_key=19d883d7e0d8ef8c12285053a264ec30&language=en-US&page=1')
  .then(response => {
    return response.json();
  })
  .then(data => {
    //取得したJSONデータの処理
    console.log(data);
  })
  .catch(error => {
    //エラー発生時の処理
    console.log('error');
});