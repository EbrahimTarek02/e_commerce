import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/data/model/categories_response/categories_response_DM.dart';
import 'package:e_commerce/data/model/products_response/products_response.dart';
import 'package:e_commerce/domain/use_cases/main_use_cases/get_all_categories_use_case.dart';
import 'package:e_commerce/domain/use_cases/main_use_cases/get_all_products_use_case.dart';
import 'package:e_commerce/ui/screens/all_products/all_products_screen.dart';
import 'package:e_commerce/ui/screens/main/main_states.dart';
import 'package:e_commerce/ui/screens/main/main_view_model.dart';
import 'package:e_commerce/ui/screens/main/tabs/home/widgets/grid_view_builder.dart';
import 'package:e_commerce/ui/shared_widgets/failure_widget.dart';
import 'package:e_commerce/ui/shared_widgets/product_item.dart';
import 'package:e_commerce/ui/utils/app_assets.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late MainViewModel mainViewModel;

  @override
  void initState() {
    mainViewModel = BlocProvider.of(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CarouselSlider(
            items: [
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                ),
                child: Image.asset(
                  AppAssets.offer_1,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                ),
                child: Image.asset(
                  AppAssets.offer_2,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                ),
                child: Image.asset(
                  AppAssets.offer_3,
                  fit: BoxFit.fill,
                ),
              ),
            ],
            options: CarouselOptions(
              height: MediaQuery.sizeOf(context).height * 0.2,
              autoPlay: true,
              enlargeCenterPage: true
            )
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.03,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Categories',
              style: GoogleFonts.poppins(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor),
            ),
          ),

          BlocBuilder<GetAllCategoriesUseCase, MainStates>(
              bloc: mainViewModel.getAllCategoriesUseCase,
              builder: (context, state) {
                if (state is MainSuccessState<CategoriesResponseDm>) {
                  return SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.28,
                      child: GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemCount: state.data.Categories!.length,
                          itemBuilder: (context, index) =>
                              GridViewBuilder(state.data.Categories![index])));
                }
                else if (state is MainErrorState) {
                  return FailureWidget(
                    errorMessage: state.errorMessage,
                    tryAgainFunction: () {
                      mainViewModel.getAllCategories();
                    },
                  );
                } else {
                  return SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.28,
                      child: const Center(
                          child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      )));
                }
              }),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Explore Products',
                  style: GoogleFonts.poppins(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AllProductsScreen.routeName);
                  },
                  child: Text(
                    'View all',
                    style: GoogleFonts.poppins(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w300,
                        color: AppColors.primaryColor),
                  ),
                ),
              ],
            ),
          ),

          BlocBuilder<GetAllProductsUseCase, MainStates>(
              bloc: mainViewModel.getAllProductsUseCase,
              builder: (context, state) {
                if (state is MainSuccessState<ProductsResponseDM>) {
                  return SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.3,
                    child: BlocBuilder<MainViewModel, MainStates>(
                      bloc: mainViewModel,
                      builder: (context, itemState) {
                        if (itemState is ! MainLoadingState) {
                          return ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: state.data.products!.length,
                              itemBuilder: (context, index) {
                                bool isInWishList = MainViewModel.wishList
                                    .contains(state.data.products![index].id);
                                bool isInCart = MainViewModel.cartIDs
                                    .contains(state.data.products![index].id);
                                return ProductItem(
                                  state.data.products![index], false, isInWishList, isInCart,);
                              });
                        }
                        else {
                          return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),);
                        }
                      },
                    ),
                  );
                }
                else if (state is MainErrorState) {
                  return FailureWidget(
                    errorMessage: state.errorMessage,
                    tryAgainFunction: () {
                      mainViewModel.getAllProducts();
                    },
                  );
                } else {
                  return SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.33,
                      child: const Center(
                          child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      )));
                }
              }),
        ],
      ),
    );
  }
}
