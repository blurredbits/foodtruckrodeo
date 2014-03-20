$(document).ready(function(){

    window.onunload = function(){};

    handler = Gmaps.build('Google');
    handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
        markers = handler.addMarkers(the_markers);
        handler.bounds.extendWith(markers);
        handler.fitMapToBounds();
    });

});
