// cart_controller.dart

import 'package:get/get.dart';
import 'package:StubSoft/Models/CartItem.dart';

class CartController extends GetxController {
  RxList<CartItem> cartItems = <CartItem>[].obs;

  double get totalPrice => cartItems.fold(
      0, (double sum, CartItem item) => sum + item.prixVenteTtc);
}
