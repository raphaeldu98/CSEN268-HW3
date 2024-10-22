import 'package:flutter/material.dart';
import '../models/book_model.dart';
import './book_detail_view.dart';

class BookCard extends StatelessWidget {
  final Book book;

  const BookCard({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetailView(book: book),
          ),
        );
      },
      child: Column(
        children: [
          Image.asset(
            book.imagePath,
            width: 100,
            height: 150,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}