import 'package:flutter/material.dart';

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
                    _buildSearchBar,
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
    height: 30,
    margin: EdgeInsets.symmetric(horizontal: 20),
    child: Center(
      child: TextField(
        decoration: InputDecoration(
          hintText: "Pesquise por um serviço...",
          hintStyle: TextStyle(color: Color(0xFF191D32)),
          border: OutlineInputBorder(),
        ),
      ),
    ),
  );
}
