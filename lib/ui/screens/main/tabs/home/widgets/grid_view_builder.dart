import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/data/model/categories_response/CategoriesResponseDM.dart';
import 'package:e_commerce/ui/screens/main/main_states.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridViewBuilder extends StatelessWidget {


  final MainSuccessState<CategoriesResponseDm> categoriesResponse;
  final int index;

  const GridViewBuilder(this.index, this.categoriesResponse, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.13,
            width: MediaQuery.of(context).size.width * 0.25,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: CachedNetworkImage(
              imageUrl: categoriesResponse.data.Categories![index].image ?? "",
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
            ),
          ),
          Text(
            categoriesResponse.data.Categories![index].name ?? "Category",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryColor
            ),
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
