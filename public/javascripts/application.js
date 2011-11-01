// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
  // if the function argument is given to overlay,
  // it is assumed to be the onBeforeLoad event listener
  $("a[rel='#overlay']").overlay({
    mask: '#000',
    effect: 'apple',

    onBeforeLoad: function() {
      // grab wrapper element inside content
      var wrap = this.getOverlay().find(".contentWrap");
      // load the page specified in the trigger
      wrap.load(this.getTrigger().attr("href"));
    }
  });
});


function add_project(){
  if ( $('#task_project_id option:selected').text() == "add_project" ) {
     $('.new_project').removeClass("hide");
  }
  else {
    $('.new_project').addClass("hide");
    $('#task_project_attributes_name').attr('value', '');
  }
}

function per_page(value, direction, sort) {
  url = window.location.search.replace(/(&|\\?).per_page=\d*/g, '').replace(/\\?page=\d*/g, '').replace(/(&|\\?).direction=(asc|desc)/, '').replace(/(&|\\?).sort=\w*(\.||_)\w*/, '');
  window.location = url + ((value) ? ((url == '' ? '?':'&') + 'per_page=' +  value):'') + ((direction) ? ("&direction=" + direction) : '') + ((sort) ? ("&sort=" + sort) : '');
}


var map  	= null;
var geocoder 	= null;

function initialize() {
  address = $("#user_city").val() + " " + $("#user_street").val();
  
  map = new GMap2(document.getElementById("map_canvas"));
  map.addControl(new GSmallMapControl());
  geocoder = new GClientGeocoder();

  if(address == " "){
    if (GBrowserIsCompatible()) {
      map.setCenter(new GLatLng(50.4501, 30.5234), 6);
    }
  }
  else{
    showAddress(address);
    $('input[type="button"]').addClass("hide");
  }
}
function showAddress(address) {
  if (geocoder) {
    geocoder.getLatLng(
      address, 
      function(point) { 
        if (!point) { 
          alert(address + " не найден"); 
        } 
        else { 
          map.setCenter(point, 6); 
          var marker = new GMarker(point, {draggable: true});

          GEvent.addListener(marker, "dragend", function() {
            marker.openInfoWindowHtml("Just bouncing along...");
          });

          map.addOverlay(marker);

        }
      }
    );
  }
}

