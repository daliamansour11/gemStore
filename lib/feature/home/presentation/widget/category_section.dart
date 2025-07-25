import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/resources/colors_manger.dart';
import '../Cubit/recommended_products_cubit.dart';
import '../cubit/main_Categories_cubit.dart';
import '../cubit/main_Categories_state.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({super.key});

  @override
  _CategorySectionState createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  @override
  void initState() {
    super.initState();
    final mainCategoryCubit = context.read<MainCategoriesCubit>();
    mainCategoryCubit.fetchMainCategories().then((_) {
      final categories = mainCategoryCubit.mainCategories;
      if (categories.isNotEmpty) {
        context
            .read<RecommendedProductsCubit>()
            .getRecommendedProductsByCategory(
              categoryId: categories.first.id!,
            );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final mainCategoryCubit = context.read<MainCategoriesCubit>();
    return BlocBuilder<MainCategoriesCubit, MainCategoriesState>(
      builder: (context, state) {
        if (state is MainCategoriesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MainCategoriesError) {
          return Center(child: Text(state.message));
        } else if (state is MainCategoriesSuccess ||
            state is ChangeSelectedIndexState) {
          final categories = mainCategoryCubit.mainCategories;

          return SizedBox(
            height: 80.h,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(categories.length, (index) {
                  final category = categories[index];
                  final isSelected = index == mainCategoryCubit.selectedIndex;
                  return GestureDetector(
                    onTap: () {
                      mainCategoryCubit.changeSelectedIndex(index);

                      context
                          .read<RecommendedProductsCubit>()
                          .getRecommendedProductsByCategory(
                              categoryId: category.id!);
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 38.w,
                          height: 36.w,
                          margin: EdgeInsets.symmetric(horizontal: 8.w),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isSelected
                                ? ColorsManger.brown
                                : ColorsManger.categoryColor,
                          ),
                          child: CircleAvatar(
                            radius: 18.w,
                            backgroundColor: Colors.transparent,
                            child: ClipOval(
                              child: Image.network(
                                category.image ?? '',
                                width: 36.w,
                                height: 36.w,
                                fit: BoxFit.cover,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Shimmer.fromColors(
                                    baseColor: Colors.grey.shade300,
                                    highlightColor: Colors.grey.shade100,
                                    child: Container(
                                      width: 36.w,
                                      height: 36.w,
                                      color: Colors.white,
                                    ),
                                  );
                                },
                                errorBuilder: (_, __, ___) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        FittedBox(
                          child: Text(
                            category.name ?? '',
                            style: TextStyle(
                              fontSize: 10,
                              color: isSelected
                                  ? ColorsManger.brown
                                  : ColorsManger.iconColor,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          );
        } else {
          return const SizedBox(); // empty state
        }
      },
    );
  }
}
