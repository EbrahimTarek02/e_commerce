import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/data/model/products_response/products_response.dart';
import 'package:e_commerce/ui/screens/main/main_view_model.dart';
import 'package:e_commerce/ui/screens/product_details/product_details_screen.dart';
import 'package:e_commerce/ui/shared_widgets/loading_widget.dart';
import 'package:e_commerce/ui/utils/app_assets.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

//ignore: must_be_immutable
class ProductItem extends StatefulWidget {
  final Product product;
  final bool isVertical;
  final bool isInWishList;
  final bool isInCart;

  const ProductItem(this.product, this.isVertical, this.isInWishList, this.isInCart,
      {Key? key})
      : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  late MainViewModel mainViewModel;

  @override
  void initState() {
    mainViewModel = BlocProvider.of(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailsScreen.routeName,
            arguments: [widget.product, widget.isInWishList, widget.isInCart]);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.38,
        height: widget.isVertical ?  MediaQuery.of(context).size.height * 0.33 : MediaQuery.of(context).size.height * 0.3,
        margin: widget.isVertical
            ? const EdgeInsets.symmetric(vertical: 8.0)
            : const EdgeInsets.symmetric(horizontal: 8.0),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryColor, width: 2),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 9,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  CachedNetworkImage(
                      imageUrl: widget.product.imageCover ?? "",
                      // height: widget.isVertical ? MediaQuery.sizeOf(context).height * 0.2 : MediaQuery.sizeOf(context).height * 0.17,
                      width: double.infinity,
                      imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.fill,
                              ),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(14.0),
                                  topRight: Radius.circular(14.0)),
                            ),
                          ),
                      progressIndicatorBuilder: (_, __, ___) => const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          ),
                      errorWidget: (_, __, ___) => const Center(
                            child: Icon(Icons.error, color: AppColors.red,),
                          )),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: CircleAvatar(
                      maxRadius: 15.0,
                      child: IconButton(
                        onPressed: () {
                          if (widget.isInWishList) {
                            LoadingWidget.showLoading(context);
                            mainViewModel.removeFromWishList(
                                widget.product, false).then((_) {
                              Navigator.pop(context);
                            });
                          }
                          else {
                            LoadingWidget.showLoading(context);
                            mainViewModel.addToWishList(widget.product, false).then((_){
                              Navigator.pop(context);
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.white,
                            shadowColor: AppColors.tabBarBackgroundColor,
                            padding: EdgeInsets.zero,
                            elevation: 3.0),
                        icon: ImageIcon(
                                AssetImage(
                                  widget.isInWishList
                                      ? AppAssets.inWishListIcon
                                      : AppAssets.wishListTabIcon,
                                ),
                                size: 18,
                                color: AppColors.primaryColor,
                              ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Text(
                "${widget.product.price ?? "Price"} EGP",
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Text(
                widget.product.title ?? "Product",
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer(flex: 1,),
            Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.star_rate_rounded,
                    color: AppColors.yellow,
                    size: 20,
                  ),
                  Text(
                    widget.product.ratingsAverage?.toStringAsFixed(2) ?? "Rate",
                    style: GoogleFonts.poppins(
                      fontSize: 11.0,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        if (widget.isInCart) {
                          mainViewModel.removeFromCart(widget.product.id ?? "", false).then((_) {
                            Navigator.pop(context);
                          });
                          LoadingWidget.showLoading(context);
                        }
                        else {
                          mainViewModel.addToCart(widget.product.id ?? "", false, 1).then((_) {
                            Navigator.pop(context);
                          });
                          LoadingWidget.showLoading(context);
                        }
                      },
                    icon: Icon(
                            widget.isInCart ? Icons.check_circle : Icons.shopping_bag_outlined,
                            color: AppColors.primaryColor,
                            size: 24,
                          )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
