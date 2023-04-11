import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:notes_app/features/notes/presentation/widgets/menu_item.dart';
import 'package:notes_app/features/notes/presentation/widgets/notes_category_widget.dart';

import '../../../../app_constants.dart';
import '../../../../enums.dart';
import '../../blocs/bloc/notes_bloc.dart';
import '../widgets/user_profile_widget.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 30.w,
            vertical: 40.h,
          ),
          child: Column(
            children: [
              const UserProfileWidget(
                image: '',
                name: 'Jenny Breaks',
              ),
              Gap(40.h),
              const NotesCategoryWidget(),
              Gap(40.h),
              BlocBuilder<NotesBloc, NotesState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      MenuItemWidget(
                        active: state.selectedMenuTab == MenuTab.notes,
                        title: 'Notes',
                        onPressed: () => changeMenuTab(context, MenuTab.notes),
                      ),
                      Gap(30.w),
                      MenuItemWidget(
                        active: state.selectedMenuTab == MenuTab.important,
                        title: 'Important',
                        onPressed: () => changeMenuTab(context, MenuTab.important),
                      ),
                      Gap(30.w),
                      MenuItemWidget(
                        active: state.selectedMenuTab == MenuTab.performed,
                        title: 'Performed',
                        onPressed: () => changeMenuTab(context, MenuTab.performed),
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void changeMenuTab(BuildContext context, MenuTab menuTab) {
    context.read<NotesBloc>().add(ChangeMenuTab(menuTab: menuTab));
  }
}
