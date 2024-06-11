document.addEventListener("DOMContentLoaded", function () {
    var alertMessage = document.querySelector("p.alert");
    var increasebutton = document.getElementById("increase-button");

    if (alertMessage.textContent == "Unable to increase quantity.") {
        increasebutton.disabled = true;
    }
});


// app/assets/javascripts/cart.js
document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('form[data-remote="true"]').forEach(form => {
        form.addEventListener('ajax:success', (event) => {
            const [data, status, xhr] = event.detail;
            const itemElement = document.querySelector(`#cart-item-${data.id}`);
            itemElement.querySelector('.item-quantity').innerText = data.quantity;
            document.querySelector('#cart-value').innerText = data.total;
        });

        form.addEventListener('ajax:error', (event) => {
            alert('There was an error updating the quantity.');
        });
    });
});

