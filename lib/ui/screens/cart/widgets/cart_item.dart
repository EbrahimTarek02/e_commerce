import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/data/model/cart_response/cart_response_DM.dart';
import 'package:e_commerce/ui/screens/cart/cart_states.dart';
import 'package:e_commerce/ui/screens/cart/cart_view_model.dart';
import 'package:e_commerce/ui/screens/main/main_view_model.dart';
import 'package:e_commerce/ui/shared_widgets/loading_widget.dart';
import 'package:e_commerce/ui/utils/app_assets.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

//ignore: must_be_immutable
class CartItem extends StatefulWidget {
  final CartProducts product;
  bool isLoading = false;
  int itemCount;
  CartViewModel viewModel;

  CartItem(this.product, this.itemCount, this.viewModel, {Key? key}) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {

  late MainViewModel mainViewModel;

  @override
  void initState() {
    mainViewModel = BlocProvider.of(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10.0),
      margin: const EdgeInsets.only(bottom: 24.0),
      decoration: BoxDecoration(
        border: Border.all(
            color: AppColors.primaryColor,
            width: 2
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: [
          CachedNetworkImage(
              imageUrl: widget.product.product?.imageCover ?? "",
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.35,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(14.0),
                ),
              ),
              progressIndicatorBuilder: (_, __, ___) => const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),),
              errorWidget: (_, __, ___) => const Center(child: Icon(Icons.error),)
          ),
          const SizedBox(width: 8.0,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.33,
                      child: Text(
                        widget.product.product?.title ?? "product title",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryColor
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        LoadingWidget.showLoading(context);
                        mainViewModel.removeFromCart(widget.product.product?.orderID ?? "", false).then((_) {
                          Navigator.pop(context);
                        });
                      },
                      icon:
                      const ImageIcon(
                        AssetImage(
                            AppAssets.deleteIcon
                        ),
                        color: AppColors.primaryColor,
                      ),
                      padding: const EdgeInsets.all(5.0),
                      constraints: const BoxConstraints(),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.white,
                          shadowColor: AppColors.tabBarBackgroundColor,
                          elevation: 3.0
                      ),
                    ),
                  ],
                ),
                Text(
                  "EGP ${widget.product.price ?? "product price"}",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.poppins(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: AppColors.primaryColor
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: (){
                              setState(() {
                                if (widget.itemCount > 1) {
                                  widget.itemCount--;
                                  CartViewModel.updatedProducts[widget.product.product.orderID!] = widget.itemCount;
                                  widget.viewModel.reducePrice(widget.product.price ?? 0);
                                }
                              });
                            },
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            icon: const Icon(
                              Icons.remove_circle_outline,
                              color: AppColors.white,
                              size: 20,
                            )
                        ),
                        BlocBuilder<CartViewModel, CartStates>(
                          bloc: widget.viewModel,
                          builder: (context, cartState) {
                            return Text(
                              "${widget.itemCount}",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.poppins(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white
                              ),
                              overflow: TextOverflow.ellipsis,
                            );
                          },
                        ),
                        IconButton(
                            onPressed: (){
                              setState(() {
                                widget.itemCount++;
                                CartViewModel.updatedProducts[widget.product.product.orderID!] = widget.itemCount;
                                widget.viewModel.increasePrice(widget.product.price ?? 0);
                              });
                            },
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            icon: const Icon(
                              Icons.add_circle_outline,
                              color: AppColors.white,
                              size: 20,
                            )
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
