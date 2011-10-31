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


$(document).ready(function() {
  // объявление переменных
var map 		= null; // карта
var geocoder 	= null; // объект геокодинга

// инициализация карты
function initialize() {
	if (GBrowserIsCompatible()) {
		map = new GMap2(document.getElementById("map_canvas")); // делаем карту в таком диве
		map.setCenter(new GLatLng(59.94, 30.3), 13); // устанавливаем центр карты и приближение
		geocoder = new GClientGeocoder(); // создаем объект геокодера
	}
}

// функция, выводящая маркер, 
// соответсвующий указанному адресу
// ее аргумент — адрес места
function showAddress(address) {
	if (geocoder) {
		geocoder.getLatLng(
			address, // сообщаем объекту адрес
			function(point) { // объект вызывает функцию, аргумент которой точка, соответствующая адресу
				if (!point) { // если точка не определена (то есть адрес не правильный или Гугл не нашел его)
					alert(address + " не найден"); // выводим ошибку
				} else { // если же все круто, то
					map.setCenter(point, 15); // центром карты делаем эту точку
					var marker = new GMarker(point); // создаем в ней маркер
					map.addOverlay(marker); // и добавляем его на карту
					marker.openInfoWindowHtml(address); // открываем у него инфоокно
					document.getElementById('spot-lat').value 	= point.y; // и добавляем в поля широту
					document.getElementById('spot-longi').value = point.x; // и долготу
				}
			}
		);
	}
}
});


