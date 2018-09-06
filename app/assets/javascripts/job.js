var mainMap;

$(document).ready(function(){
  getCurrentLocation().then(function(location){
    mainMap = new Map('main-map', location, '#current-loc');
  }).catch(function(error, location){
    alert(error);
    mainMap = new Map('main-map', location, '#current-loc');
  });

  $('#current-loc').geocomplete({
    country: 'id',
    types: []
  }).bind('geocode:result', function(event, result) {
    let address = result.formatted_address;
    let name = (result.name === undefined) ? "" : result.name + ", ";
    let str = address.substr(0, address.indexOf(','));

    $(this).html(name + str);
  });

  $('#img-center').click(function(){
    if(mainMap) {
      mainMap.setView();
    }
  });
});

function getCurrentLocation() {
  return new Promise(function(resolve, reject) {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
        //resolve(L.latLng(-6.199872015046871, 106.78535020370487));
        resolve(L.latLng(position.coords.latitude, position.coords.longitude));
      });
    }
    else {
      reject('GPS Not Supported', L.latLng(-6.199872015046871, 106.78535020370487));
    }
  });
}


//CLASS MAP
function Map(mapContainer, location, placeNameCon) {
  this.location = location;

  this.map = L.map(mapContainer, {
    center: this.location,
    scrollWheelZoom: false,
    doubleClickZoom: false,
    zoom: 19
  });

  // L.tileLayer('http://tile-{s}.openstreetmap.fr/hot/{z}/{x}/{y}.png', {
  //   attribution: '© OpenStreetMap contributors'
  // }).addTo(this.map);

  L.gridLayer.googleMutant({ type: 'roadmap', maxZoom: 22 }).addTo(this.map);

  this.marker = L.marker(this.location, {
    draggable: false,
    title: 'You are here'
  }).addTo(this.map).bindPopup('You are here').addTo(this.map).openPopup();

  $(placeNameCon).geocomplete("find", this.location.lat + "," + this.location.lng);
}

Map.prototype.setView = function() {
  if(this.marker) {
    this.map.flyTo(this.marker.getLatLng(), 30);
  }
}
