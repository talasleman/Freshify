
let quantities = {};

function increment(productId) {
  if (!quantities[productId]) {
    quantities[productId] = 1;
  }
  quantities[productId]++;
  document.getElementById(`quantity_${productId}`).value = quantities[productId];
}

function decrement(productId) {
  if (quantities[productId] && quantities[productId] > 1) {
    quantities[productId]--;
    document.getElementById(`quantity_${productId}`).value = quantities[productId];
  }
}

function addToCart(productId, productName) {
  alert(`Added ${quantities[productId] || 1} ${productName} to cart.`);
}
