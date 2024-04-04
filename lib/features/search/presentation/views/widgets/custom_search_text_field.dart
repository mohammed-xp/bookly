import 'package:bookly/core/utils/function/custom_snack_bar.dart';
import 'package:bookly/features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({super.key});

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  final TextEditingController searchTextFieldController =
      TextEditingController();

  @override
  void dispose() {
    searchTextFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        return TextField(
          controller: searchTextFieldController,
          textInputAction: TextInputAction.done,
          onSubmitted: (text){
            searchBooks(context, query: text);
          },
          decoration: InputDecoration(
            hintText: 'Search',
            enabledBorder: buildOutlineInputBorder(),
            focusedBorder: buildOutlineInputBorder(),
            suffixIcon: IconButton(
              icon: const Opacity(
                opacity: 0.6,
                child: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 20,
                  // color: Colors.white.withOpacity(0.6),
                ),
              ),
              onPressed: () {
                final String query = searchTextFieldController.text;
                searchBooks(context, query: query);
              },
            ),
          ),
        );
      },
    );
  }

  void searchBooks(BuildContext context, {required String query}) {
    if(query.isEmpty){
      customSnackBar(context, 'Please enter text');
    } else{
      FocusManager.instance.primaryFocus!.unfocus();
      BlocProvider.of<SearchBooksCubit>(context)
          .searchBooks(query: query);
    }
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(12));
  }
}
