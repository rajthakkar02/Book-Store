document.addEventListener('turbo:load', function(){
    window.selectTimePeriod = function (select) {
        var selectedValue = select.value;
        if (selectedValue === 'week') {
            document.getElementById('chart-week').style.display = 'block';
            document.getElementById('chart-month').style.display = 'none';
            document.getElementById('chart-year').style.display = 'none';
        } else if (selectedValue === 'month') {
            document.getElementById('chart-week').style.display = 'none';
            document.getElementById('chart-month').style.display = 'block';
            document.getElementById('chart-year').style.display = 'none';
        } else if (selectedValue === 'year') {
            document.getElementById('chart-week').style.display = 'none';
            document.getElementById('chart-month').style.display = 'none';
            document.getElementById('chart-year').style.display = 'block';
        }
    }
    
    window.generalTime = function (select) {
        var selectedValue = select.value;
        if (selectedValue === 'week-order') {
            document.getElementById('chart-week-order').style.display = 'block';
            document.getElementById('chart-month-order').style.display = 'none';
        } else if (selectedValue === 'month-order') {
            document.getElementById('chart-week-order').style.display = 'none';
            document.getElementById('chart-month-order').style.display = 'block';
        }
    }

    window.popular = function (select) {
        var selectedValue = select.value;
        if (selectedValue === 'order') {
            document.getElementById('pie-chart-order').style.display = 'block';
            document.getElementById('pie-chart-rating').style.display = 'none';
        } else if (selectedValue === 'rating') {
            document.getElementById('pie-chart-order').style.display = 'none';
            document.getElementById('pie-chart-rating').style.display = 'block';
        }
    }

})