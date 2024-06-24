
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