import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/common/widgets/adabtive_text_form_field.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/features/auth_feature/presention/widgets/button_auth.dart';
import 'package:route_smart/features/checkout/domain/entites/address_entity.dart';
import 'package:route_smart/features/checkout/presention/manger/checkout_bloc.dart';
import 'package:route_smart/features/checkout/presention/manger/checkout_event.dart';
import 'package:route_smart/features/checkout/presention/widgets/field_label.dart';
import 'package:route_smart/features/checkout/presention/widgets/nav_divider.dart';

class CheckoutAddAddressSheet extends StatefulWidget {
  const CheckoutAddAddressSheet({super.key});

  @override
  State<CheckoutAddAddressSheet> createState() =>
      _CheckoutAddAddressSheetState();
}

class _CheckoutAddAddressSheetState extends State<CheckoutAddAddressSheet> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _detailsController;
  late final TextEditingController _phoneController;
  late final TextEditingController _cityController;

  late final CheckoutBloc _checkoutBloc;

  @override
  void initState() {
    super.initState();
    _checkoutBloc = context.read<CheckoutBloc>();
    _nameController = TextEditingController();
    _detailsController = TextEditingController();
    _phoneController = TextEditingController();
    _cityController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _detailsController.dispose();
    _phoneController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;

    _checkoutBloc.add(
      AddAddressEvent(
        AddressEntity(
          id: '',
          name: _nameController.text.trim(),
          details: _detailsController.text.trim(),
          phone: _phoneController.text.trim(),
          city: _cityController.text.trim(),
        ),
      ),
    );

    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.background,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
      ),
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 32,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 44,
                  height: 5,
                  margin: const EdgeInsets.only(bottom: 28),
                  decoration: BoxDecoration(
                    color: context.colors.stroke,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: context.colors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(
                      Icons.location_on_rounded,
                      color: context.colors.primary,
                      size: 24,
                    ),
                  ),
                  horizontalSpace( 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.translate(LangKeys.addAddress),
                        style: context.titleMedium,
                      ),
                      verticalSpace( 3),
                      Text(
                        context.translate(LangKeys.addAddressSubtitle),
                        style: context.bodyMedium.copyWith(
                          fontSize: 12,
                          color: context.colors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              verticalSpace( 24),
              NavDivider(),
              verticalSpace( 24),
              FieldLabel(
                icon: Icons.badge_outlined,
                label: context.translate(LangKeys.addressName),
              ),
              verticalSpace( 8),
              AdaptiveInputField(
                filedColor: context.colors.background,
                context: context,
                borderColor: context.colors.primary,
                controller: _nameController,
                hintText: context.translate(LangKeys.addressNameHint),
                validate: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return context.translate(LangKeys.errorEnterName);
                  }
                  return null;
                },
              ),
              verticalSpace( 20),
              FieldLabel(
                icon: Icons.home_outlined,
                label: context.translate(LangKeys.addressDetails),
              ),
              verticalSpace( 8),
              AdaptiveInputField(
                filedColor: context.colors.background,
                context: context,
                borderColor: context.colors.primary,
                controller: _detailsController,
                hintText: context.translate(LangKeys.addressDetailsHint),
                validate: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return context.translate(LangKeys.errorEnterDetails);
                  }
                  return null;
                },
              ),
              verticalSpace( 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FieldLabel(
                          icon: Icons.phone_outlined,
                          label: context.translate(LangKeys.addressPhone),
                        ),
                        verticalSpace( 8),
                        AdaptiveInputField(
                          filedColor: context.colors.background,
                          borderColor: context.colors.primary,
                          context: context,
                          controller: _phoneController,
                          hintText: '010xxxxxxxx',
                          keyboardType: TextInputType.phone,
                          textCapitalization: TextCapitalization.none,
                          validate: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return context.translate(
                                LangKeys.errorEnterPhone,
                              );
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  horizontalSpace( 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FieldLabel(
                          icon: Icons.location_city_outlined,
                          label: context.translate(LangKeys.addressCity),
                        ),
                        verticalSpace( 8),
                        AdaptiveInputField(
                          filedColor: context.colors.background,
                          borderColor: context.colors.primary,
                          context: context,
                          controller: _cityController,
                          hintText: context.translate(LangKeys.addressCityHint),
                          validate: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return context.translate(
                                LangKeys.errorEnterCity,
                              );
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              verticalSpace( 32),
             ButtonAuth(isLoading: false,
             
             onSubmit: ()=>_save(),
              text: context.translate(LangKeys.saveAddress),),
            ],
          ),
        ),
      ),
    );
  }
}
