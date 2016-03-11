
function ensureGeoLocation(){
    if (document.cookie.indexOf('_lng') < 0){
        console.log("don't have user's location");
        getGeoLocation();
    }else{
        console.log("we know the user's location");
    }
}

function getGeoLocation() {
    return false;
    console.log("requesting users location");
    navigator.geolocation.getCurrentPosition(setGeoCookie, deniedCookie);
}

function deniedCookie() {
    console.log("denied");
}

function setGeoCookie(position) {
    var cookie_val = position.coords.latitude + "|" + position.coords.longitude;
    document.cookie = "lat_lng=" + escape(cookie_val);
}

function showTrucks(the_markers) {
    var handler = Gmaps.build('Google');
    handler.buildMap({ provider: {}, internal: {id: 'map'}}, function () {
        var markers = handler.addMarkers(the_markers);
        handler.bounds.extendWith(markers);
        handler.fitMapToBounds();
        //handler.setZoom(7);
    });
}

function showTruck(the_markers) {
    if (!hasCoords(the_markers[0])) { return false; }

    var handler = Gmaps.build('Google');
    handler.buildMap({ provider: {}, internal: {id: 'truck'}}, function () {
        var markers = handler.addMarkers(the_markers);
        handler.bounds.extendWith(markers);
        handler.fitMapToBounds();
    });
}

function hasCoords(truck_obj) {
    return ( _.has(truck_obj, 'lat') && _.isFinite(truck_obj.lat) && _.has(truck_obj, 'lng') && _.isFinite(truck_obj.lng));
}
