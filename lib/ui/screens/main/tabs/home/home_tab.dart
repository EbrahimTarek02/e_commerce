import 'package:e_commerce/data/model/categories_response/CategoriesResponseDM.dart';
import 'package:e_commerce/data/model/products_response/products_response.dart';
import 'package:e_commerce/domain/use_cases/main_use_cases/get_all_categories_use_case.dart';
import 'package:e_commerce/domain/use_cases/main_use_cases/get_all_products_use_case.dart';
import 'package:e_commerce/ui/screens/main/main_states.dart';
import 'package:e_commerce/ui/screens/main/main_view_model.dart';
import 'package:e_commerce/ui/screens/main/tabs/home/widgets/grid_view_builder.dart';
import 'package:e_commerce/ui/shared_widgets/product_item.dart';
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Categories',
              style: GoogleFonts.poppins(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor),
            ),
          ),
          BlocBuilder<GetAllCategoriesUseCase, MainStates>(
              bloc: mainViewModel.getAllCategoriesUseCase,
              builder: (context, state) {
                if (state is MainSuccessState<CategoriesResponseDm>) {
                  return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.35,
                      child: GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemCount: state.data.Categories!.length,
                          itemBuilder: (context, index) =>
                              GridViewBuilder(state.data.Categories![index])));
                } else if (state is MainErrorState) {
                  return Text(state.errorMessage);
                } else {
                  return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.35,
                      child: const Center(
                          child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      )));
                }
              }),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Explore Products',
                  style: GoogleFonts.poppins(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'View all',
                    style: GoogleFonts.poppins(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
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
                    height: MediaQuery.of(context).size.height * 0.33,
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
                                return ProductItem(
                                    state.data.products![index], false, isInWishList);
                              });
                        }
                        else {
                          return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),);
                        }
                      },
                    ),
                  );
                } else if (state is MainErrorState) {
                  return Text(state.errorMessage);
                } else {
                  return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.33,
                      child: const Center(
                          child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      )));
                }
              }),
          const SizedBox(
            height: 20.0,
          )
        ],
      ),
    );
  }
}
