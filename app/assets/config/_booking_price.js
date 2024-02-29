document.addEventListener('DOMContentLoaded', function() {
  var nbOfPeopleField = document.getElementById('nb_of_people');
  var totalPriceField = document.getElementById('total_price');
  var pricePerPerson = @tour.price_per_person;

  nbOfPeopleField.addEventListener('change', function() {
    var nbOfPeople = this.value;
    var totalPrice = pricePerPerson * nbOfPeople;
    totalPriceField.innerHTML = `Total Price: ${totalPrice}€` ;
  });
});
