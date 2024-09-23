void main() {
  // List of item prices in the shopping cart
  List<double> itemPrices = [15.0, 8.5, 12.0, 30.0, 50.0];

  // Calculate the total price of the items
  double total = calculateTotal(itemPrices, taxRate: 0.07);
  print("Total price with tax: \$${total.toStringAsFixed(2)}");

  // Filter out items below a certain threshold (e.g., under $10)
  List<double> filteredItems = itemPrices.where((price) => price >= 10.0).toList();
  print("Filtered items (>= \$10): $filteredItems");

  // Apply a discount to the filtered items
  double discountRate = 0.1; // 10% discount
  List<double> discountedPrices = applyDiscount(filteredItems, (price) => price * (1 - discountRate));
  print("Prices after discount: $discountedPrices");

  // Calculate factorial discount based on the number of items
  int itemCount = itemPrices.length;
  double factorialDiscount = calculateFactorialDiscount(itemCount);
  print("Factorial discount (${itemCount}!%): $factorialDiscount%");
}

// Standard Function: Calculate the total price with optional tax
double calculateTotal(List<double> prices, {double taxRate = 0.0}) {
  double subtotal = prices.fold(0, (sum, price) => sum + price);
  return subtotal * (1 + taxRate);
}

// Higher-Order Function: Apply a discount using a discount function
List<double> applyDiscount(List<double> prices, double Function(double) discountFunction) {
  return prices.map((price) => discountFunction(price)).toList();
}

// Recursive Function: Calculate factorial discount based on the number of items
double calculateFactorialDiscount(int n) {
  if (n <= 1) return 1;
  return n * calculateFactorialDiscount(n - 1);
}

