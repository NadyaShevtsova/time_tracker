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
  if (GBrowserIsCompatible()) {
    map = new GMap2(document.getElementById("map_canvas")); 
    map.setCenter(new GLatLng(50.26, 30.31), 6);
    geocoder = new GClientGeocoder();
  }
}

function showAddress(address) {
  address = "Украина";
  if (geocoder) {
    geocoder.getLatLng(
    address, // сообщаем объекту адрес
    function(point) { // объект вызывает функцию, аргумент которой точка, соответствующая адресу
      if (!point) { // если точка не определена (то есть адрес не правильный или Гугл не нашел его)
        alert(address + " не найден"); // выводим ошибку
      } 
      else { // если же все круто, то
        map.setCenter(point, 15); // центром карты делаем эту точку
        var marker = new GMarker(point); // создаем в ней маркер
        map.addOverlay(marker); // и добавляем его на карту
      }
    });
  }
}
