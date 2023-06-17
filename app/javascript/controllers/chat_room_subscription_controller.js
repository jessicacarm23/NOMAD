import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="chat-room-subscription"
export default class extends Controller {
  static targets = ["messages"]
  static values = { chatroomId: Number }

  connect() {
    console.log("testing if this works")


    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatRoomChannel", id: this.chatroomIdValue },
      {received: (data) => {this.#insertMessageAndScrollDown(data)}}
    )
    console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`)
  }

  resetForm(event) {
    console.log(event);
    event.target.reset()
  }

  #insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

}
