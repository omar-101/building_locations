import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    addEventListener("turbo:submit-end", (event) => {
      if (event.detail.success) {
        document.getElementById("no_location_message")?.remove();
      }
    })
  }

  handleClose(event){
    event && event.preventDefault();
    const modal = document.getElementById("new_location_modal");
    modal.innerHTML = "";
    modal.removeAttribute("src");
    modal.removeAttribute("complete");
  }

}
