import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/data/model/order_response/order_response.dart';
import 'package:e_commerce/domain/di/di.dart';
import 'package:e_commerce/ui/screens/main/tabs/profile/tabs/orders/orders_view_model.dart';
import 'package:e_commerce/ui/screens/order_details/order_details_screen.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderItem extends StatelessWidget {

  final OrderItemResponse order;
  final OrdersViewModel viewModel = getIt<OrdersViewModel>();

  OrderItem(this.order, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, OrderDetailsScreen.routeName, arguments: order);
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order #${order.orderID}",
                      style: GoogleFonts.poppins(
                          color: AppColors.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          viewModel.reformatDate(order.createdAt),
                          style: GoogleFonts.poppins(
                              color: AppColors.primaryColor.withOpacity(0.7),
                              fontSize: 12,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.012,
                          child: VerticalDivider(
                            color: AppColors.primaryColor.withOpacity(0.7),
                            thickness: 1.1,
                          )
                        ),
                        Text(
                          viewModel.reformatTime(order.createdAt),
                          style: GoogleFonts.poppins(
                              color: AppColors.primaryColor.withOpacity(0.7),
                              fontSize: 12,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.primaryColor,
                  size: 20,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: buildOrderItemsImage(order.cartItems, context),
                ),
                order.cartItems.length > 3
                    ?
                CircleAvatar(
                  backgroundColor: AppColors.tabBarBackgroundColor,
                  child: Text(
                    "+ ${order.cartItems.length - 3}",
                    style: GoogleFonts.poppins(
                        color: AppColors.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                )
                    :
                const SizedBox()
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  viewModel.isDelivered(order.createdAt),
                  style: GoogleFonts.poppins(
                      color: AppColors.primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                  ),
                ),
                Text(
                  "${viewModel.calculateTotalPrice(order.totalOrderPrice)} EGP",
                  style: GoogleFonts.poppins(
                      color: AppColors.primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildOrderItemsImage(List<CartItem> orderItems, BuildContext context) {
    if (orderItems.length > 3) {
      orderItems = orderItems.sublist(0, 3);
    }
    return orderItems.map((item) {
      return Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height * 0.015, vertical: MediaQuery.sizeOf(context).height * 0.02,),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: CachedNetworkImage(
          imageUrl: item.product.imageCover ?? "",
          width: MediaQuery.sizeOf(context).width * 0.15,
          height: MediaQuery.sizeOf(context).height * 0.1,
          fit: BoxFit.fill,
        ),
      );
    }).toList();
  }

}
