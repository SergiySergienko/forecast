import jquery from 'jquery'
window.jQuery = jquery
window.$ = jquery

initMap = () => {
    const input = document.getElementById("gmaps-input-address");
    const autocomplete = new google.maps.places.Autocomplete(input);
};