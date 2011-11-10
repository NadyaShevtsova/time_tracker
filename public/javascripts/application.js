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
var marker      = null;

function initialize() {
  address = $("#user_address").val();
  
  map = new GMap2(document.getElementById("map_canvas"));
  map.addControl(new GSmallMapControl());
  map.addControl(new GMapTypeControl());
  geocoder = new GClientGeocoder();

  if(address == ""){
    if (GBrowserIsCompatible()) {
      map.setCenter(new GLatLng(50.4501, 30.5234), 6);
    }
  }
  else{
    showAddress(address);
  }
}
function showAddress(address) {
  $('input[type="button"]').addClass("hide");
  if (geocoder) {
    geocoder.getLatLng(
        address, 
        function(point) { 
          if (!point) { 
            point = new GLatLng(50.4501, 30.5234);
            map.setCenter(point, 6); 
            $('input[type="button"]').removeClass("hide");
            return false;

          } 
          map.setCenter(point, 13); 
          marker = new GMarker(point, {draggable: true});

            GEvent.addListener(marker, "dragend", function(latlng) {
          //marker.openInfoWindowHtml("Just bouncing along...");
              geocoder.getLocations(latlng, function(response){
                if (!response || response.Status.code != 200) {
                  return false;
                } 
                else {
                  var update_address = response.Placemark[0].address;
                  var html = "<center><b>Update your address?</b></center><br>"+update_address+"<br><center><input class='yes' onclick='update_coords(\"" + update_address + "\")' type='button' value='yes' /><input class='no' onclick='return_coords(\"" + address + "\")' type='button' value='no' /></center>";  
                    marker.openInfoWindowHtml(html, { maxWidth: 300 });
                  }
              });
            });
        
          map.addOverlay(marker);
      }
    );
  }
}

function update_coords(update_address){
  $.get('/registrations/update_address?update_address=' +update_address, function(){$('#user_address').val(update_address);});
  map.removeOverlay(marker);
  showAddress(update_address);
  marker.closeInfoWindowHtml();
}
function return_coords(address){
  map.removeOverlay(marker);
  showAddress(address);
}

 
