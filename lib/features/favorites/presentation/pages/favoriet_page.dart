import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutors/core/constants/app_constants.dart';
import 'package:tutors/core/widgets/loading_widget.dart';
import 'package:tutors/features/favorites/presentation/cubit/favorite_cubit.dart';
import 'package:tutors/generated/locale_keys.g.dart';

import '../../../../core/navigator/app_navigator.dart';
import '../../../../core/routes/route_path.dart';
import '../../../courses/presentation/widgets/course_item.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FavoriteCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.kMyFavorite.tr()),
      ),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state.status == DataStatus.loading) {
            return const LoadingWidget();
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: state.listFavorite?.map((favorite) {
                    return CourseItem(
                      course: favorite.course!,
                      isFavorite: true,
                      onPressed: () async {
                        await AppNavigator.navigateCallbackData(
                            RoutePath.courseDetailRoute,
                            params: favorite.course);

                        await cubit.getFavorite();
                      },
                    );
                  }).toList() ??
                  [],
            ),
          );
        },
      ),
    );
  }
}
