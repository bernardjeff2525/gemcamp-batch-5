import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="location"
export default class extends Controller {
  static targets = ['selectedRegionId', 'selectedProvinceId']
  connect() {
    console.log('location controller connected')
  }

  fetchProvinces() {
    let target = this.selectedProvinceIdTarget
    $(target).empty()
    $.ajax({
      type: 'GET',
      url: '/api/v1/regions/' + this.selectedRegionIdTarget.value + '/provinces',
      dataType: 'json',
      success: (response) => {
        console.log(response)
        $.each(response, function (index, record) {
          let option = document.createElement('option')
          option.value = record.id
          option.text = record.name
          target.appendChild(option)
        })
      }
    })
  }
}
