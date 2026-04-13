import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_event.freezed.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.getCart()                                        = GetCartEvent;
  const factory CartEvent.addToCart(String productId)                      = AddToCartEvent;
  const factory CartEvent.updateQuantity(String productId, int count)      = UpdateQuantityEvent; // ✅
  const factory CartEvent.removeItem(String productId)                     = RemoveItemEvent; // ✅
  const factory CartEvent.clearCart()                                      = ClearCartEvent;
}