import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/data/model/products_response/products_response.dart';
import 'package:e_commerce/data/model/specific_product_response/specific_product_response.dart';
import 'package:e_commerce/domain/di/di.dart';
import 'package:e_commerce/domain/use_cases/get_specific_product_use_case/get_specific_product_use_case.dart';
import 'package:e_commerce/ui/screens/main/main_states.dart';
import 'package:e_commerce/ui/screens/main/main_view_model.dart';
import 'package:e_commerce/ui/screens/product_details/product_details_states.dart';
import 'package:e_commerce/ui/screens/product_details/product_details_view_model.dart';
import 'package:e_commerce/ui/utils/app_assets.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailsScreen extends StatefulWidget {

  static const String routeName = "product Details Screen";

  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  late MainViewModel mainViewModel;
  ProductDetailsViewModel viewModel = getIt<ProductDetailsViewModel>();
  late Product product;
  late bool isInWishList;
  late bool isInCart;

  @override
  void initState() {
    mainViewModel = BlocProvider.of(context);
    Future.delayed(
      Duration.zero,
      () {
        viewModel.getProductDetails(product.id!);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    List args = ModalRoute.of(context)!.settings.arguments as List;
    product =  args[0];
    isInWishList = args[1];
    isInCart = args[2];
    mainViewModel.isInWishList = isInWishList;
    mainViewModel.isInCart = isInCart;

    return Scaffold(
      backgroundColor: AppColors.white,

      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColors.primaryColor
        ),
        title: Text(
          "Product Details",
          style: GoogleFonts.poppins(
              color: AppColors.primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        actions: [
          BlocBuilder<MainViewModel, MainStates>(
            bloc: mainViewModel,
            builder: (context, wishIconState) {
              return Container(
                padding: const EdgeInsets.only(right: 10),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: (){
                    if (mainViewModel.isInWishList) {
                        mainViewModel.removeFromWishList(product, true);
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              backgroundColor: AppColors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              behavior: SnackBarBehavior.floating,
                              margin: const EdgeInsets.only(
                                  bottom: 14.0,
                                  right: 20.0,
                                  left: 20.0
                              ),
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.clear,
                                    color: AppColors.white,
                                  ),
                                  const SizedBox(width: 4.0,),
                                  Text(
                                    'Product Removed Successfully',
                                    style: GoogleFonts.poppins(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.white
                                    ),
                                  ),
                                ],
                              )
                          )
                      );
                    }
                    else {
                        mainViewModel.addToWishList(product, true);
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                backgroundColor: AppColors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                behavior: SnackBarBehavior.floating,
                                margin: const EdgeInsets.only(
                                    bottom: 10.0,
                                    right: 20.0,
                                    left: 20.0
                                ),
                                content: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.check,
                                      color: AppColors.white,
                                    ),
                                    const SizedBox(width: 4.0,),
                                    Text(
                                      'Product Added Successfully',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.white
                                      ),
                                    ),
                                  ],
                                )
                            )
                        );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.white,
                      shadowColor: AppColors.tabBarBackgroundColor,
                      elevation: 3.0,
                  ),
                  icon:
                  wishIconState is WishIconLoadingState
                      ?
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.018,
                    width: MediaQuery.of(context).size.width * 0.03,
                    child: const CircularProgressIndicator(color: AppColors.primaryColor,),
                  )
                      :
                  ImageIcon(
                    AssetImage(
                      mainViewModel.isInWishList ?  AppAssets.inWishListIcon :
                      AppAssets.wishListTabIcon,
                    ),
                    color: AppColors.primaryColor,
                  ),
                ),
              );
            },
          ),
        ],
      ),

      body: BlocBuilder<GetSpecificProductUseCase, MainStates>(
        bloc: viewModel.getSpecificProductUseCase,
        builder: (context, state) {
          if (state is MainSuccessState<SpecificProductResponse>) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CarouselSlider(
                      items: buildProductImageSlider(state.data.product?.images ?? []),
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        height: MediaQuery.of(context).size.height * 0.3
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        product.title ?? "Title",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryColor
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "Brand: ${product.brand?.name ?? "Brand"}",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryColor
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "EGP ${(product.price) ?? "Price"}",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.poppins(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryColor
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            product.price != null ? "EGP ${(product.price! * 1.2).floor()}" : "",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.poppins(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textFormFieldIconColor,
                                decoration: TextDecoration.lineThrough
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "Description",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryColor
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child:
                      (product.description ?? '').length < 70
                          ?
                      Text(
                        product.description ?? "Description",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryColor
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      )
                          :
                      BlocBuilder<ProductDetailsViewModel, ProductDetailsStates>(
                        bloc: viewModel,
                        builder: (context, descriptionState) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                !viewModel.textIsVisible ? "${(product.description ?? "").substring(0, 70)}..." : (product.description ?? ""),
                                textAlign: TextAlign.start,
                                style: GoogleFonts.poppins(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primaryColor
                                ),
                              ),
                              Row(
                                children: [
                                  const Spacer(),
                                  TextButton(
                                    onPressed: (){
                                      // setState(() {
                                      //   textVisible = !textVisible;
                                      // });
                                      viewModel.changeTextVisibility();
                                    },
                                    child: Text(
                                      !viewModel.textIsVisible ? "Read more..." : "Show Less",
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.poppins(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.primaryColor
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      )
                      ,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(color: AppColors.primaryColor)
                            ),
                            child: Text(
                              "${product.quantity} Available",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.poppins(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryColor
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                product.ratingsAverage! >= 1 ? Icons.star_rate_rounded : (product.ratingsAverage! >= 0.5 ? Icons.star_half_rounded : Icons.star_border_rounded),
                                color: AppColors.yellow,
                                size: 20,
                              ),
                              Icon(
                                product.ratingsAverage! >= 2 ? Icons.star_rate_rounded : (product.ratingsAverage! >= 1.5 ? Icons.star_half_rounded : Icons.star_border_rounded),
                                color: AppColors.yellow,
                                size: 20,
                              ),
                              Icon(
                                product.ratingsAverage! >= 3 ? Icons.star_rate_rounded : (product.ratingsAverage! >= 2.5 ? Icons.star_half_rounded : Icons.star_border_rounded),
                                color: AppColors.yellow,
                                size: 20,
                              ),
                              Icon(
                                product.ratingsAverage! >= 4 ? Icons.star_rate_rounded : (product.ratingsAverage! >= 3.5 ? Icons.star_half_rounded : Icons.star_border_rounded),
                                color: AppColors.yellow,
                                size: 20,
                              ),
                              Icon(
                                product.ratingsAverage! >= 5 ? Icons.star_rate_rounded : (product.ratingsAverage! >= 4.5 ? Icons.star_half_rounded : Icons.star_border_rounded),
                                color: AppColors.yellow,
                                size: 20,
                              ),
                              const SizedBox(width: 10.0,),
                              Text(
                                product.ratingsAverage?.toStringAsFixed(2) ?? "Rate",
                                style: GoogleFonts.poppins(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryColor,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder <ProductDetailsViewModel, ProductDetailsStates>(
                      bloc: viewModel,
                      builder: (context, counterState) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Total Price",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.poppins(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.primaryColor
                                    ),
                                  ),
                                  Text(
                                    "EGP ${product.price! * viewModel.productCount}",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.poppins(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.primaryColor
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    border: Border.all(color: AppColors.primaryColor),
                                    color: AppColors.primaryColor
                                ),
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: (){
                                          viewModel.removeProduct();
                                        },
                                        icon: const Icon(
                                          Icons.remove_circle_outline,
                                          color: AppColors.white,
                                        )
                                    ),
                                    Text(
                                      "${viewModel.productCount}",
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.poppins(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.white
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    IconButton(
                                        onPressed: (){
                                          viewModel.addProduct(product.quantity?.toInt() ?? 0);
                                        },
                                        icon: const Icon(
                                          Icons.add_circle_outline,
                                          color: AppColors.white,
                                        )
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    BlocBuilder<MainViewModel, MainStates>(
                      bloc: mainViewModel,
                      builder: (context, cartState) {
                        if (cartState is CartIconLoadingState) {
                          return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),);
                        }
                        else {
                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: FloatingActionButton(
                              onPressed: () {
                                if (mainViewModel.isInCart) {
                                  mainViewModel.removeFromCart(product.id ?? "", true);
                                }
                                else{
                                  mainViewModel.addToCart(product.id ?? "", true, viewModel.productCount);
                                }
                              },
                              backgroundColor: AppColors.primaryColor,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    mainViewModel.isInCart ? Icons.remove_shopping_cart_outlined : Icons.add_shopping_cart,
                                    color: AppColors.white,
                                  ),
                                  const SizedBox(width: 20.0,),
                                  Text(
                                    mainViewModel.isInCart ? "Remove from Cart" : 'Add to Cart',
                                    style: GoogleFonts.poppins(
                                        color: AppColors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          }
          else if (state is MainErrorState) {
            return Center(
              child: Text(
                state.errorMessage,
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryColor
                ),
                overflow: TextOverflow.ellipsis,
              ),
            );
          }
          else {
            return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor));
          }
        },
      ),
    );
  }

  List<Widget> buildProductImageSlider(List<String> images) {
    return images.map((image) {
      return Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryColor, width: 2),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: CachedNetworkImage(
            imageUrl: image,
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
      );
    }).toList();
  }
}
