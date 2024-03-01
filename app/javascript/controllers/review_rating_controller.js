import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="review-rating"
export default class extends Controller {
  static targets = ["firstStar","secondStar", "thirdStar", "fourthStar", "fifthStar"]
  connect() {
    console.log("this works")

  }
  rating1(){
    console.log(this.firstStarTarget)
    this.firstStarTarget.classList.add("filled")
    this.secondStarTarget.classList.remove("filled")
    this.thirdStarTarget.classList.remove("filled")
    this.fourthStarTarget.classList.remove("filled")
    this.fifthStarTarget.classList.remove("filled")
  }
  rating2(){
    console.log(this.firstStarTarget)
    this.firstStarTarget.classList.add("filled")
    this.secondStarTarget.classList.add("filled")
    this.thirdStarTarget.classList.remove("filled")
    this.fourthStarTarget.classList.remove("filled")
    this.fifthStarTarget.classList.remove("filled")
  }
  rating3(){
    console.log(this.firstStarTarget)
    this.firstStarTarget.classList.add("filled")
    this.secondStarTarget.classList.add("filled")
    this.thirdStarTarget.classList.add("filled")
    this.fourthStarTarget.classList.remove("filled")
    this.fifthStarTarget.classList.remove("filled")

  }
  rating4(){
    console.log(this.firstStarTarget)
    this.firstStarTarget.classList.add("filled")
    this.secondStarTarget.classList.add("filled")
    this.thirdStarTarget.classList.add("filled")
    this.fourthStarTarget.classList.add("filled")
    this.fifthStarTarget.classList.remove("filled")
  }
  rating5(){
    console.log(this.firstStarTarget)
    this.firstStarTarget.classList.add("filled")
    this.secondStarTarget.classList.add("filled")
    this.thirdStarTarget.classList.add("filled")
    this.fourthStarTarget.classList.add("filled")
    this.fifthStarTarget.classList.add("filled")
  }
}
