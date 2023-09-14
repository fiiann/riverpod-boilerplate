import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/feature/auth/provider/auth_provider.dart';
import 'package:flutter_boilerplate/feature/home/provider/books_provider.dart';
import 'package:flutter_boilerplate/feature/home/widget/row_book_widget.dart';
import 'package:flutter_boilerplate/shared/http/app_exception.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final local = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(local.home),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.adjust),
            onPressed: () {
              // ref.read(routerProvider).go(SignInRoute.path);
              ref.read(authNotifierProvider.notifier).logout();
            },
          ),
        ],
      ),
      body: _widgetContent(context, ref, local),
    );
  }

  Widget _widgetLoading(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations local,
  ) {
    return Center(
      child: Text(local.loading),
    );
  }

  Widget _widgetError(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations local,
  ) {
    return Center(
      child: Text(local.error),
    );
  }

  Widget _widgetContent(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations local,
  ) {
    final state = ref.watch(booksNotifierProvider);
    return state.when(
      loading: () {
        return _widgetLoading(context, ref, local);
      },
      booksLoaded: (books) {
        return ListView.builder(
          itemCount: books.length,
          itemBuilder: (BuildContext context, int index) {
            return RowBookWidget(book: books[index]);
          },
        );
      },
      error: (AppException error) {
        return _widgetError(context, ref, local);
      },
    );
  }
}
