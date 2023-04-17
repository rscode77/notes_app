import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:notes_app/features/notes/presentation/widgets/information_widget.dart';
import 'package:notes_app/features/notes/presentation/widgets/menu_item_widget.dart';
import 'package:notes_app/features/splash_screen/blocs/splash_screen/splash_screen_bloc.dart';

import '../../../../app_constants.dart';
import '../../../../enums.dart';

import '../../blocs/bloc/notes_bloc.dart';
import '../../domain/data/entities/note.dart';

import '../widgets/notes_container_widget.dart';
import '../widgets/notes_list_widget.dart';
import '../widgets/user_profile_widget.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  bool resizeNoteList = true;
  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.height);
    // print(MediaQuery.of(context).size.width);

    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: [
            Gap(30.h),
            BlocBuilder<SplashScreenBloc, SplashScreenState>(
              builder: (context, state) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const UserProfileWidget(
                        name: 'Jenny Breaks',
                      ),
                      InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        onTap: () => showDialog(
                          context: context,
                          builder: (context) => const InformationWidget(),
                        ),
                        child: const Icon(Icons.info_outline_rounded, size: 25),
                      ).animate(onPlay: (controller) => controller.repeat(period: const Duration(seconds: 5))).shake()
                    ],
                  ),
                );
              },
            ),
            Gap(resizeNoteList ? 30.h : 0.h),
            BlocBuilder<NotesBloc, NotesState>(
              builder: (context, notesState) {
                var notes = filterNotes(notesState.notes, notesState.selectedMenuTab);
                return Expanded(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Column(
                          children: [
                            Visibility(
                              visible: resizeNoteList,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  NotesContainerWidget(
                                    notesTitle: 'Notes',
                                    active: notesState.selectedMenuTab == MenuTab.notes,
                                    notesQuantity: notesState.notes.where((element) => element.noteStatus == 'standard').toList().length,
                                    onPressed: () => changeMenuTab(context, MenuTab.notes),
                                  ),
                                  Gap(10.w),
                                  NotesContainerWidget(
                                    notesTitle: 'Important',
                                    active: notesState.selectedMenuTab == MenuTab.important,
                                    notesQuantity: notesState.notes.where((element) => element.noteStatus == 'important').toList().length,
                                    onPressed: () => changeMenuTab(context, MenuTab.important),
                                  ),
                                  Gap(10.w),
                                ],
                              ),
                            ),
                            Gap(30.h),
                            Row(
                              children: [
                                MenuItemWidget(
                                  active: notesState.selectedMenuTab == MenuTab.notes,
                                  title: 'Notes',
                                  onPressed: () => changeMenuTab(context, MenuTab.notes),
                                ),
                                Gap(30.w),
                                MenuItemWidget(
                                  active: notesState.selectedMenuTab == MenuTab.important,
                                  title: 'Important',
                                  onPressed: () => changeMenuTab(context, MenuTab.important),
                                ),
                                Gap(30.w),
                                MenuItemWidget(
                                  active: notesState.selectedMenuTab == MenuTab.performed,
                                  title: 'Performed',
                                  onPressed: () => changeMenuTab(context, MenuTab.performed),
                                ),
                                const Spacer(),
                                InkWell(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  onTap: () => setState(() {
                                    resizeNoteList = !resizeNoteList;
                                  }),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: blue,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    height: 35.h,
                                    width: 35.w,
                                    child: Icon(
                                      resizeNoteList ? Icons.arrow_circle_up_rounded : Icons.arrow_circle_down_rounded,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                ).animate(onPlay: (controller) => controller.repeat(period: const Duration(seconds: 5))).shake(),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Gap(10.h),
                      NotesListWidget(notes: notes),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void changeMenuTab(BuildContext context, MenuTab menuTab) {
    context.read<NotesBloc>().add(ChangeMenuTabEvent(menuTab: menuTab));
  }

  List<Note> filterNotes(List<Note> stateNotes, MenuTab menuTab) {
    String filter = '';
    switch (menuTab) {
      case MenuTab.notes:
        filter = 'standard';
        break;
      case MenuTab.important:
        filter = 'important';
        break;
      case MenuTab.performed:
        filter = 'performed';
        break;
      default:
        filter = 'standard';
    }
    return stateNotes.where((element) => element.noteStatus == filter).toList();
  }
}
