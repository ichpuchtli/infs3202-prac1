/* ==========================================================================
   Google Map Marker Script
   Depends: jQuery 1.x or 2.x, Bootstrap v3.3.2, Google Map Javascript API v3
   ========================================================================== */

jQuery(document).ready(function() {

  var mapOptions = {
    center: new google.maps.LatLng(-37.8170006,144.9669955), // Flinders Street Station
    zoom: 15
  };

  var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

  var marker = new google.maps.Marker({
    map: map,
    position: new google.maps.LatLng(-37.817607, 144.965901) ,
    title: '' // , icon: 'img/grilldlogo.jpeg'
  });

});
