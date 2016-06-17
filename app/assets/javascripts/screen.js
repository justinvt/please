$(function() {

  var defaults = {
    url: "highlight URL" 
  }
  
  $('#page_url').val(defaults.url).select()



  $('#target').Jcrop({});


  $('#target').Jcrop('api').container.on('cropend',function(e){
    console.log(e);
    $.getJSON("/pages/page",{},function(data){console.log(data)}.call());
  })
  

  
});