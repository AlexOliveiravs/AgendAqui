import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgendAqui',
      theme: ThemeData(
        primaryColor: Color(0xFF1B1D28), // Cor da AppBar
        canvasColor: Color(0xFF191D32), // Cor do menu lateral (Drawer)
        textTheme: TextTheme(
          headline6: TextStyle(color: Colors.white), // Cor do texto na AppBar
          bodyText2: TextStyle(
              color: Colors.white), // Cor do texto no menu lateral (Drawer)
        ),
      ),
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AgendAqui'),
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/admin_photo.jpg'),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Agendamentos'),
              onTap: () {
                //Implementar ação para Agendamentos
              },
            ),
            ListTile(
              title: Text('Clientes'),
              onTap: () {
                //Implementar ação para Clientes
              },
            ),
            ListTile(
              title: Text('Colaboradores'),
              onTap: () {
                //Implementar ação para Colaboradores
              },
            ),
            ListTile(
              title: Text('Serviços'),
              onTap: () {
                //Implementar ação para Serviços
              },
            ),
            ListTile(
              title: Text('Horários'),
              onTap: () {
                //Implementar ação para Horários
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: Center(
          child: Text(
            'Conteúdo do painel',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
