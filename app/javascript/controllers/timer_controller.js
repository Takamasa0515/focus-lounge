import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["time", "start", "pause", "end", "duration", "startedAt"]

  connect() {
    this.startTime = null
    this.elapsed = 0
    this.timerId = null
  }

  start() {
    if (!this.startTime) {
      this.startTime = Date.now()
      this.startedAtTarget.value = new Date(this.startTime).toISOString()
    }

    this.tick()

    this.startTarget.disabled = true
    this.pauseTarget.disabled = false
    this.endTarget.disabled = false
  }

  tick() {
    const now = Date.now()
    const total = this.elapsed + (now - this.startTime)

    const h = Math.floor(total / 3600000)
    const m = Math.floor((total % 3600000) / 60000)
    const s = Math.floor((total % 60000) / 1000)

    this.timeTarget.textContent =
      `${String(h).padStart(2, "0")}:${String(m).padStart(2, "0")}:${String(s).padStart(2, "0")}`

    this.timerId = setTimeout(() => this.tick(), 1000)
  }

  pause() {
    clearTimeout(this.timerId)

    this.elapsed += Date.now() - this.startTime
    this.startTime = null

    this.startTarget.disabled = false
    this.pauseTarget.disabled = true
  }

  end() {
    clearTimeout(this.timerId)

    const totalSeconds = Math.floor(this.elapsed / 1000)
    this.durationTarget.value = totalSeconds
    console.log(this.durationTarget.value)
    // フォーム送信（Turbo）
    this.element.querySelector("form").requestSubmit()

    // リセット
    this.elapsed = 0
    this.startTime = null
  }
}
