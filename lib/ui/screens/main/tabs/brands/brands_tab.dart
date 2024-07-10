import 'package:e_commerce/data/model/brands_response/brands_response_DM.dart';
import 'package:e_commerce/data/model/products_response/products_response.dart';
import 'package:e_commerce/domain/use_cases/main_use_cases/get_all_brands_use_case.dart';
import 'package:e_commerce/domain/use_cases/main_use_cases/get_products_with_brand_id_use_case.dart';
import 'package:e_commerce/ui/screens/main/main_states.dart';
import 'package:e_commerce/ui/screens/main/main_view_model.dart';
import 'package:e_commerce/ui/shared_widgets/failure_widget.dart';
import 'package:e_commerce/ui/shared_widgets/product_item.dart';
import 'package:e_commerce/ui/utils/app_assets.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class BrandsTab extends StatefulWidget {

  const BrandsTab({Key? key}) : super(key: key);

  @override
  State<BrandsTab> createState() => _BrandsTabState();
}

class _BrandsTabState extends State<BrandsTab> {
  late MainViewModel mainViewModel;

  @override
  void initState() {
    mainViewModel = BlocProvider.of(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<GetAllBrandsUseCase, MainStates>(
        bloc: mainViewModel.getAllBrandsUseCase,
        builder: (context, state) {
          if (state is MainSuccessState<BrandsResponseDm>) {
            mainViewModel.getProductsWithBrandID(state.data.brands![0].id ?? "");
            return DefaultTabController(
                length: state.data.brands!.length,
                initialIndex: 0,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.35,
                      decoration: BoxDecoration(
                          color: AppColors.tabBarBackgroundColor,
                          borderRadius: BorderRadius.circular(16.0)
                      ),
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: TabBar(
                          onTap: (int index) {
                            mainViewModel.getProductsWithBrandID(state.data.brands![index].id ?? "");
                          },
                          isScrollable: true,
                          tabAlignment: TabAlignment.start,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorPadding: const EdgeInsets.all(10.0),
                          indicator: UnderlineTabIndicator(
                            borderSide: const BorderSide(
                              color: AppColors.primaryColor,
                              width: 4.0,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          tabs: buildTabBarTabs(state.data.brands!),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: TabBarView(
                            physics: const NeverScrollableScrollPhysics(),
                            children: buildTabBarViewTabs(context, state.data.brands!, mainViewModel)
                        ),
                      ),
                    )
                  ],
                )
            );
          }
          else if (state is MainErrorState) {
            return FailureWidget(
              errorMessage: state.errorMessage,
              tryAgainFunction: () {
                mainViewModel.getAllBrands();
              },
            );
          }
          else {
            return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),);
          }
        },
      ),
    );
  }
}

List<Widget> buildTabBarTabs(List<Brand> brands) {
  return brands.map((brand) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: RotatedBox(
        quarterTurns: 3,
        child: Text(
          brand.name ?? "Brand Name",
          style: GoogleFonts.poppins(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }).toList();
}

List<Widget> buildTabBarViewTabs(BuildContext context, List<Brand> brands, MainViewModel viewModel) {
  return brands.map((brand) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          brand.name ?? "Brand Name",
          style: GoogleFonts.poppins(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor
          ),
        ),
        Expanded(
          child: BlocBuilder<GetProductsWithBrandIDUseCase, MainStates>(
              bloc: viewModel.getProductsWithBrandIDUseCase,
              builder: (context, state){
                if (state is MainSuccessState<ProductsResponseDM>){
                  return state.data.products!.isEmpty
                      ?
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppAssets.outOfStockImage
                        ),
                        SizedBox(height: MediaQuery.sizeOf(context).height * 0.05,),
                        Text(
                          "There is no available products for ${brand.name ?? "this brand"}",
                          style: GoogleFonts.poppins(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryColor
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )
                      :
                    BlocBuilder<MainViewModel, MainStates>(
                      bloc: viewModel,
                      builder: (context, itemState){
                        return ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: state.data.products!.length,
                            itemBuilder: (context, index) {
                              bool isInWishList = MainViewModel.wishList
                                  .contains(state.data.products![index].id);
                              bool isInCart = MainViewModel.cartIDs.contains(state.data.products![index].id);
                              return ProductItem(state.data.products![index], true, isInWishList, isInCart);
                            }
                        );
                      }
                    );
                }
                else if (state is MainErrorState) {
                  return FailureWidget(
                    errorMessage: state.errorMessage,
                    tryAgainFunction: () {
                      viewModel.getProductsWithBrandID(brands[0].id ?? "");
                    },
                  );
                }
                else {
                  return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.33,
                      child: const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,))
                  );
                }
              }
          ),
        ),
      ],
    );
  }).toList();
}
