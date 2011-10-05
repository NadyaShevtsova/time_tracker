// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


function add_project(){
  if ( $('#task_project_id option:selected').text() == "add project" ) {
    new_project = prompt('Add new project');
    $.post("/projects.js", { 'project[name]': new_project },function(){});
  }
}
