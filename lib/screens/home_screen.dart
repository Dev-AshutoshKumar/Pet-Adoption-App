import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/pet_model.dart';
import '../providers/pet_provider.dart';
import '../providers/theme_provider.dart';
import '../widgets/pet_card.dart';
import '../widgets/search_bar.dart';
import 'details_screen.dart';
import 'history_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Adoption'),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HistoryScreen()),
              );
            },
          ),
          SizedBox(width: 10,),
          Switch(
            value: themeProvider.themeMode == ThemeMode.dark,
            onChanged: (value) {
              themeProvider.toggleTheme();
            },
          )
        ],
      ),
      body: Column(
        children: [
          SearchBarWidget(),
          Expanded(
            child: Consumer<PetProvider>(
              builder: (context, petProvider, child) {
                return ListView.builder(
                  itemCount: petProvider.pets.length,
                  itemBuilder: (context, index) {
                    final pet = petProvider.pets[index];
                    return PetCard(
                      pet: pet,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(pet: pet),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
