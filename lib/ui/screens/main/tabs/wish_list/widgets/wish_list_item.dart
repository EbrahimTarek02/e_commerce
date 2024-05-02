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
class WishListItem extends StatefulWidget {
  final Product product;
  bool isLoading = false;

  WishListItem(this.product, {Key? key}) : super(key: key);

  @override
  State<WishListItem> createState() => _WishListItemState();
}

class _WishListItemState extends State<WishListItem> {

  late MainViewModel viewModel;

  @override
  void initState() {
    viewModel = BlocProvider.of(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailsScreen.routeName, arguments: [widget.product, true]);
      },
      child: Container(
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
              imageUrl: widget.product.imageCover ?? "",
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
                          widget.product.title ?? "product title",
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
                          setState(() {
                            widget.isLoading = true;
                            viewModel.removeFromWishList(widget.product, false);
                          });
                        },
                        icon: widget.isLoading ?
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                          width: MediaQuery.of(context).size.width * 0.03,
                          child: const CircularProgressIndicator(color: AppColors.primaryColor,),
                        )
                        :
                        const ImageIcon(
                          AssetImage(
                            AppAssets.inWishListIcon
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
                    child: ElevatedButton(
                      onPressed: (){
                        // add item to cart
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                      ),
                      child: Text(
                        "Add to Cart",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white
                        ),
                      ),
                    ),
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
