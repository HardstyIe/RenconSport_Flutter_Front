import 'package:flutter/material.dart';

class Sport {
  final String name;
  final List<String> parameters;

  Sport({required this.name, required this.parameters});
}

class Filter {
  final Sport sport;
  String location = '';
  int numberOfPlayers = 0;
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  int timeOut = 0;

  Filter({required this.sport});
}

void main() {
  runApp(FilterApp());
}

class FilterApp extends StatelessWidget {
  final List<Sport> sports = [
    Sport(name: 'Football', parameters: ['Location', 'Nombre de Joueurs', 'Date', 'Heure', 'Time Out']),
    Sport(name: 'Basketball', parameters: ['Location', 'Nombre de Joueurs', 'Date', 'Heure', 'Time Out']),
    Sport(name: 'Tennis', parameters: ['Location', 'Nombre de Joueurs', 'Date', 'Heure', 'Time Out']),
    Sport(name: 'Badminton', parameters: ['Location', 'Nombre de Joueurs', 'Date', 'Heure', 'Time Out']),
    Sport(name: 'Musculation', parameters: ['Location', 'Nombre de Joueurs', 'Date', 'Heure', 'Time Out']),
    Sport(name: 'Handball', parameters: ['Location', 'Nombre de Joueurs', 'Date', 'Heure', 'Time Out']),
    // Ajoutez d'autres sports avec leurs paramètres ici
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Liste des Filters'),
        ),
        body: FilterList(sports: sports),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Lorsque le bouton "+" est cliqué, appelez la fonction pour ajouter un filtre.
            addFilter(context);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  void addFilter(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Sport selectedSport = sports[0]; // Sélectionnez le premier sport par défaut.
        String location = ''; // Champ de saisie pour la localisation
        int numberOfPlayers = 0; // Champ de nombre de joueurs
        DateTime date = DateTime.now(); // Sélection de la date
        TimeOfDay time = TimeOfDay.now(); // Sélection de l'heure
        int timeOut = 0; // Champ de saisie pour le Time Out

        return FractionallySizedBox(
          widthFactor: 0.8, // Ajustez la largeur selon vos besoins
          heightFactor: 0.8, // Ajustez la hauteur selon vos besoins
          child: StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                title: Text('Créer un Filtre'),
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DropdownButtonFormField<Sport>(
                        value: selectedSport,
                        items: sports.map((sport) {
                          return DropdownMenuItem<Sport>(
                            value: sport,
                            child: Text(sport.name),
                          );
                        }).toList(),
                        onChanged: (sport) {
                          setState(() {
                            selectedSport = sport!;
                          });
                          // Mettez à jour les paramètres en fonction du sport sélectionné.
                        },
                      ),
                      SizedBox(height: 10), // Espacement
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Localisation'),
                        onChanged: (value) {
                          location = value; // Mise à jour de la variable location
                        },
                      ),
                      SizedBox(height: 10), // Espacement
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Nombre de Joueurs'),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          numberOfPlayers = int.tryParse(value) ?? 0; // Mise à jour de la variable numberOfPlayers
                        },
                      ),
                      SizedBox(height: 10), // Espacement
                      Row(
                        children: [
                          Expanded(
                            child: Text('Date: ${date.toLocal()}'.split(' ')[0]),
                          ),
                          IconButton(
                            icon: Icon(Icons.calendar_today),
                            onPressed: () async {
                              final selectedDate = await showDatePicker(
                                context: context,
                                initialDate: date,
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2101),
                              );
                              if (selectedDate != null && selectedDate != date) {
                                setState(() {
                                  date = selectedDate;
                                });
                              }
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 10), // Espacement
                      Row(
                        children: [
                          Expanded(
                            child: Text('Heure: ${time.format(context)}'),
                          ),
                          IconButton(
                            icon: Icon(Icons.access_time),
                            onPressed: () async {
                              final selectedTime = await showTimePicker(
                                context: context,
                                initialTime: time,
                              );
                              if (selectedTime != null && selectedTime != time) {
                                setState(() {
                                  time = selectedTime;
                                });
                              }
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 10), // Espacement
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Time Out'),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          timeOut = int.tryParse(value) ?? 0; // Mise à jour de la variable timeOut
                        },
                      ),
                      SizedBox(height: 20), // Espacement
                      ElevatedButton(
                        onPressed: () {
                          // Vérifiez si tous les champs requis sont remplis.
                          if (selectedSport != null &&
                              location.isNotEmpty &&
                              numberOfPlayers > 0 &&
                              timeOut > 0) {
                            // Créez un nouvel objet Filter avec toutes les informations.
                            Filter newFilter = Filter(sport: selectedSport)
                              ..location = location
                              ..numberOfPlayers = numberOfPlayers
                              ..date = date
                              ..time = time
                              ..timeOut = timeOut;

                            // Ajoutez le filtre à la liste.
                            filters.add(newFilter);

                            // Fermez la boîte de dialogue.
                            Navigator.of(context).pop();
                          } else {
                            // Affichez un message d'erreur si tous les champs requis ne sont pas remplis.
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Erreur'),
                                  content: Text('Veuillez remplir tous les champs requis.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: Text('Créer'),
                        // Désactivez le bouton si les conditions ne sont pas remplies.
                        // S'il est désactivé, il apparaîtra en grisé.
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.disabled)) {
                                return Colors.grey; // Couleur grise lorsque le bouton est désactivé.
                              }
                              return Color.fromARGB(255, 255, 255, 255); // Couleur par défaut.
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Annuler'),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

class FilterList extends StatelessWidget {
  final List<Sport> sports;

  FilterList({required this.sports});

  @overrider
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: filters.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Filter ${index + 1}'),
                subtitle: Text('Sport: ${filters[index].sport.name}'),
                // Affichez d'autres informations de Filter ici.
              );
            },
          ),
        ),
      ],
    );
  }
}

List<Filter> filters = []; // Liste des filtres
