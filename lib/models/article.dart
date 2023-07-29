import 'package:intl/intl.dart';

final f = DateFormat('yyyy-MM-dd hh:mm');

class Article{
  const Article({
    required this.title,
    required this.subtitle,
    required this.content,
    required this.date,
    required this.numberOfReaders,
    required this.photo,
  });

  final String title,subtitle,content,photo;
  final DateTime date;
  final int numberOfReaders;

  String get formattedDate{
    return f.format(date);
  }



}