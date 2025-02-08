import 'package:flutter/material.dart';
import 'package:pet_adoption_app/widgets/pet_card.dart';
import 'package:provider/provider.dart';
import '../models/pet_model.dart';
import '../providers/pet_provider.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final petProvider = Provider.of<PetProvider>(context);
    final adoptedPets = petProvider.adoptedPets;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Adoption History'),
      ),
      body: adoptedPets.isEmpty
          ? const SizedBox(
              height: 400,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "No History Found",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: adoptedPets.length,
              itemBuilder: (context, index) {
                final pet = adoptedPets[index];
                return PetCard(
                  pet: pet,
                  onTap: () {},
                  isHistory: true,
                );
              },
            ),
    );
  }
}
