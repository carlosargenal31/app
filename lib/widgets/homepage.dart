import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _StackHomeState();
}

class _StackHomeState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  static const heading = '\$2300 per month';
  static const subheading = 'Ferrari 488 GTB, 720 HP';
  static const cardImage = NetworkImage(
      'https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/Silverstone%2C_Ferrari_Racing_Days_01.jpg/640px-Silverstone%2C_Ferrari_Racing_Days_01.jpg');
  static const supportingText =
      'Comprar un Ferrari es una experiencia emocionante y exclusiva. Los Ferraris son automóviles deportivos de lujo fabricados en Italia y son conocidos por su rendimiento excepcional, diseño impresionante y una larga historia de éxito en las carreras.';

  Color backgroundColor = Colors.white; // Color de fondo inicial
  String directionText = ''; // Texto para indicar la dirección

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Layouts"),
          bottom: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_bike)),
              Tab(icon: Icon(Icons.card_giftcard)),
              Tab(icon: Icon(Icons.access_time)),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text("Menú de Navegación"),
              ),
              ListTile(
                title: const Text("Inicio"),
                onTap: () {
                  Navigator.of(context).pop(); // Cierra el Drawer
                },
              ),
              ListTile(
                title: const Text("Acerca de"),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutPage()));
                },
              ),
              ListTile(
                title: const Text("Configuración"),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingsPage()));
                },
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            GestureDetector(
              onTap: () {
                showSnackBar('Un Toque Exitoso');
              },
              onDoubleTap: () {
                showSnackBar('Doble Toque Exitoso');
              },
              onPanUpdate: (details) {
                if (details.delta.dy > 0) {
                  backgroundColor = Colors.white;
                  directionText = 'Si desplazas para abajo es de color blanco';
                } else if (details.delta.dy < 0) {
                  backgroundColor = Colors.blue;
                  directionText = 'Si desplazas para arriba es de color azul';
                } else if (details.delta.dx > 0) {
                  backgroundColor = Colors.green;
                  directionText =
                      'Si desplazas para la derecha es de color verde';
                } else if (details.delta.dx < 0) {
                  backgroundColor = Colors.red;
                  directionText =
                      'Si desplazas para la izquierda es de color rojo';
                }
                setState(() {});
              },
              child: Container(
                color: backgroundColor,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'INTENTA UN TOQUE, DOBLE TOQUE Y DESPLAZAMIENTO',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Página de Inicio',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          showSnackBar('Toque Boton 1 Exitoso');
                        },
                        child: const Text('Boton 1'),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          showSnackBar('Toque Boton 2 Exitoso');
                        },
                        child: const Text('Boton 2'),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          showSnackBar('Toque Boton 3 Exitoso');
                        },
                        child: const Text('Boton 3'),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        directionText,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text("Ferrari",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Column(
                    children: [
                      Image(
                          image: NetworkImage(
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/Ferrari_480%2C_Mexico_2019p2.jpg/640px-Ferrari_480%2C_Mexico_2019p2.jpg')),
                      Text(
                          "Ferrari es un fabricante de automóviles superdeportivos con sede en Maranello, provincia de Módena, en la región de Emilia-Romaña, Italia.",
                          textAlign: TextAlign.justify)
                    ],
                  ),
                ],
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                const Image(
                  width: 200,
                  height: 200,
                  image: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Ferrari_480%2C_Mexico_2019p1.jpg/640px-Ferrari_480%2C_Mexico_2019p1.jpg'),
                ),
                Container(
                  width: 90,
                  height: 90,
                  color: Colors.green,
                )
              ],
            ),
            GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.teal[100],
                  child: const Text("He'd have you all unravel at the"),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.teal[200],
                  child: const Text("Heed not the rabble"),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.teal[300],
                  child: const Text("Sound of screams but the"),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.teal[400],
                  child: const Text("Who scream"),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.teal[500],
                  child: const Text("Revolution is coming..."),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.teal[600],
                  child: const Text("Revolution, they..."),
                ),
              ],
            ),
            Card(
              elevation: 4.0,
              child: Column(
                children: <Widget>[
                  const ListTile(
                    title: Text(heading),
                    subtitle: Text(subheading),
                    trailing: Icon(Icons.favorite_outline),
                  ),
                  Container(
                    height: 200.0,
                    child: Ink.image(
                      image: cardImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    alignment: Alignment.centerLeft,
                    child: const Text(supportingText),
                  ),
                  ButtonBar(
                    children: [
                      TextButton(
                        child: const Text('CONTACT AGENT'),
                        onPressed: () {/*...*/},
                      ),
                      TextButton(
                        child: const Text('LEARN MORE'),
                        onPressed: () {/*...*/},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showSnackBar('Soy una SnackBar! Toque Boton Flotante Exitoso');
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  void showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(label: 'Deshacer', onPressed: () {}),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Acerca de")),
      body: Center(
        child: const Text(
            "Esta es la página 'Acerca de'\n\nCentro Universitario Tecnológico\nCEUTEC\nNombre de tarea:\n(CCC218-2) Actividad 3.1 Practica de laboratorio 3: Creacino de app con widgets avanzados. 1\n\nClase:\n432 Programacion Movil 2023\n\nPresentado por:\nCarlos Mauricio Argenal Bonilla 42141044\n\nDirigido a:\nIngeniero Reynaldo Cruz\n\nLugar:\nLa Ceiba, Atlantida\n\nFecha:\n02 de noviembre del 2023"),
      ),
    );
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with SingleTickerProviderStateMixin {
  late TabController _settingsTabController;

  @override
  void initState() {
    super.initState();
    _settingsTabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _settingsTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configuración"),
        bottom: TabBar(
          controller: _settingsTabController,
          tabs: [
            Tab(text: "Tab 1"),
            Tab(text: "Tab 2"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _settingsTabController,
        children: [
          // Contenido de la pestaña 1
          Center(
            child: Text("Contenido de la pestaña 1"),
          ),
          // Contenido de la pestaña 2
          Center(
            child: Text("Contenido de la pestaña 2"),
          ),
        ],
      ),
    );
  }
}
