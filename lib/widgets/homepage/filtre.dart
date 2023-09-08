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
    Sport(name: 'Fitness', parameters: ['Location', 'Nombre de Joueurs', 'Date', 'Heure', 'Time Out']),
    Sport(name: 'Badminton', parameters: ['Location', 'Nombre de joueur', 'Date', 'Heure', 'Time Out']),
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

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Créer un Filtre'),
              content: Column(
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
                      setState(() {
                        location = value;
                      });
                    },
                  ),
                  SizedBox(height: 10), // Espacement
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Nombre de Joueurs'),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        numberOfPlayers = int.tryParse(value) ?? 0;
                      });
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
                      setState(() {
                        timeOut = int.tryParse(value) ?? 0;
                      });
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Annuler'),
                ),
                TextButton(
                  onPressed: () {
                    // Créez un nouvel objet Filter avec toutes les informations
                    // (Sport, Location, Nombre de Joueurs, Date, Heure, TO, etc.).
                    Filter newFilter = Filter(
                      sport: selectedSport,
                    );
                    newFilter.location = location;
                    newFilter.numberOfPlayers = numberOfPlayers;
                    newFilter.date = date;
                    newFilter.time = time;
                    newFilter.timeOut = timeOut;

                    // Ajoutez la nouvelle Filter à la liste de Filters.
                    Navigator.of(context).pop(newFilter);
                  },
                  child: Text('Créer'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class FilterList extends StatefulWidget {
  final List<Sport> sports;

  FilterList({required this.sports});

  @override
  _FilterListState createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {
  List<Filter> filters = [];

  @override
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
