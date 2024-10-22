import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/book_cubit.dart';
import '../widgets/book_card.dart';

class BookListView extends StatelessWidget {
  const BookListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Club Home'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Text('Sort by: '),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    context.read<BookCubit>().filterByAuthor();
                  },
                  child: const Text('Author'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    context.read<BookCubit>().filterByTitle();
                  },
                  child: const Text('Title'),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Books',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Expanded(
            child: BlocBuilder<BookCubit, BookState>(
              builder: (context, state) {
                if (state is BookListLoaded) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.books.length,
                    itemBuilder: (context, index) {
                      final book = state.books[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BookCard(book: book),  
                      );
                    },
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}