import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/data/model/order_response/order_response.dart';
import 'package:e_commerce/domain/di/di.dart';
import 'package:e_commerce/ui/screens/order_details/order_details_view_model.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderDetailsScreen extends StatelessWidget {

  static const String routeName = "order details screen";
  final OrderDetailsViewModel viewModel = getIt<OrderDetailsViewModel>();

  OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    OrderItemResponse order = ModalRoute.of(context)!.settings.arguments as OrderItemResponse;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.primaryColor),
        title: Text(
          "Order Details",
          style: GoogleFonts.poppins(
              color: AppColors.primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.w600
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(14.0),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadowColor,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    )
                  ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Order Details",
                    style: GoogleFonts.poppins(
                        color: AppColors.primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Order ID",
                        style: GoogleFonts.poppins(
                            color: AppColors.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      Text(
                        "#${order.orderID.toString()}",
                        style: GoogleFonts.poppins(
                            color: AppColors.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.01,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Order Placed",
                        style: GoogleFonts.poppins(
                            color: AppColors.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      Text(
                        viewModel.reformatDate(order.createdAt),
                        style: GoogleFonts.poppins(
                            color: AppColors.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.01,),
                  Text(
                    viewModel.isDelivered(order.createdAt),
                    style: GoogleFonts.poppins(
                        color: AppColors.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03,),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(14.0),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadowColor,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    )
                  ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Shipping Details",
                    style: GoogleFonts.poppins(
                        color: AppColors.primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.02,),
                  Text(
                    order.shippingAddress.details,
                    style: GoogleFonts.poppins(
                        color: AppColors.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.01,),
                  Text(
                    order.shippingAddress.city,
                    style: GoogleFonts.poppins(
                        color: AppColors.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.01,),
                  Text(
                    order.shippingAddress.phone,
                    style: GoogleFonts.poppins(
                        color: AppColors.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03,),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(14.0),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadowColor,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    )
                  ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Order #${order.orderID}",
                    style: GoogleFonts.poppins(
                        color: AppColors.primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  Column(
                    children: buildOrderItems(order.cartItems, context),
                  ),
                  const Divider(color: AppColors.tabBarBackgroundColor,),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.01,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sub Total",
                        style: GoogleFonts.poppins(
                            color: AppColors.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      Text(
                        "${order.totalOrderPrice.toString()} EGP",
                        style: GoogleFonts.poppins(
                            color: AppColors.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.01,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Shipping Fee",
                        style: GoogleFonts.poppins(
                            color: AppColors.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      Text(
                        "${viewModel.calculateShippingPrice(order.totalOrderPrice)} EGP",
                        style: GoogleFonts.poppins(
                            color: AppColors.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.01,),
                  const Divider(color: AppColors.tabBarBackgroundColor),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.01,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: GoogleFonts.poppins(
                            color: AppColors.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      Text(
                        "${viewModel.calculateTotalPrice(order.totalOrderPrice)} EGP",
                        style: GoogleFonts.poppins(
                            color: AppColors.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildOrderItems(List<CartItem> orderItems, BuildContext context) {
    return orderItems.map((item){
      return Column(
        children: [
          const Divider(color: AppColors.tabBarBackgroundColor,),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                margin: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 12.0),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: CachedNetworkImage(
                  imageUrl: item.product.imageCover ?? "",
                  fit: BoxFit.fill,
                  width: MediaQuery.sizeOf(context).width * 0.2,
                  height: MediaQuery.sizeOf(context).height * 0.15,
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.55,
                    child: Text(
                      item.product.title ?? "",
                      style: GoogleFonts.poppins(
                          color: AppColors.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.55,
                    child: Text(
                      "Quantity ${item.count}",
                      style: GoogleFonts.poppins(
                          color: AppColors.primaryColor.withOpacity(0.5),
                          fontSize: 14,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.01,),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.55,
                    child: Text(
                      "${item.price.toString()} EGP",
                      style: GoogleFonts.poppins(
                          color: AppColors.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      );
    }).toList();
  }

}
