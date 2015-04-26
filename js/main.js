/* ==========================================================================
   Google Map Marker Script
   Depends: jQuery 1.x or 2.x, Bootstrap v3.3.2, Google Map Javascript API v3
   ========================================================================== */

jQuery(document).ready(function() {

   var locations = [
     { id: 'littleCupcakes',
       name: 'Little Cupcakes',
       address: 'Shop 7 Degraves St Melbourne VIC 3000',
       lat: -37.817525,
       lng: 144.965917,
       icon: 'letter_a.png'
     },
     { id: 'grilld', 
       name: 'Grill\'d Degraves Street',
       address: '15 Degraves St Melbourne VIC 3000',
       lat: -37.817368,
       lng: 144.965775,
       icon: 'letter_b.png'
     },
     { id: 'youngandjacksons',
       name: 'Young and Jacksons',
       address: 'Swanston Street Melbourne VIC 3000',
       lat: -37.8173848,
       lng: 144.9665986,
       icon: 'letter_c.png'
     },
     { id: 'transporthotel',
       name: 'Transport Hotel',
       address: 'Level 2 Corner Flinders Street & Swanston Street, Melbourne VIC 3000',
       lat:-37.818523,
       lng: 144.968193,
       icon: 'letter_d.png'
     },
     { id: 'shebeen',
       name: 'Shebeen',
       address: '36 Manchester Lane Melbourne VIC 3000',
       lat: -37.816371,
       lng: 144.966240,
       icon: 'letter_e.png'
     }
    ];

  var mapOptions = {
    center: new google.maps.LatLng(-37.817462, 144.967435), // Flinders Street Station
    zoom: 17,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

    var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

    for (var i = 0; i < locations.length; i++) {  

      var location = locations[i];

      var marker = new google.maps.Marker({
        position: new google.maps.LatLng(location.lat, location.lng),
        map: map,
        icon: '/img/markers/' + location.icon,
        title: location.name
      });

    }

    $('.moreinfo').click(function() {

      var btn = $(this);

      var collapse = btn.next('div');

      if(collapse.hasClass('hidden')){
        btn.text('Hide');
      }else{
        btn.text('More Info');
      }

      collapse.toggleClass('hidden');

    });

    // Try HTML5 geolocation
    //if(navigator.geolocation) {

    //  navigator.geolocation.getCurrentPosition(function(position) {

    //    var pos = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);

    //    var geocoder = new google.maps.Geocoder();

    //    geocoder.geocode({'latLng': pos}, function(data) {
    //    
    //      $('#location').text(data[3].formatted_address);
    //    
    //    });

    //    map.setCenter(pos);

    //  });

    //}

    //$('a.location').click(function(){

    //  var id = $(this).data('id');

    //  var location = $(locations).filter(function(i, el){ return el.id == id; });

    //  var pos = new google.maps.LatLng(location.lat,location.lng);

    //  map.setCenter(pos);

    //});

    $('#places').searchable({
      selector      : '.media',
      childSelector : '.text',
      searchField   : '#search',
      hide   : function($element) { 
        $element.slideUp();
      },
      show   : function($element) { 
        $element.slideDown();
      }
    });



});
