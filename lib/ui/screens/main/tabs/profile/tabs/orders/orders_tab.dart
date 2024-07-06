import 'package:e_commerce/data/model/order_response/order_response.dart';
import 'package:e_commerce/domain/di/di.dart';
import 'package:e_commerce/ui/screens/main/tabs/profile/tabs/orders/orders_states.dart';
import 'package:e_commerce/ui/screens/main/tabs/profile/tabs/orders/orders_view_model.dart';
import 'package:e_commerce/ui/screens/main/tabs/profile/tabs/orders/widgets/order_item.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class OrdersTab extends StatefulWidget {

  static const String routeName = "orders tab";

  const OrdersTab({Key? key}) : super(key: key);

  @override
  State<OrdersTab> createState() => _OrdersTabState();
}

class _OrdersTabState extends State<OrdersTab> {

  late OrdersViewModel viewModel = getIt<OrdersViewModel>();

  @override
  void initState() {
    viewModel.getUserOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.primaryColor),
        title: Text(
          "Orders",
          style: GoogleFonts.poppins(
              color: AppColors.primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.w500
          ),
        ),
      ),

      body: BlocBuilder<OrdersViewModel, OrdersStates>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is OrdersErrorState) {
            return Center(child: Text(state.errorMessage),);
          }
          else if (state is OrdersSuccessState<OrderResponse>) {
            state.data.orders = state.data.orders.reversed.toList();
            return ListView.builder(
              padding: const EdgeInsets.only(right: 16.0, left: 16.0, bottom: 16.0),
              itemCount: state.data.orders.length,
              itemBuilder: (context, index) {
                return OrderItem(state.data.orders[index]);
              },
            );
          }
          else {
            return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),);
          }
        },
      ),
    );
  }
}
