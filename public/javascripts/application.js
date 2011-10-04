// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
  $('#calendar').datepicker({
    setDate: new Date(2008,9,03), 
    onSelect: function(dataText){
      window.location.href = "/?date=" + dataText;
    }
  });

});


function add_project(){
  if ( $('#task_project_id option:selected').text() == "add_project" ) {
    new_project = prompt('Add new project');
    $.post("/projects.js", { 'project[name]': new_project },function(){});
  }
}
