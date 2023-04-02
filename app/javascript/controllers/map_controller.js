import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = { apiKey: String,
                    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    console.log("map connected")
    this.map = new mapboxgl.Map({
      container: this.element, // container ID
      style: 'mapbox://styles/mapbox/streets-v12', // style URL
      // center: [-74.5, 40], // starting position [lng, lat]
      // zoom: 9, // starting zoom
    });
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window)
      new mapboxgl.Marker({ color: "#EC481F" })
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map);
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach((marker) => {
      bounds.extend([ marker.lng, marker.lat ])
    })
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 200 })
  }

}
