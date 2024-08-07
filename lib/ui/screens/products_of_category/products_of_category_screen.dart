import 'package:e_commerce/data/model/categories_response/categories_response_DM.dart';
import 'package:e_commerce/data/model/products_response/products_response.dart';
import 'package:e_commerce/domain/di/di.dart';
import 'package:e_commerce/domain/use_cases/main_use_cases/get_products_with_category_id_use_case.dart';
import 'package:e_commerce/ui/screens/cart/cart_screen.dart';
import 'package:e_commerce/ui/screens/cart/cart_view_model.dart';
import 'package:e_commerce/ui/screens/main/main_states.dart';
import 'package:e_commerce/ui/screens/main/main_view_model.dart';
import 'package:e_commerce/ui/screens/products_of_category/products_of_category_view_model.dart';
import 'package:e_commerce/ui/screens/products_of_category/products_of_category_states.dart';
import 'package:e_commerce/ui/shared_widgets/failure_widget.dart';
import 'package:e_commerce/ui/shared_widgets/product_item.dart';
import 'package:e_commerce/ui/utils/app_assets.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsOfCategoryScreen extends StatefulWidget {
  static const String routeName = "products of category";

  const ProductsOfCategoryScreen({Key? key}) : super(key: key);

  @override
  State<ProductsOfCategoryScreen> createState() =>
      _ProductsOfCategoryScreenState();
}

class _ProductsOfCategoryScreenState extends State<ProductsOfCategoryScreen> {
  late MainViewModel mainViewModel;
  late CartViewModel cartViewModel;
  ProductsOfCategoryViewModel viewModel = getIt<ProductsOfCategoryViewModel>();
  Category? category;
  late RangeValues priceRange;

  @override
  void initState() {
    mainViewModel = BlocProvider.of(context);
    cartViewModel = BlocProvider.of(context);
    Future.delayed(
      Duration.zero,
      () {
        mainViewModel
            .getProductsWithCategoryID(category?.id ?? "", true)
            .then((value) {
          priceRange = RangeValues(
              GetProductsWithCategoryIDUseCase.minPrice.toDouble(),
              GetProductsWithCategoryIDUseCase.maxPrice.toDouble());
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    category = ModalRoute.of(context)!.settings.arguments as Category?;

    return BlocBuilder<GetProductsWithCategoryIDUseCase, MainStates>(
      bloc: mainViewModel.getProductsWithCategoryIDUseCase,
      builder: (context, state) {
        return Scaffold(
            backgroundColor: AppColors.white,
            appBar: AppBar(
              iconTheme: const IconThemeData(color: AppColors.primaryColor),
              title: Text(
                category?.name ?? "Category",
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
            floatingActionButton: state
                        is MainSuccessState<ProductsResponseDM> &&
                    state.data.products!.isNotEmpty
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
                                        "Brand",
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.poppins(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.primaryColor),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const Divider(),
                                      SizedBox(
                                        height: GetProductsWithCategoryIDUseCase
                                                    .categoryBrands.length >
                                                3
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.12
                                            : MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.06,
                                        child: GridView.builder(
                                          itemCount:
                                              GetProductsWithCategoryIDUseCase
                                                  .categoryBrands.length,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount:
                                                      GetProductsWithCategoryIDUseCase
                                                                  .categoryBrands
                                                                  .length >
                                                              3
                                                          ? 2
                                                          : 1,
                                                  mainAxisSpacing: 10.0,
                                                  crossAxisSpacing: 10.0,
                                                  childAspectRatio: 0.25),
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return BlocBuilder<
                                                ProductsOfCategoryViewModel,
                                                ProductsOfCategoryStates>(
                                              bloc: viewModel,
                                              builder: (context, _) {
                                                return InkWell(
                                                  onTap: () {
                                                    viewModel.changeRadioButton(
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
                                                                .changeRadioButton(
                                                                    index);
                                                          },
                                                          value: index,
                                                          toggleable: true,
                                                        ),
                                                        Text(
                                                          GetProductsWithCategoryIDUseCase
                                                              .categoryBrands
                                                              .toList()[index],
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
                                                  priceSliderState(() {});
                                                },
                                                min:
                                                    GetProductsWithCategoryIDUseCase
                                                        .minPrice
                                                        .toDouble(),
                                                max:
                                                    GetProductsWithCategoryIDUseCase
                                                        .maxPrice
                                                        .toDouble(),
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
                                      BlocBuilder<ProductsOfCategoryViewModel,
                                          ProductsOfCategoryStates>(
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
                                                        onChanged: (_) {
                                                          viewModel
                                                              .changeSortingType(
                                                                  0);
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
                                                          viewModel
                                                              .changeSortingType(
                                                                  1);
                                                        },
                                                        toggleable: true,
                                                        value: 1,
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
                                            mainViewModel.getProductsWithCategoryID(
                                                category?.id ?? "", false,
                                                priceLessThan:
                                                    priceRange.end.ceil(),
                                                priceGreaterThan:
                                                    priceRange.start.floor(),
                                                brandID: viewModel
                                                            .selectedBrand !=
                                                        null
                                                    ? GetProductsWithCategoryIDUseCase
                                                            .categoryBrandIDs
                                                            .toList()[
                                                        viewModel
                                                            .selectedBrand!]
                                                    : null,
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
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Image.asset(
                                AppAssets.outOfStockImage,
                                height: MediaQuery.sizeOf(context).height * 0.3,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.05,
                              ),
                              Text(
                                "There is no available ${category?.name ?? ""} products",
                                style: GoogleFonts.poppins(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primaryColor),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height:
                                MediaQuery.sizeOf(context).height * 0.05,
                              ),
                            ],
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
                                    bool isInCart = MainViewModel.cartIDs
                                        .contains(
                                            state.data.products![index].id);
                                    return ProductItem(
                                        state.data.products![index],
                                        true,
                                        isInWishList,
                                        isInCart);
                                  });
                            })
                    : state is MainErrorState
                        ? FailureWidget(
                            errorMessage: state.errorMessage,
                            tryAgainFunction: () {
                              mainViewModel
                                  .getProductsWithCategoryID(category?.id ?? "", true)
                                  .then((value) {
                                priceRange = RangeValues(
                                    GetProductsWithCategoryIDUseCase.minPrice.toDouble(),
                                    GetProductsWithCategoryIDUseCase.maxPrice.toDouble());
                              });
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
