import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/pet_model.dart';

class PetCard extends StatelessWidget {
  final Pet pet;
  final VoidCallback onTap;
  final bool isHistory;

  const PetCard({
    required this.pet,
    required this.onTap,
    this.isHistory = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: pet.isAdopted ? null : onTap, // Disable tap if already adopted
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [

              Hero(
                tag: pet.id, // Hero animation tag
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    pet.imageUrl,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pet.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Age: ${pet.age} years',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Price: \$${pet.price}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    if (isHistory)
                      Column(
                        children: [
                          SizedBox(height: 4),
                          Text(
                            'Adopted on ${DateFormat('dd-MM-yyyy hh:mm a').format(pet.date!)}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              if (pet.isAdopted && !isHistory)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Already Adopted',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
