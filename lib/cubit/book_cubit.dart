import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hw3/models/book_model.dart';

// Define states
abstract class BookState extends Equatable {
  const BookState();

  @override
  List<Object?> get props => [];
}

class BookInitial extends BookState {}

class BookListLoaded extends BookState {
  final List<Book> books;

  const BookListLoaded(this.books);

  @override
  List<Object?> get props => [books];
}

// Cubit
class BookCubit extends Cubit<BookState> {
  BookCubit() : super(BookInitial());

  List<Book> books = [];

  void init() {
    books = [
      //The current Dart SDK version is 3.5.3.
      // Because hw3 depends on lorem any which doesn't support null safety, version solving failed.
      // The lower bound of "sdk: '<2.0.0'" must be 2.12.0 or higher to enable null safety.
      // So we using online generator to create Lorem Ipsum content for the description
      Book(
        title: 'The Charmer\'s Grit',
        author: 'Martha Nome',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        imagePath: 'assets/gift.png',
      ),
      Book(
        title: 'Memory',
        author: 'David Smith',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        imagePath: 'assets/memory.png',
      ),
      Book(
        title: 'James and the Giant Peach',
        author: 'Roald Dahl',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis.',
        imagePath: 'assets/James.png',
      ),
      Book(
        title: 'Little Women',
        author: 'Louisa May Alcott',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus iaculis libero id felis interdum, nec dapibus turpis aliquet. Integer tincidunt quam in turpis viverra, a accumsan leo mollis.',
        imagePath: 'assets/little.png',
      ),
    ];
    emit(BookListLoaded(books));
  }

  

  void filterByAuthor() {
    emit(BookInitial()); 
    books.sort((a, b) => a.author.compareTo(b.author));
    emit(BookListLoaded(books));  
  }

  void filterByTitle() {
    emit(BookInitial()); 
    books.sort((a, b) => a.title.compareTo(b.title));
    emit(BookListLoaded(books));
  }
}