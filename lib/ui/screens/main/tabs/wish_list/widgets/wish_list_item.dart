import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/data/model/products_response/products_response.dart';
import 'package:e_commerce/ui/screens/main/main_states.dart';
import 'package:e_commerce/ui/screens/main/main_view_model.dart';
import 'package:e_commerce/ui/screens/product_details/product_details_screen.dart';
import 'package:e_commerce/ui/shared_widgets/loading_widget.dart';
import 'package:e_commerce/ui/utils/app_assets.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

//ignore: must_be_immutable
class WishListItem extends StatefulWidget {
  final Product product;
  bool isInCart;

  WishListItem(this.product, this.isInCart, {Key? key}) : super(key: key);

  @override
  State<WishListItem> createState() => _WishListItemState();
}

class _WishListItemState extends State<WishListItem> {

  late MainViewModel mainViewModel;

  @override
  void initState() {
    mainViewModel = BlocProvider.of(context);
    mainViewModel.isInCart = widget.isInCart;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailsScreen.routeName, arguments: [widget.product, true, widget.isInCart]);
      },
      child: Container(
        padding: const EdgeInsets.only(right: 10.0),
        margin: const EdgeInsets.symmetric(vertical: 12.0),
        height: MediaQuery.sizeOf(context).height * 0.18,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor,
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3),
            )
          ],
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: widget.product.imageCover ?? "",
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.35,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fill,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(14.0),
                    bottomLeft: Radius.circular(14.0),
                  ),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.33,
                        child: Text(
                          widget.product.title ?? "product title",
                          textAlign: TextAlign.start,
                          style: GoogleFonts.poppins(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryColor
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            mainViewModel.removeFromWishList(widget.product, false).then((_){
                              Navigator.pop(context);
                            });
                            LoadingWidget.showLoading(context);
                          });
                        },
                        icon: const ImageIcon(
                          AssetImage(
                            AppAssets.inWishListIcon
                          ),
                          size: 18,
                          color: AppColors.primaryColor,
                        ),
                        padding: const EdgeInsets.all(5.0),
                        constraints: const BoxConstraints(),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.white,
                            shadowColor: AppColors.tabBarBackgroundColor,
                            elevation: 3.0,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    "${widget.product.price ?? "product price"} EGP",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  BlocBuilder<MainViewModel, MainStates>(
                    bloc: mainViewModel,
                    builder: (context, cartState) {
                        return Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: (){
                              if (mainViewModel.isInCart && widget.isInCart) {
                                LoadingWidget.showLoading(context);
                                mainViewModel.removeFromCart(widget.product.id ?? "", true).then((_) {
                                  Navigator.pop(context);
                                });
                              }
                              else{
                                LoadingWidget.showLoading(context);
                                mainViewModel.addToCart(widget.product.id ?? "", true, 1).then((_) {
                                  Navigator.pop(context);
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.white,
                              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0)
                              ),
                            ),
                            child:
                            Text(
                              mainViewModel.isInCart && widget.isInCart ? "Remove from Cart" : "Add to Cart",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.poppins(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryColor
                              ),
                            ),
                          ),
                        );
                    },
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.01,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
