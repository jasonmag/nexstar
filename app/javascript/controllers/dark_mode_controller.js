import { Controller } from "@hotwired/stimulus"

// Implements theme toggle logic as detailed in tutorials like Cody Norman and Josef Strzibny :contentReference[oaicite:1]{index=1}
export default class extends Controller {
  connect() {
    this.applyPreference()
  }

  applyPreference() {
    if (
      localStorage.theme === "dark" ||
      (!("theme" in localStorage) && window.matchMedia("(prefers-color-scheme: dark)").matches)
    ) {
      document.documentElement.classList.add("dark")
    } else {
      document.documentElement.classList.remove("dark")
    }
  }

  toggle() {
    const isDark = document.documentElement.classList.toggle("dark")
    localStorage.theme = isDark ? "dark" : "light"
  }
}
