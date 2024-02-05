import 'package:stradmon_chairs/constants/app_strings.dart';
import 'package:stradmon_chairs/model/shirt.dart';
import 'package:stradmon_chairs/model/product.dart';

String finalPrice(Shirt shirt) {
  final valorPrice = formattedPrice(finalDiscount(shirt));

  return valorPrice;
}

String formattedPrice(double valor) {
  String valorString = valor.toStringAsFixed(0);
  valorString = valorString.replaceAll('.', ',');
  valorString = 'GHS $valorString';

  return valorString;
}

double finalDiscount(Shirt shirt) {
  double discountPercentage = 0.0;

  if (shirt.shirtType == StringsGeneric.shirt) {
    discountPercentage = 0.20;
  } else if (shirt.shirtType == StringsGeneric.long) {
    discountPercentage = 0.12;
  }

  final discountPrice = shirt.price - (shirt.price * discountPercentage);

  return discountPrice;
}

String textDiscount(Shirt shirt) {
  var discount = '';
  if (shirt.shirtType == StringsGeneric.shirt) {
    discount = StringsGeneric.shirtDiscount;
  } else if (shirt.shirtType == StringsGeneric.long) {
    discount = StringsGeneric.longDiscount;
  }
  return discount;
}

String valueDiscount(Shirt shirt) {
  var valueString = shirt.price.toStringAsFixed(2);
  if (shirt.shirtType == StringsGeneric.shirt ||
      shirt.shirtType == StringsGeneric.long) {
    valueString = valueString.replaceAll('.', ',');
    valueString = 'GHS $valueString';
  } else {
    valueString = '';
  }
  return valueString;
}

double valueProduct(List<Product> products) {
  var value = 0.0;
  for (final product in products) {
    value += product.quantity * product.shirt.price;
  }

  return value;
}

double valueProductDiscount(List<Product> products) {
  var discountTotal = 0.0;

  for (final product in products) {
    final productTotal = product.quantity * product.shirt.price;

    if (product.shirt.shirtType == StringsGeneric.shirt) {
      discountTotal += productTotal * 0.20;
    } else if (product.shirt.shirtType == StringsGeneric.long) {
      discountTotal += productTotal * 0.12;
    }
  }

  return discountTotal;
}

double valueProductFinal(List<Product> products) {
  final valueFinal = valueProduct(products) - valueProductDiscount(products);

  return valueFinal;
}
