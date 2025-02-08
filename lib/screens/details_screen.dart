import 'package:flutter/material.dart';
import 'package:pet_adoption_app/screens/view_photo.dart';
import 'package:provider/provider.dart';
import '../models/pet_model.dart';
import '../providers/pet_provider.dart';
import 'package:confetti/confetti.dart';

class DetailsScreen extends StatelessWidget {
  final Pet pet;

  DetailsScreen({required this.pet});

  @override
  Widget build(BuildContext context) {
    final petProvider = Provider.of<PetProvider>(context);
    final confettiController = ConfettiController();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(pet.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: pet.id,
              child: SizedBox(
                height: size.height * 0.7,
                width: size.width,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewPhotoScreen(
                          imageUrl: pet.imageUrl,
                          heroTag: pet.id, // Pass the same hero tag
                        ),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(pet.imageUrl),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Age: ${pet.age}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Text('Price: \$${pet.price}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            const SizedBox(
              height: 10,
            ),
            if (!pet.isAdopted)
              Container(
                width: 200,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0), // Rounded corners with 20 radius
                      ),
                    ),
                    padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 16, vertical: 16)),
                  ),
                  onPressed: () {
                    petProvider.adoptPet(pet.id);
                    confettiController.play();
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Congratulations!'),
                          content: Text('You\'ve now adopted ${pet.name}'),
                        );
                      },
                    );
                  },
                  child: const Text('Adopt Me'),
                ),
              ),
            ConfettiWidget(
              confettiController: confettiController,
              blastDirectionality: BlastDirectionality.explosive,
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
