import 'package:e_commerce/data/model/brands_response/brands_response_DM.dart';
import 'package:e_commerce/data/model/categories_response/categories_response_DM.dart';
import 'package:e_commerce/data/model/products_response/products_response.dart';
import 'package:e_commerce/domain/di/di.dart';
import 'package:e_commerce/domain/use_cases/main_use_cases/get_all_brands_use_case.dart';
import 'package:e_commerce/domain/use_cases/main_use_cases/get_all_categories_use_case.dart';
import 'package:e_commerce/domain/use_cases/main_use_cases/get_all_products_with_filtration_use_case.dart';
import 'package:e_commerce/ui/screens/all_products/all_products_states.dart';
import 'package:e_commerce/ui/screens/all_products/all_products_view_model.dart';
import 'package:e_commerce/ui/screens/cart/cart_screen.dart';
import 'package:e_commerce/ui/screens/cart/cart_view_model.dart';
import 'package:e_commerce/ui/screens/main/main_states.dart';
import 'package:e_commerce/ui/screens/main/main_view_model.dart';
import 'package:e_commerce/ui/shared_widgets/failure_widget.dart';
import 'package:e_commerce/ui/shared_widgets/product_item.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AllProductsScreen extends StatefulWidget {
  static const routeName = "all products screen";

  const AllProductsScreen({Key? key}) : super(key: key);

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  late MainViewModel mainViewModel;
  late CartViewModel cartViewModel;
  AllProductsViewModel viewModel = getIt<AllProductsViewModel>();
  late RangeValues priceRange;

  @override
  void initState() {
    mainViewModel = BlocProvider.of(context);
    cartViewModel = BlocProvider.of(context);
    priceRange = const RangeValues(0, 100000);
    mainViewModel.getAllProductsWithFiltration();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<GetAllProductsWithFiltrationUseCase, MainStates>(
      bloc: mainViewModel.getAllProductsWithFiltrationUseCase,
      builder: (context, state) {

        return Scaffold(
            backgroundColor: AppColors.white,

            appBar: AppBar(
              iconTheme: const IconThemeData(color: AppColors.primaryColor),
              title: Text(
                "Explore Products",
                style: GoogleFonts.poppins(
                    color: AppColors.primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, CartScreen.routeName);
                    },
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                      color: AppColors.primaryColor,
                      size: 30,
                    ))
              ],
            ),

            floatingActionButton: state is MainSuccessState
                ? FloatingActionButton(
                    onPressed: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => SingleChildScrollView(
                                child: Container(
                                  padding: const EdgeInsets.all(16.0),
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Icon(
                                            Icons.keyboard_arrow_down,
                                            color: AppColors.primaryColor,
                                            size: 30,
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),

                                      Text(
                                        "Categories",
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.poppins(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.primaryColor),
                                        overflow: TextOverflow.ellipsis,
                                      ),

                                      const Divider(),

                                      BlocBuilder<GetAllCategoriesUseCase, MainStates>(
                                        bloc: mainViewModel.getAllCategoriesUseCase,
                                        builder: (context, categoriesState) {
                                          if (categoriesState is MainSuccessState<CategoriesResponseDm>) {
                                            viewModel.updateCategoriesCount(categoriesState.data.Categories ?? []);
                                            return SizedBox(
                                              height:
                                              MediaQuery.of(context).size.height * 0.12,
                                              child: GridView.builder(
                                                itemCount: categoriesState.data.Categories?.length ?? 0, // brands length
                                                gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                    mainAxisSpacing: 10.0,
                                                    crossAxisSpacing: 10.0,
                                                    childAspectRatio: 0.22),
                                                scrollDirection: Axis.horizontal,
                                                itemBuilder: (context, index) {
                                                  return BlocBuilder<
                                                      AllProductsViewModel,
                                                      AllProductsStates>(
                                                    bloc: viewModel,
                                                    builder: (context, _) {
                                                      return InkWell(
                                                        onTap: () {
                                                          viewModel
                                                              .changeCategoriesRadioButton(
                                                              index);
                                                        },
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                            border: Border.all(
                                                              color: AppColors
                                                                  .primaryColor,
                                                            ),
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                16.0),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                            children: [
                                                              Radio(
                                                                groupValue: viewModel
                                                                    .selectedCategory,
                                                                onChanged: (_) {
                                                                  viewModel
                                                                      .changeCategoriesRadioButton(
                                                                      index);
                                                                },
                                                                value: index,
                                                                toggleable: true,
                                                              ),
                                                              Text(
                                                                categoriesState.data.Categories?[index].name ?? "",
                                                                style: GoogleFonts.poppins(
                                                                    fontSize: 14.0,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                    color: AppColors
                                                                        .primaryColor),
                                                                overflow: TextOverflow
                                                                    .ellipsis,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            );
                                          }
                                          else {
                                            return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),);
                                          }
                                        },
                                      ),

                                      SizedBox(
                                        height:
                                        MediaQuery.of(context).size.height *
                                            0.03,
                                      ),

                                      Text(
                                        "Brand",
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.poppins(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.primaryColor),
                                        overflow: TextOverflow.ellipsis,
                                      ),

                                      const Divider(),

                                      BlocBuilder<GetAllBrandsUseCase, MainStates>(
                                        bloc: mainViewModel.getAllBrandsUseCase,
                                        builder: (context, brandsState){
                                          if (brandsState is MainSuccessState<BrandsResponseDm>) {
                                            viewModel.updateBrandsCount(brandsState.data.brands ?? []);
                                            return SizedBox(
                                              height:
                                              MediaQuery.of(context).size.height * 0.12,
                                              child: GridView.builder(
                                                itemCount: brandsState.data.brands?.length ?? 0, // brands length
                                                gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                    mainAxisSpacing: 10.0,
                                                    crossAxisSpacing: 10.0,
                                                    childAspectRatio: 0.22),
                                                scrollDirection: Axis.horizontal,
                                                itemBuilder: (context, index) {
                                                  return BlocBuilder<
                                                      AllProductsViewModel,
                                                      AllProductsStates>(
                                                    bloc: viewModel,
                                                    builder: (context, _) {
                                                      return InkWell(
                                                        onTap: () {
                                                          viewModel
                                                              .changeBrandsRadioButton(
                                                              index);
                                                        },
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                            border: Border.all(
                                                              color: AppColors
                                                                  .primaryColor,
                                                            ),
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                16.0),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                            children: [
                                                              Radio(
                                                                groupValue: viewModel
                                                                    .selectedBrand,
                                                                onChanged: (_) {
                                                                  viewModel
                                                                      .changeBrandsRadioButton(
                                                                      index);
                                                                },
                                                                value: index,
                                                                toggleable: true,
                                                              ),
                                                              Text(
                                                                brandsState.data.brands?[index].name ?? "",
                                                                style: GoogleFonts.poppins(
                                                                    fontSize: 14.0,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                    color: AppColors
                                                                        .primaryColor),
                                                                overflow: TextOverflow
                                                                    .ellipsis,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            );
                                          }
                                          else {
                                            return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),);
                                          }
                                        },
                                      ),

                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.03,
                                      ),

                                      Text(
                                        "Price Range",
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.poppins(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.primaryColor),
                                        overflow: TextOverflow.ellipsis,
                                      ),

                                      const Divider(),

                                      StatefulBuilder(
                                        builder: (context, priceSliderState) {
                                          return Column(
                                            children: [
                                              RangeSlider(
                                                values: priceRange,
                                                onChanged: (newPrice) {
                                                  priceRange = newPrice;
                                                  priceSliderState(() {
                                                  });
                                                },
                                                min:
                                                    0,
                                                max:
                                                  100000,
                                              ),
                                              Text(
                                                "${priceRange.start.toInt()}    ${priceRange.end.toInt()}",
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.poppins(
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        AppColors.primaryColor),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          );
                                        },
                                      ),

                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.03,
                                      ),

                                      Text(
                                        "Sort",
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.poppins(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.primaryColor),
                                        overflow: TextOverflow.ellipsis,
                                      ),

                                      const Divider(),

                                      BlocBuilder<AllProductsViewModel, AllProductsStates>(
                                        bloc: viewModel,
                                        builder: (context, _) {
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  viewModel
                                                      .changeSortingType(0);
                                                },
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 10.0),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: AppColors
                                                          .primaryColor,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Radio(
                                                        groupValue: viewModel
                                                            .selectedSortingType,
                                                        onChanged: (val) {
                                                          viewModel
                                                              .changeSortingType(0);
                                                        },
                                                        value: 0,
                                                        toggleable: true,
                                                      ),
                                                      Text(
                                                        "Highest Price",
                                                        style: GoogleFonts.poppins(
                                                            fontSize: 14.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: AppColors
                                                                .primaryColor),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  viewModel
                                                      .changeSortingType(1);
                                                },
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 10.0),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: AppColors
                                                          .primaryColor,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Radio(
                                                        groupValue: viewModel
                                                            .selectedSortingType,
                                                        onChanged: (_) {
                                                          viewModel.changeSortingType(1);
                                                        },
                                                        value: 1,
                                                        toggleable: true,
                                                      ),
                                                      Text(
                                                        "Lowest Price",
                                                        style: GoogleFonts.poppins(
                                                            fontSize: 14.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: AppColors
                                                                .primaryColor),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.03,
                                      ),

                                      ElevatedButton(
                                          onPressed: () {
                                            mainViewModel.getAllProductsWithFiltration(
                                                priceLessThan:
                                                    priceRange.end.ceil(),
                                                priceGreaterThan:
                                                    priceRange.start.floor(),
                                                brandID: viewModel.selectedBrand != null ? viewModel.brands[viewModel.selectedBrand!].id : null,
                                                categoryID: viewModel.selectedCategory != null ? viewModel.categories[viewModel.selectedCategory!].id : null,
                                                sortLowToHeightPrice: viewModel
                                                            .selectedSortingType ==
                                                        null
                                                    ? null
                                                    : viewModel.selectedSortingType ==
                                                            0
                                                        ? false
                                                        : true);
                                            Navigator.pop(context);
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  AppColors.primaryColor,
                                              elevation: 0.0,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 12),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15))),
                                          child: Text(
                                            'Show Results',
                                            style: GoogleFonts.poppins(
                                                color: AppColors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          )),
                                    ],
                                  ),
                                ),
                              ));
                    },
                    backgroundColor: AppColors.primaryColor,
                    child: const Icon(
                      Icons.tune,
                      color: AppColors.white,
                    ),
                  )
                : const SizedBox(),

            body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: state is MainSuccessState<ProductsResponseDM>
                    ? state.data.products!.isEmpty
                        ? Center(
                            child: Text(
                              "There is no available products.",
                              style: GoogleFonts.poppins(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryColor),
                              textAlign: TextAlign.center,
                            ),
                          )
                        : BlocBuilder<MainViewModel, MainStates>(
                            bloc: mainViewModel,
                            builder: (context, itemState) {
                              return GridView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemCount: state.data.products!.length,
                                  gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10.0,
                                      childAspectRatio: 0.60),
                                  itemBuilder: (context, index) {
                                    bool isInWishList = MainViewModel.wishList
                                        .contains(
                                        state.data.products![index].id);
                                    bool isInCart = MainViewModel.cartIDs.contains(state.data.products![index].id);
                                    return ProductItem(
                                        state.data.products![index],
                                        true,
                                        isInWishList,
                                        isInCart
                                    );
                                  });
                            })
                    : state is MainErrorState
                        ? FailureWidget(
                            errorMessage: state.errorMessage,
                            tryAgainFunction: (){
                              priceRange = const RangeValues(0, 100000);
                              mainViewModel.getAllProductsWithFiltration();
                            },
                          )
                        : const Center(
                            child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ))));
      },
    );
  }
}
