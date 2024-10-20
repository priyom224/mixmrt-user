import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixam_mart/common/widgets/custom_app_bar.dart';
import 'package:sixam_mart/common/widgets/custom_button.dart';
import 'package:sixam_mart/common/widgets/custom_text_field.dart';
import 'package:sixam_mart/features/wallet/controllers/wallet_controller.dart';
import 'package:sixam_mart/util/dimensions.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({super.key});

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {

  final TextEditingController _requestBalanceController = TextEditingController();
  final TextEditingController _bankNameController = TextEditingController();
  final TextEditingController _bankAccountNumberController = TextEditingController();
  final TextEditingController _bankRoutingNumberController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  final FocusNode _requestBalanceFocusNode = FocusNode();
  final FocusNode _bankNameFocusNode = FocusNode();
  final FocusNode _bankAccountNumberFocusNode = FocusNode();
  final FocusNode _bankRoutingNumberFocusNode = FocusNode();
  final FocusNode _notesFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'withdraw_request'.tr),
      body: GetBuilder<WalletController>(builder: (walletController) {
        return Column(children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                child: Column(children: [

                  CustomTextField(
                    labelText: 'request_balance'.tr,
                    titleText: 'enter_balance'.tr,
                    controller: _requestBalanceController,
                    focusNode: _requestBalanceFocusNode,
                    nextFocus: _bankNameFocusNode,
                    inputType: TextInputType.number,
                    inputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: Dimensions.paddingSizeDefault),

                  CustomTextField(
                    labelText: 'bank_name'.tr,
                    titleText: 'enter_bank_name'.tr,
                    controller: _bankNameController,
                    focusNode: _bankNameFocusNode,
                    nextFocus: _bankAccountNumberFocusNode,
                    inputType: TextInputType.text,
                    inputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: Dimensions.paddingSizeDefault),

                  CustomTextField(
                    labelText: 'bank_account_number'.tr,
                    titleText: 'enter_account_number'.tr,
                    controller: _bankAccountNumberController,
                    focusNode: _bankAccountNumberFocusNode,
                    nextFocus: _bankRoutingNumberFocusNode,
                    inputType: TextInputType.number,
                    inputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: Dimensions.paddingSizeDefault),

                  CustomTextField(
                    labelText: 'bank_routing_number'.tr,
                    titleText: 'enter_routing_number'.tr,
                    controller: _bankRoutingNumberController,
                    focusNode: _bankRoutingNumberFocusNode,
                    nextFocus: _notesFocusNode,
                    inputType: TextInputType.text,
                    inputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: Dimensions.paddingSizeDefault),

                  CustomTextField(
                    labelText: 'notes'.tr,
                    titleText: 'enter_notes'.tr,
                    maxLines: 3,
                    controller: _notesController,
                    focusNode: _notesFocusNode,
                    inputType: TextInputType.text,
                    inputAction: TextInputAction.done,
                  ),
                  const SizedBox(height: Dimensions.paddingSizeDefault),

                ]),
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: CustomButton(
              buttonText: 'submit'.tr,
              isLoading: walletController.isLoading,
              onPressed: () {
                walletController.sendWithdrawRequest(
                  requestBalance: int.parse(_requestBalanceController.text),
                  bankName: _bankNameController.text,
                  bankAccountNumber: _bankAccountNumberController.text,
                  bankRoutingNumber: _bankRoutingNumberController.text,
                  notes: _notesController.text,
                );
              },
            ),
          ),
        ]);
      }),
    );
  }
}
