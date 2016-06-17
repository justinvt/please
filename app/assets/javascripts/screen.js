$(function() {


  $('#target').Jcrop({})
  var container = $('#target').Jcrop('api').container;

  container.on('cropmove',function(e,s,c){
    console.log(e);
  });
  
});