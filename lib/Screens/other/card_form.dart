import 'package:evolve/common-widgets/custom_appbar_one.dart';
import 'package:evolve/common-widgets/custom_bottom_navigation2.dart';
import 'package:evolve/common-widgets/custom_button.dart';
import 'package:evolve/controllers/profile_controller.dart';
import 'package:evolve/resources/text_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../models/subscription_plan_model.dart';
import '../../resources/app_color.dart';

class CardFormScreen extends StatefulWidget {
  const CardFormScreen({super.key});

  @override
  State<CardFormScreen> createState() => _CardFormScreenState();
}

class _CardFormScreenState extends State<CardFormScreen> {
  String? selectedIndex;
  SubscriptionPlanData? subscriptionSelectPlanData;
  final controller = Get.find<ProfileController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subscriptionSelectPlanData = Get.arguments;
    controller.getCardListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBarOne(
        title: "Credit & Debit Card",
        centerTitle: true,
        leadingOnTap: () {
          Get.back();
        },
        isAction: false,
      ),
      body: GetBuilder<ProfileController>(
          builder: (controller) => Scrollbar(
              child: RefreshIndicator(
                  onRefresh: () async {
                    await controller.getCardListApi(isShowLoader: true);
                  },
                  child: Column(
                    children: [
                      Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.all(12.0.h),
                              // physics: const AlwaysScrollableScrollPhysics(),
                              itemCount: controller.cardDataItemList.length,
                              itemBuilder: (context, index) {
                                return Stack(children: [
                                  CreditCardWidget(
                                    enableFloatingCard: false,
                                    cardNumber:
                                        "0000 0000 0000 ${controller.cardDataItemList[index].last4}",
                                    expiryDate:
                                        '${controller.cardDataItemList[index].expMonth}/${controller.cardDataItemList[index].expYear}',
                                    cardHolderName:
                                        '${controller.cardDataItemList[index].name}',
                                    cvvCode: '',
                                    bankName:
                                        '${controller.cardDataItemList[index].brand}',
                                    frontCardBorder:
                                        Border.all(color: Colors.grey),
                                    backCardBorder:
                                        Border.all(color: Colors.grey),
                                    showBackView: false,
                                    obscureCardNumber: true,
                                    obscureCardCvv: false,
                                    isHolderNameVisible: true,
                                    isSwipeGestureEnabled: true,
                                    onCreditCardWidgetChange:
                                        (CreditCardBrand creditCardBrand) {},
                                  ),
                                  Positioned(
                                      right: 5,
                                      bottom: 5,
                                      child: Radio(
                                          value: 1,
                                          groupValue: controller
                                              .cardDataItemList[index]
                                              .isDefault,
                                          onChanged: (_) {
                                            controller.setDefaultCardApi(
                                                cardId: controller
                                                    .cardDataItemList[index].id
                                                    .toString());
                                          },
                                          fillColor: MaterialStateProperty.all(
                                              Colors.white))),
                                  Positioned(
                                      right: 5,
                                      top: 5,
                                      child: GestureDetector(
                                        onTap: () {
                                          controller.removeCardApi(
                                              cardId: controller
                                                  .cardDataItemList[index].id
                                                  .toString());
                                        },
                                        child: const Align(
                                          alignment: Alignment.topRight,
                                          child: CircleAvatar(
                                            radius: 14.0,
                                            backgroundColor:
                                                AppColors.primaryColor,
                                            child: Icon(Icons.close,
                                                color: Colors.red),
                                          ),
                                        ),
                                      ))
                                ]);

                                // return buildCreditCard(
                                //     color: const Color(0xFF090943),
                                //     cardExpiration: "${controller.cardDataItemList[index].expMonth}/${controller.cardDataItemList[index].expYear}",
                                //     cardHolder: "${controller.cardDataItemList[index].name}",
                                //     cardNumber: "XXXX XXXX XXXX ${controller.cardDataItemList[index].last4}");
                              })),
                      _buildAddCardButton(
                        icon: const Icon(Icons.add),
                        color: const Color(0xFF081603),
                      ),
                      addHeight(120.h),
                    ],
                  )))),
      bottomSheet: SizedBox(
        height: 120.h,
        width: Get.height,
        child: Column(children: [
          addHeight(5.h),
          addBoldTxt(
              'Amount to pay: \$${subscriptionSelectPlanData?.price ?? ''}',
              fontSize: 16,
              color: AppColors.primaryColor),
          addHeight(20.h),
          CustomButton(
              height: 60.h,
              width: Get.width / 1.5,
              text: 'Proceed to Payment',
              onPressed: () {
                controller.createSubscriptionPlanApi(
                    subStripePriceId:
                        subscriptionSelectPlanData?.stripePriceId ?? '');
              }),
        ]),
      ),
      bottomNavigationBar: const NavBar2(),
    );
  }

  //New Add
  Card buildCreditCard(
      {required Color color,
      required String cardNumber,
      required String cardHolder,
      required String cardExpiration}) {
    return Card(
      elevation: 4.0,
      color: color,
      /*1*/
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Container(
        height: 200,
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            /* Here we are going to place the _buildLogosBlock */
            _buildLogosBlock(),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              /* Here we are going to place the Card number */
              child: Text(
                cardNumber,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontFamily: 'CourrierPrime'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                /* Here we are going to place the _buildDetailsBlock */
                _buildDetailsBlock(
                  label: 'CARDHOLDER',
                  value: cardHolder,
                ),
                _buildDetailsBlock(
                  label: 'VALID THRU',
                  value: cardExpiration,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row _buildLogosBlock() {
    return Row(
      /*1*/
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Image.asset(
          "assets/images/contact_less.png",
          height: 20,
          width: 18,
        ),
        Image.asset(
          "assets/images/mastercard.png",
          height: 50,
          width: 50,
        ),
      ],
    );
  }

  Column _buildDetailsBlock({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
              color: Colors.grey, fontSize: 9, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: const TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  // Build the FloatingActionButton
  Container _buildAddCardButton({
    required Icon icon,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 24.0),
      alignment: Alignment.center,
      child: FloatingActionButton(
        elevation: 2.0,
        onPressed: () async {
          await controller.addCardApi();
          controller.getCardListApi();
          print("Add a credit card");
        },
        backgroundColor: color,
        mini: false,
        child: icon,
      ),
    );
  }
}
