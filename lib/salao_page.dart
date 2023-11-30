import 'package:flutter/material.dart';

class Service {
  final String name;
  final String image;
  final double price;
  final Duration duration;

  Service(
      {required this.name,
      required this.image,
      required this.price,
      required this.duration});
}

class ServiceList extends StatelessWidget {
  final List<Service> services;

  ServiceList({required this.services});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: services.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Image.asset(services[index].image),
          title: Text(services[index].name),
          subtitle: Text(
              'R\$${services[index].price} - ${services[index].duration.inMinutes} minutos'),
          trailing: ElevatedButton(
            onPressed: () {},
            child: Text('Agendar agora'),
          ),
        );
      },
    );
  }
}

class SalaoPage extends StatefulWidget {
  const SalaoPage({Key? key}) : super(key: key);
  @override
  State<SalaoPage> createState() => _SalaoPageState();
}

class _SalaoPageState extends State<SalaoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 275, // ajuste a altura conforme necessário
                child: Image.asset(
                  "assets/imagens/homem-bonito-na-barbearia-barbeando-a-barba.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 275, // ajuste a altura conforme necessário
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF191D32).withOpacity(0.6),
                      Color(0xFF191D32)
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 20,
                bottom: 70,
                child: _buildShape,
              ),
              Positioned(
                left: 20,
                bottom: 37,
                child: _buildTexts,
              ),
              Positioned(
                left: 20,
                bottom: 14,
                child: _buildTexts2,
              ),
            ],
          ),
          Container(
            // Ligar | Visitar | Compartilhar | agendar agora
            width: MediaQuery.of(context).size.width,
            height: 70,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  _buildPhoneIcon,
                  SizedBox(width: 30),
                  _buildLocationIcon,
                  SizedBox(width: 30),
                  _buildShareIcon,
                  SizedBox(width: 50),
                  _buildAgendarAgora,
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              // Serviços (5)
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.only(top: 20, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Serviços (5)",
                      style: TextStyle(
                        color: Color(0xFF191D32),
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 10),
                    Positioned(right: 20, child: _buildSearchBar),
                    Expanded(
                      child: ServiceList(
                        services: [
                          Service(
                            name: 'Corte de cabelo',
                            image:
                                'assets/imagens/cliente-de-grooming-mulher-na-barbearia.jpg',
                            price: 25.0,
                            duration: Duration(minutes: 30),
                          ),
                          Service(
                            name: 'Barba',
                            image:
                                'assets/imagens/cliente-de-grooming-mulher-na-barbearia.jpg',
                            price: 15.0,
                            duration: Duration(minutes: 20),
                          ),
                          Service(
                            name: 'Corte de cabelo + Barba',
                            image:
                                'assets/imagens/cliente-de-grooming-mulher-na-barbearia.jpg',
                            price: 35.0,
                            duration: Duration(minutes: 50),
                          ),
                          Service(
                            name: 'Corte de cabelo + Barba + Bigode',
                            image:
                                'assets/imagens/cliente-de-grooming-mulher-na-barbearia.jpg',
                            price: 40.0,
                            duration: Duration(minutes: 60),
                          ),
                          Service(
                            name:
                                'Corte de cabelo + Barba + Bigode + Sombrancelha',
                            image:
                                'assets/imagens/cliente-de-grooming-mulher-na-barbearia.jpg',
                            price: 45.0,
                            duration: Duration(minutes: 70),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // outros widgets vão aqui
        ],
      ),
    );
  }

  Widget _buildShape = Container(
    width: 70,
    height: 25,
    decoration: BoxDecoration(
      color: Color(0xFF17B890),
      borderRadius: BorderRadius.circular(3),
    ),
    child: Center(
      child: Text(
        "ABERTO",
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    ),
  );

  Widget _buildTexts = Text(
    "MEN'S BARBEARIA",
    style: TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.w400,
    ),
  );

  Widget _buildTexts2 = Text(
    "Av. 07, Cohab, Caxias - MA • 4.9km",
    style: TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  );

  Widget _buildPhoneIcon = Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(
        Icons.phone,
        color: Colors.black,
      ),
      Text(
        "Ligar",
        style: TextStyle(
          color: Color(0xFF191D32),
          fontSize: 12,
        ),
      ),
    ],
  );

  Widget _buildLocationIcon = Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(
        Icons.location_pin,
        color: Color(0xFF191D32),
      ),
      Text(
        "Visitar",
        style: TextStyle(
          color: Color(0xFF191D32),
          fontSize: 12,
        ),
      ),
    ],
  );

  Widget _buildShareIcon = Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(
        Icons.share,
        color: Color(0xFF191D32),
      ),
      Text(
        "Compartilhar",
        style: TextStyle(
          color: Color(0xFF191D32),
          fontSize: 12,
        ),
      ),
    ],
  );

  Widget _buildAgendarAgora = GestureDetector(
    onTap: () {
      print("Botão Agendar agora pressionado");
    },
    child: Container(
      width: 125,
      height: 30,
      decoration: BoxDecoration(
        color: Color(0xFF17B890),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Center(
        child: Text(
          "Agendar agora",
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ),
    ),
  );

  Widget _buildSearchBar = Container(
    height: 50,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      color: Colors.grey[200],
    ),
    child: TextField(
      decoration: InputDecoration(
        hintText: "Pesquise por um serviço...",
        hintStyle: TextStyle(color: Colors.grey[500]),
        border: InputBorder.none,
        contentPadding: EdgeInsets.all(15),
      ),
    ),
  );
}
