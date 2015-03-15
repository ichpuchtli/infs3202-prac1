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

  var markerBy = function(address, name) {

    var geocoder = new google.maps.Geocoder();
    geocoder.geocode(address, function(results) {

      var marker = new google.maps.Marker({
        map: map,
        position: results[0].geometry.location,
        title: title
      });

    });

  }

  var markerLocations = [
    { address: "Shop 7 Degraves Street Melbourne VIC 3000", name: "Little Cupcakes" },
    { address: "Grill'd Degraves Street", name: "Grill'd" }
  ];

  $.each(markerLocations, function(index, location) {
    markerBy(location.address, location.name);
  });

});
