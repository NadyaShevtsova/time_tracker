// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
  $('#calendar').datepicker({
    onSelect: function(dataText){
      window.location.href = "/?date=" + dataText;
    }  
  });

});


function add_project(){
  new_project = prompt('Add new project');
  $.post("/projects.js", { 'project[name]': new_project },function(){
  });
}
