class TPricingCalculator {
  //Calculate Price based on tax and shipping
  static double calculateTotalPrice(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;

    double shippingCost = getShippingCost(location);
    double totalPrice = productPrice + taxAmount + shippingCost;

    return totalPrice;
  }

  /// Calculate shipping cost
  static String calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCost(location);

    return shippingCost.toStringAsFixed(2);
  }

  // Calculate tax

  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
     double taxAmount = productPrice * taxRate;
   return taxAmount.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String location) {
    //looup the tax rate for the given location from a atx rate databse or API
    //return the appropriate tax rate
    return 0.10;
  }

  static double getShippingCost(String location) {
    //lookup the shiiping cost for the given location using a shipping rate API
    //calculate the shipping cost based on variation factors like distance,height,etc

    return 5.00;
  }

}
