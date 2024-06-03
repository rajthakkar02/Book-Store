document.addEventListener("DOMContentLoaded", function () {
    var alertMessage = document.querySelector("p.alert");
    var increasebutton = document.getElementById("increase-button");

    if (alertMessage.textContent == "Unable to increase quantity.") {
        increasebutton.disabled = true;
    }
});
