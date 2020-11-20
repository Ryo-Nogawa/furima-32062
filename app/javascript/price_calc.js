function priceCalc( ) {
  const inputPrice = document.getElementById('item-price');
  const addTaxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');
  
  inputPrice.addEventListener('input', function () {
    const fee = inputPrice.value * 0.1;
    addTaxPrice.innerHTML = fee;
    const gain = inputPrice.value - fee;
    profit.innerHTML = gain;
  });
};

window.addEventListener('load', priceCalc);