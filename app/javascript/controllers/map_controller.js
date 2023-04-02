import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = { apiKey: String,
                    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    this.map = new mapboxgl.Map({
      container: this.element, // container ID
      style: 'mapbox://styles/mapbox/streets-v12', // style URL
      // center: [-74.5, 40], // starting position [lng, lat]
      // zoom: 9, // starting zoom
    });
    this.#addMarkersToMap()
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .addTo(this.map);
    })
  }
}
