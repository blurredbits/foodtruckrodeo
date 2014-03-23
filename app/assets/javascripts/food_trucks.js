window.onunload = function(){};

function getGeoLocation() {
    navigator.geolocation.getCurrentPosition(setGeoCookie);
}

function setGeoCookie(position) {
    var cookie_val = position.coords.latitude + "|" + position.coords.longitude;
    document.cookie = "lat_lng=" + escape(cookie_val);
}

function showTrucks(the_markers){
    var handler = Gmaps.build('Google');
    handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
        var markers = handler.addMarkers(the_markers);
        handler.bounds.extendWith(markers);
        handler.fitMapToBounds();
    });
}

function showTruck(the_markers){
    var handler = Gmaps.build('Google');
    handler.buildMap({ provider: {}, internal: {id: 'truck'}}, function(){
        var markers = handler.addMarkers(the_markers);
        handler.bounds.extendWith(markers);
        handler.fitMapToBounds();
    });
}
