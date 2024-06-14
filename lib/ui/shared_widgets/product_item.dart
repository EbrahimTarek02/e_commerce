import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/data/model/products_response/products_response.dart';
import 'package:e_commerce/ui/screens/main/main_view_model.dart';
import 'package:e_commerce/ui/screens/product_details/product_details_screen.dart';
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
  bool isLoading = false;
  bool cartIconIsLoading = false;

  ProductItem(this.product, this.isVertical, this.isInWishList, this.isInCart,
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
        width: MediaQuery.of(context).size.width * 0.45,
        height: MediaQuery.of(context).size.height * 0.33,
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
            Stack(
              alignment: Alignment.topRight,
              children: [
                CachedNetworkImage(
                    imageUrl: widget.product.imageCover ?? "",
                    height: MediaQuery.of(context).size.height * 0.18,
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
                          child: Icon(Icons.error),
                        )),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      if (widget.isInWishList) {
                        setState(() {
                          widget.isLoading = true;
                          mainViewModel.removeFromWishList(
                              widget.product, false);
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: AppColors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              behavior: SnackBarBehavior.floating,
                              margin: const EdgeInsets.only(
                                  bottom: 14.0, right: 20.0, left: 20.0),
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.clear,
                                    color: AppColors.white,
                                  ),
                                  const SizedBox(
                                    width: 4.0,
                                  ),
                                  Text(
                                    'Product Removed Successfully',
                                    style: GoogleFonts.poppins(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.white),
                                  ),
                                ],
                              )));
                        });
                      }
                      else {
                        setState(() {
                          widget.isLoading = true;
                          mainViewModel.addToWishList(widget.product, false);
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: AppColors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              behavior: SnackBarBehavior.floating,
                              margin: const EdgeInsets.only(
                                  bottom: 10.0, right: 20.0, left: 20.0),
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.check,
                                    color: AppColors.white,
                                  ),
                                  const SizedBox(
                                    width: 4.0,
                                  ),
                                  Text(
                                    'Product Added Successfully',
                                    style: GoogleFonts.poppins(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.white),
                                  ),
                                ],
                              )));
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.white,
                        shadowColor: AppColors.tabBarBackgroundColor,
                        elevation: 3.0),
                    icon: widget.isLoading
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height * 0.018,
                            width: MediaQuery.of(context).size.width * 0.03,
                            child: const CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          )
                        : ImageIcon(
                            AssetImage(
                              widget.isInWishList
                                  ? AppAssets.inWishListIcon
                                  : AppAssets.wishListTabIcon,
                            ),
                            color: AppColors.primaryColor,
                          ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.005,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                widget.product.title ?? "Product",
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.005,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Text(
                    "Reviews: ${widget.product.ratingsAverage?.toStringAsFixed(2) ?? "Rate"}",
                    style: GoogleFonts.poppins(
                      fontSize: 11.0,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Icon(
                    Icons.star_rate_rounded,
                    color: AppColors.yellow,
                    size: 20,
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        if (widget.isInCart) {
                          setState(() {
                            widget.cartIconIsLoading = true;
                            mainViewModel.removeFromCart(widget.product.id ?? "", false);
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: AppColors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                behavior: SnackBarBehavior.floating,
                                margin: const EdgeInsets.only(
                                    bottom: 14.0, right: 20.0, left: 20.0),
                                content: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.clear,
                                      color: AppColors.white,
                                    ),
                                    const SizedBox(
                                      width: 4.0,
                                    ),
                                    Text(
                                      'Product Removed Successfully',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.white),
                                    ),
                                  ],
                                )));
                          });
                        }
                        else {
                          setState(() {
                            widget.cartIconIsLoading = true;
                            mainViewModel.addToCart(widget.product.id ?? "", false, 1);
                            ScaffoldMessenger.of(context)
                                .hideCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    backgroundColor: AppColors.green,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(16.0),
                                    ),
                                    behavior: SnackBarBehavior.floating,
                                    margin: const EdgeInsets.only(
                                        bottom: 10.0,
                                        right: 20.0,
                                        left: 20.0),
                                    content: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.check,
                                          color: AppColors.white,
                                        ),
                                        const SizedBox(
                                          width: 4.0,
                                        ),
                                        Text(
                                          'Added To Cart',
                                          style: GoogleFonts.poppins(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.white),
                                        ),
                                      ],
                                    )));
                          });
                        }
                      },
                    icon: widget.cartIconIsLoading
                        ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.018,
                      width: MediaQuery.of(context).size.width * 0.03,
                      child: const CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    )
                        :
                    Icon(
                            widget.isInCart ? Icons.check_circle : Icons.add_circle,
                            color: AppColors.primaryColor,
                            size: 26,
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
