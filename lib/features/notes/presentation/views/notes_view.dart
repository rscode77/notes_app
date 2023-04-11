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
            vertical: 30.h,
          ),
          child: Column(
            children: [
              const UserProfileWidget(
                image: '',
                name: 'Jenny Breaks',
              ),
              Gap(30.h),
              const NotesCategoryWidget(),
              Gap(30.h),
              BlocBuilder<NotesBloc, NotesState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      Row(
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
                      ),
                      Gap(20.h),
                      Container(
                        padding: EdgeInsets.only(
                          left: 25.w,
                          right: 25.w,
                          top: 15.h,
                          bottom: 15.h,
                        ),
                        height: 160.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: gray,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Title',
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                                Text(
                                  'Time',
                                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                        color: grayText,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            ),
                            Gap(20.h),
                            Text(
                              'Description',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Date',
                                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                        color: grayText,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Container(
                                  decoration: BoxDecoration(color: blue, borderRadius: BorderRadius.circular(8)),
                                  height: 30.h,
                                  width: 30.w,
                                  child: const Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
              Spacer(),
              Container(
                height: 65.h,
                width: 65.w,
                child: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: blue,
                  child: Icon(
                    Icons.add,
                  ),
                ),
              ),
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
