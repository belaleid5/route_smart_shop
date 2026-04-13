import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:route_smart/features/auth_feature/data/models/message_response_model.dart';
import 'package:route_smart/features/cart/data/models/cart_response_model.dart';
part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial()                                      = _Initial;
  const factory CartState.loading()                                      = _Loading;
  const factory CartState.getCartSuccess(CartResponseModel cart)         = _GetCartSuccess;
  const factory CartState.addToCartSuccess(CartResponseModel cart)       = _AddToCartSuccess;
  const factory CartState.updateQuantitySuccess(CartResponseModel cart)  = _UpdateQuantitySuccess;
  const factory CartState.removeItemSuccess(CartResponseModel cart)      = _RemoveItemSuccess;
  const factory CartState.clearCartSuccess(MessageResponseModel message) = _ClearCartSuccess;
  const factory CartState.error(String message)                          = _Error;
}