import { Controller } from "@hotwired/stimulus";
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }
  connect() {
    console.log("hi from map")
    mapboxgl.accessToken = this.apiKeyValue
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })
     this.#addMarkersToMap()
     this.#fitMapToMarkers()
  }
  #addMarkersToMap() {
    console.log("here")
    this.markersValue.forEach((marker) => {
      // const popup = new mapboxgl.Popup().setHTML();
      // const element = document.createElement('div');
      // element.className = 'marker'
      const setMarker = new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        // .setPopup(popup)
        .addTo(this.map);
      // Open the corresponding show.html.erb file when the marker is clicked
      const selectedMarker = document.querySelector("marker")
      // console.log(setMarker.getElement())
      // console.log(marker.id)
      setMarker.getElement().addEventListener('click', () => {
        window.location.href = `/cities/search?query=${marker.city}`;
      });
    });
  }
   #fitMapToMarkers() {
     const bounds = new mapboxgl.LngLatBounds()
     this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
     this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
   }
}
