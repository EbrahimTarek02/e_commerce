import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/data/model/products_response/products_response.dart';
import 'package:e_commerce/ui/screens/main/main_states.dart';
import 'package:e_commerce/ui/utils/app_assets.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductItem extends StatelessWidget {

  final MainSuccessState<ProductsResponseDM> productsResponse;
  final int index;
  final bool isVertical;

  const ProductItem(this.index, this.productsResponse, this.isVertical, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45,
        height: MediaQuery.of(context).size.height * 0.33,
        margin: isVertical ? const EdgeInsets.symmetric(vertical: 8.0) : const EdgeInsets.symmetric(horizontal: 8.0),
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
                  imageUrl: productsResponse.data.products![index].imageCover ?? "",
                  imageBuilder: (context, imageProvider) => Container(
                    height: MediaQuery.of(context).size.height * 0.155,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fill,
                        ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(14.0),
                        topRight: Radius.circular(14.0)
                      ),
                    ),
                  ),
                  errorWidget: (_, __, ___) => const Center(child: Icon(Icons.error),)
                ),
                Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.white
                  ),
                  child: const ImageIcon(
                    AssetImage(AppAssets.wishListTabIcon),
                  ),
                )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                productsResponse.data.products![index].brand?.name ?? "Brand",
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryColor
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                productsResponse.data.products![index].title ?? "Product",
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "${productsResponse.data.products![index].price ?? "Price"} EGP",
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Text(
                    "Reviews: ${productsResponse.data.products![index].ratingsAverage?.toStringAsFixed(2) ?? "Rate"}",
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
                    onPressed: (){},
                    icon: const Icon(
                      Icons.add_circle,
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
