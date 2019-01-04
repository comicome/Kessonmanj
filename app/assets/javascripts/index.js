$(document).ready(function() {
  $('.is-medium').select2();


//mapbox
mapboxgl.accessToken = 'pk.eyJ1IjoiY29taWNvbWVkaW5vIiwiYSI6ImNqcWdveGdzMjUxNDk0M255MzR1ZWtnZjUifQ.oxoFZ8l4IbX8O9szjnpw7Q';

//  Set bounds to Paris, Paris
var bounds = [
  [2.2422608000000673, 48.8267204], // Southwest coordinates
   [2.4222608000000673, 48.9089604]  // Northeast coordinates
];

var map = new mapboxgl.Map({
    container: 'map', // container id
    style: 'mapbox://styles/mapbox/streets-v9', // stylesheet location
    center: [2.3522608000000673, 48.8767204], // starting position [lng, lat]
    zoom: 14, // starting zoom
    maxBounds: bounds
});

map.on('load', function() {
  //load wizcastle
  map.loadImage('https://cdn0.iconfinder.com/data/icons/landmark-glyph/484/castle_japan-512.png', function(error, image) {
      if (error) throw error;
      map.addImage('wizcastle', image);
      map.addLayer({
          "id": "points",
          "type": "symbol",
          "source": {
              "type": "geojson",
              "data": {
                  "type": "FeatureCollection",
                  "features": [{
                      "type": "Feature",
                      "geometry": {
                          "type": "Point",
                          "coordinates": [2.3522608000000673, 48.8767204]
                      }
                  }]
              }
          },
          "layout": {
              "icon-image": "wizcastle",
              "text-field": "Wizcastle",
              "text-font": ["Open Sans Semibold", "Arial Unicode MS Bold"],
              "text-offset": [0, 1.5],
              "text-anchor": "top",
              "icon-allow-overlap": true,
              "icon-size": 0.1
          }
      });
  });

//load restaurant
 map.addLayer({
      "id": "places",
      "type": "symbol",
      "source": {
          "type": "geojson",
          "data": {
              "type": "FeatureCollection",
              "features": $("#map").data("restaurant")
          }
      },
      "layout": {
          "visibility": "visible",
          "icon-image": "restaurant-15",
          "text-field": "{title}",
          "text-font": ["Open Sans Semibold", "Arial Unicode MS Bold"],
          "text-offset": [0, 0.6],
          "text-anchor": "top",
          "icon-allow-overlap": true
      }
  });

  // When a click event occurs on a feature in the places layer, open a popup at the
  // location of the feature, with description HTML from its properties.
  map.on('click', 'places', function (e) {
    var coordinates = e.features[0].geometry.coordinates.slice();
    var id = e.features[0].properties.id;
    // Ensure that if the map is zoomed out such that multiple
    // copies of the feature are visible, the popup appears
    // over the copy being pointed to.
    while (Math.abs(e.lngLat.lng - coordinates[0]) > 180) {
        coordinates[0] += e.lngLat.lng > coordinates[0] ? 360 : -360;
    }

    new mapboxgl.Popup()
        .setLngLat(coordinates)
        .setHTML("    ")
        .addTo(map);

    $.ajax({
      type: "GET", 
      url: "/restaurants/"+ id +"/preview",
      dataType : 'html',
      success: function(data, textStatus, jqXHR){
        $(data).appendTo(".mapboxgl-popup-content");
      },  
      error: function(jqXHR, textStatus, errorThrown){}
    })
  });

  // Change the cursor to a pointer when the mouse is over the places layer.
  map.on('mouseenter', 'places', function () {
      map.getCanvas().style.cursor = 'pointer';
  });

  // Change it back to a pointer when it leaves.
  map.on('mouseleave', 'places', function () {
      map.getCanvas().style.cursor = '';
  });

});
});

