import 'package:flutter/gestures.dart';
import 'package:sixam_mart/features/auth/controllers/auth_controller.dart';
import 'package:sixam_mart/features/auth/controllers/deliveryman_registration_controller.dart';
import 'package:sixam_mart/features/auth/controllers/store_registration_controller.dart';
import 'package:sixam_mart/helper/route_helper.dart';
import 'package:sixam_mart/util/dimensions.dart';
import 'package:sixam_mart/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConditionCheckBoxWidget extends StatelessWidget {
  final bool forDeliveryMan;
  final bool forSignUp;
  final bool forStore;
  const ConditionCheckBoxWidget({super.key, this.forDeliveryMan = false, this.forSignUp = true, this.forStore = false});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: forDeliveryMan || forStore ? MainAxisAlignment.start : MainAxisAlignment.center, children: [

      forDeliveryMan || forStore ? GetBuilder<DeliverymanRegistrationController>(builder: (dmRegController) {
        return GetBuilder<StoreRegistrationController>(builder: (storeRegController) {
          return GetBuilder<AuthController>(builder: (authController) {
            return Checkbox(
              activeColor: Theme.of(context).primaryColor,
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
              value: forSignUp ? authController.acceptTerms : forStore ? storeRegController.acceptTerms : dmRegController.acceptTerms,
              onChanged: (bool? isChecked) => forSignUp ? authController.toggleTerms() : forStore ? storeRegController.toggleTerms() : dmRegController.toggleTerms(),
            );
          });
        });
      }) : const SizedBox(),

      forDeliveryMan || forStore ? const SizedBox() : Text( '* ', style: robotoRegular.copyWith(color: Theme.of(context).hintColor)),

      Flexible(
        child: RichText(
          text: TextSpan(children: [
            TextSpan(
              text: forDeliveryMan || forStore ? 'i_agree_with_all_the'.tr :'by_login_i_agree_with_all_the'.tr,
              style: robotoRegular.copyWith(color: forDeliveryMan || forStore ? Theme.of(context).textTheme.bodyMedium!.color : Theme.of(context).hintColor, fontSize: forDeliveryMan || forStore ? Dimensions.fontSizeDefault : Dimensions.fontSizeSmall),
            ),
            const TextSpan(text: ' '),
            TextSpan(
              recognizer: TapGestureRecognizer()..onTap = () => Get.toNamed(RouteHelper.getHtmlRoute('terms-and-condition')),
              text: 'terms_conditions'.tr,
              style: robotoMedium.copyWith(color: Theme.of(context).primaryColor),
            ),
          ]),
        ),
      ),

    ]);
  }
}


class ConditionCheck extends StatelessWidget {
  final bool isDmAgreement;
  final bool isStoreAgreement;
  const ConditionCheck({super.key, this.isDmAgreement = false, this.isStoreAgreement = false});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (authController) {
      return Row(mainAxisAlignment: MainAxisAlignment.start, children: [

        Checkbox(
          activeColor: Theme.of(context).primaryColor,
          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
          value: isDmAgreement ? authController.isDmAgreement : isStoreAgreement ? authController.isStoreAgreement : authController.isPrivacyPolicy,
          onChanged: (bool? isChecked) => isDmAgreement ? authController.toggleDmAgreement() : isStoreAgreement ? authController.toggleStoreAgreement() : authController.togglePrivacyPolicy(),
        ),

        Text( '*', style: robotoRegular),

        Flexible(
          child: RichText(
            text: TextSpan(children: [
              TextSpan(text: 'i_agree_with_all_the'.tr, style: robotoRegular.copyWith(color: Theme.of(context).textTheme.bodyMedium!.color)),
              const TextSpan(text: ' '),
              TextSpan(
                recognizer: TapGestureRecognizer()..onTap = () => isDmAgreement ? Get.toNamed(RouteHelper.getHtmlRoute('show-agreement-dm'))
                    : isStoreAgreement ? Get.toNamed(RouteHelper.getHtmlRoute('show-agreement-store'))
                    : Get.toNamed(RouteHelper.getHtmlRoute('privacy-policy')),
                text: isDmAgreement || isStoreAgreement ? 'agreement_contract'.tr : 'privacy_policy'.tr,
                style: robotoMedium.copyWith(color: Theme.of(context).primaryColor),
              ),
            ]),
          ),
        ),

      ]);
    });
  }
}
