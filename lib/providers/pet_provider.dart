import 'package:flutter/material.dart';
import '../models/pet_model.dart';

class PetProvider with ChangeNotifier {
  final List<Pet> _pets = [
    Pet(
        id: '1',
        name: 'Bailey',
        age: 3,
        price: 90.0,
        imageUrl: 'https://images.unsplash.com/photo-1517423440428-a5a00ad493e8'),
    Pet(
        id: '2',
        name: 'Bella',
        age: 3,
        price: 60.0,
        imageUrl: 'https://images.unsplash.com/photo-1558788353-f76d92427f16'),
    Pet(
        id: '3',
        name: 'Charlie',
        age: 1,
        price: 55.0,
        imageUrl: 'https://images.unsplash.com/photo-1560807707-8cc77767d783'),
    Pet(
        id: '4',
        name: 'Max',
        age: 4,
        price: 70.0,
        imageUrl: 'https://images.unsplash.com/photo-1543852786-1cf6624b9987'),
    Pet(
        id: '5',
        name: 'Luna',
        age: 2,
        price: 65.0,
        imageUrl: 'https://images.unsplash.com/photo-1517849845537-4d257902454a'),
    Pet(
        id: '6',
        name: 'Rocky',
        age: 5,
        price: 80.0,
        imageUrl: 'https://images.unsplash.com/photo-1560807707-8cc77767d783'),
    Pet(
        id: '7',
        name: 'Daisy',
        age: 1,
        price: 50.0,
        imageUrl: 'https://images.unsplash.com/photo-1518717758536-85ae29035b6d'),
    Pet(
        id: '8',
        name: 'Milo',
        age: 3,
        price: 75.0,
        imageUrl: 'https://images.unsplash.com/photo-1568572933382-74d440642117'),
    Pet(
        id: '9',
        name: 'Coco',
        age: 2,
        price: 68.0,
        imageUrl: 'https://images.unsplash.com/photo-1517423568366-8b83523034fd'),
    Pet(
        id: '10',
        name: 'Ruby',
        age: 4,
        price: 85.0,
        imageUrl: 'https://images.unsplash.com/photo-1518020382113-a7e8fc38eac9'),
  ];
  String _searchQuery = '';

  List<Pet> get pets {
    if (_searchQuery.isEmpty) {
      return _pets;
    }
    return _pets.where((pet) => pet.name.toLowerCase().contains(_searchQuery.toLowerCase())).toList();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void adoptPet(String id) {
    _pets.firstWhere((pet) => pet.id == id).isAdopted = true;
    _pets.firstWhere((pet) => pet.id == id).date = DateTime.now();
    notifyListeners();
  }

  List<Pet> get adoptedPets => _pets.where((pet) => pet.isAdopted).toList();
}
