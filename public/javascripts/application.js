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
var infowindow = null;
function initialize() {
  address = $("#user_address").val();
  geocoder = new google.maps.Geocoder();

  var latlng; 

  if(address == ""){
    latlng = new google.maps.LatLng(50.4501, 30.5234);
    show_map(latlng,6);
  }
  else{
    coords(address,show_map,showAddress);
   }  
}

function show_map(latlng,zoom){
  myOptions = {
    zoom: zoom,
    center: latlng,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
}

function showAddress(latlng) {
  $('input[type="button"]').addClass("hide");
  var marker = new google.maps.Marker({
    position: latlng, 
    map: map, 
    draggable: true
  });   
  google.maps.event.addListener(marker, 'dragend', function(latlng) {
    geocoder.geocode({latLng: latlng.latLng}, function(responses) {
      if (responses && responses.length > 0) {
        var update_address = responses[0].formatted_address;
        var html = "<center><b>Update your address?</b></center><br>"+update_address+"<br><center><input class='yes' onclick='update_coords(\"" + update_address + "\");' type='button' value='yes' /><input class='no' onclick='return_coords()' type='button' value='no' /></center>";
        infowindow = new google.maps.InfoWindow();
        infowindow.setContent(html);
        infowindow.open(map, marker, { maxWidth: 100 });
      } else {
        return false;
      }
    });
  });
}

function update_coords(update_address){
  $.get('/registrations/update_address?update_address=' +update_address, function(){$('#user_address').val(update_address);});
  infowindow.close();
}

function return_coords(){
  infowindow.close();
  coords( $("#user_address").val());
}

function coords(address) {
   if (geocoder) {
    geocoder.geocode( { 'address': address}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        latlng = results[0].geometry.location;
        show_map(latlng,13);
        showAddress(latlng); 
      }
      else {
        latlng = new google.maps.LatLng(50.4501, 30.5234);
        show_map(latlng,6);
        $('input[type="button"]').removeClass("hide");
        return false;
      }
    });
  }
}

