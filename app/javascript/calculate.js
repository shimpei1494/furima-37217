function calculate (){
  const itemPrice  = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    // 販売手数料（価格の10%,整数,３桁ごとにカンマで表示）
    const fee = Math.trunc(itemPrice.value / 10);
    const feeText = fee.toLocaleString()
    // 販売利益（価格から販売手数料を引いた値,整数,３桁ごとにカンマで表示）
    const profit = itemPrice.value - fee;
    const profitText = profit.toLocaleString()
    const addTaxPrice  = document.getElementById('add-tax-price');
    const addProfit  = document.getElementById('profit');
    addTaxPrice.innerHTML = feeText;
    addProfit.innerHTML = profitText;
  });
};

window.addEventListener('load', calculate);