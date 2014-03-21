$(document).ready(function(){

    handler = Gmaps.build('Google');
    handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
        markers = handler.addMarkers(the_markers);
        handler.bounds.extendWith(markers);
        handler.fitMapToBounds();
    });

});

window.onunload = function(){};

function getGeoLocation() {
    navigator.geolocation.getCurrentPosition(setGeoCookie);
}

function setGeoCookie(position) {
    var cookie_val = position.coords.latitude + "|" + position.coords.longitude;
    document.cookie = "lat_lng=" + escape(cookie_val);
}
