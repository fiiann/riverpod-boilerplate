import 'package:flutter_boilerplate/feature/home/state/books_state.dart';
import 'package:flutter_boilerplate/shared/http/app_exception.dart';
import 'package:flutter_boilerplate/shared/network/dio/api_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BooksRepositoryProtocol {
  Future<BooksState> fetchBooks();
}

final booksRepositoryProvider = Provider(BooksRepository.new);

class BooksRepository implements BooksRepositoryProtocol {
  BooksRepository(this._ref);

  late final ApiProvider _api = _ref.read(apiProvider);
  final Ref _ref;

  @override
  Future<BooksState> fetchBooks() async {
    try {
      final response = await _api.fetchBook();
      return BooksState.booksLoaded(response);
    } catch (e) {
      return BooksState.error(AppException.errorWithMessage(e.toString()));
    }
  }
}
