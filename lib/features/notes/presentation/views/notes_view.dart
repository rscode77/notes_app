import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:notes_app/features/notes/presentation/widgets/menu_item.dart';
import 'package:notes_app/features/notes/presentation/widgets/notes_category_widget.dart';

import '../../../../app_constants.dart';
import '../../../../enums.dart';
import '../../blocs/bloc/notes_bloc.dart';
import '../../domain/data/entities/note.dart';
import '../widgets/note_widget.dart';
import '../widgets/notes_list_widget.dart';
import '../widgets/user_profile_widget.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 35.w,
          ),
          child: Column(
            children: [
              Gap(30.h),
              const UserProfileWidget(
                image: '',
                name: 'Jenny Breaks',
              ),
              Gap(30.h),
              const NotesCategoryWidget(),
              Gap(30.h),
              BlocBuilder<NotesBloc, NotesState>(
                builder: (context, state) {
                  var notes = filterNotes(state.notes, state.selectedMenuTab);
                  return Column(
                    children: [
                      Row(
                        children: [
                          MenuItemWidget(
                            active: state.selectedMenuTab == MenuTab.notes,
                            title: 'Notes',
                            onPressed: () => {
                              changeMenuTab(context, MenuTab.notes),
                            },
                          ),
                          Gap(30.w),
                          MenuItemWidget(
                            active: state.selectedMenuTab == MenuTab.important,
                            title: 'Important',
                            onPressed: () => {
                              changeMenuTab(context, MenuTab.important),
                            },
                          ),
                          Gap(30.w),
                          MenuItemWidget(
                            active: state.selectedMenuTab == MenuTab.performed,
                            title: 'Performed',
                            onPressed: () => {
                              changeMenuTab(context, MenuTab.performed),
                            },
                          ),
                        ],
                      ),
                      Gap(10.h),
                      NotesListWidget(notes: notes),
                    ],
                  );
                },
              ),
            ],
          ),
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
