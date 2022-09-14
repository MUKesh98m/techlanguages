import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Products {
  final String id;
  final String name;
  final String image;
  final String price;
  final String duration;
  final String session;
  final String review;
  final String is_favorited;
  final String description;

  Products(
      {required this.id,
      required this.name,
      required this.image,
      required this.price,
      required this.duration,
      required this.session,
      required this.review,
      required this.is_favorited,
      required this.description});
  factory Products.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Products(
      id: data?['id'],
      name: data?['name'],
      image: data?['image'],
      price: data?['price'],
      duration: data?['duration'],
      session: data?['session'],
      review: data?['review'],
      is_favorited: data?['is_favorited'],
      description: data?['description'],
    );
  }
}