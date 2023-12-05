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
  final Widget header;

  ServiceList({required this.services, required this.header});

  @override
  Widget build(BuildContext context) {
    // lista de serviços
    return ListView.builder(
      itemCount: services.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Image.asset(services[index].image),
          title: Text(services[index].name),
          subtitle: Text(
              'R\$${services[index].price} - ${services[index].duration.inMinutes} minutos'),
          trailing: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return ModalBottomSheet(
                    header: header,
                    image: services[index].image,
                    name: services[index].name,
                    total: services[index].price,
                  );
                },
              );
            },
            child: Text('Agendar'), // botão agendar na lista de serviços
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF17B890),
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
            ),
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

class HaircutSelection extends StatelessWidget {
  final String image;
  final String name;
  final double total;

  HaircutSelection(
      {required this.image, required this.name, required this.total});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 20),
          width: 70,
          height: 70,
          child: Image.asset(image),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, top: 32),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Total: R\$ ${total.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF17B890),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ModalBottomSheet extends StatelessWidget {
  // modal bottom sheet
  final Widget header;
  final String image;
  final String name;
  final double total;

  ModalBottomSheet(
      {required this.header,
      required this.image,
      required this.name,
      required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          header,
          Container(
            // lista de serviços selecionados
            width: double.infinity,
            height: 110,
            decoration: BoxDecoration(color: Color(0xFFF1F1F1)),
            child: HaircutSelection(image: image, name: name, total: total),
          ),
          Container(
            // para quando você gostaria de agendar?
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                "Para quando você gostaria de agendar?",
                style: TextStyle(
                  color: Color(0xFF191D32),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Container(
            // Que horas você gostaria de agendar?
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                "Que horas você gostaria de agendar?",
                style: TextStyle(
                  color: Color(0xFF191D32),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Container(
            //Gostaria de escolher um especialista específico?
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                "Gostaria de escolher um especialista específico?",
                style: TextStyle(
                  color: Color(0xFF191D32),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Container(
            // Forma de pagamento
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                "Forma de pagamento",
                style: TextStyle(
                  color: Color(0xFF191D32),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SalaoPageState extends State<SalaoPage> {
  Service selectedHaircut = Service(
    name: 'Corte normal',
    image: 'assets/imagens/cliente-de-grooming-mulher-na-barbearia.jpg',
    price: 20.0,
    duration: Duration(minutes: 30),
  );
  @override
  Widget build(BuildContext context) {
    Widget _buildModalHeader = Align(
      // cabeçalho do modal bottom sheet
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context); // fecha o modal bottom sheet
        },
        child: Container(
          width: double.infinity,
          height: 70,
          decoration: const ShapeDecoration(
            gradient: LinearGradient(
              begin: Alignment(1.00, -0.03),
              end: Alignment(-1, 0.03),
              colors: [Color(0xFF0E1019), Color(0xFF191D32)],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.arrow_left,
                  color: Color(0xFFF1F1F1)), // seta fixa na esquerda
              Text(
                'Finalizar agendamento',
                style: TextStyle(
                  color: Color(0xFFF1F1F1),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    Widget _buildBottomSheetTrigger = Align(
      // botão finalizar agendamento
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return ModalBottomSheet(
                header: _buildModalHeader,
                image: selectedHaircut.image,
                name: selectedHaircut.name,
                total: selectedHaircut.price,
              );
            },
          );
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 70,
          decoration: const ShapeDecoration(
            gradient: LinearGradient(
              begin: Alignment(1.00, -0.03),
              end: Alignment(-1, 0.03),
              colors: [Color(0xFF0E1019), Color(0xFF191D32)],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 56.0),
                    child: Text(
                      'Finalizar agendamento',
                      style: TextStyle(
                        color: Color(0xFFF1F1F1),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 56.0),
                    child: Text(
                      'Escolha um horário e forma de pagamento',
                      style: TextStyle(
                        color: Color(0x99F1F1F1),
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
              Icon(Icons.arrow_right,
                  color: Color(0xFFF1F1F1)), // seta fixa na direita
            ],
          ),
        ),
      ),
    );

    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 275,
                child: Image.asset(
                  "assets/imagens/homem-bonito-na-barbearia-barbeando-a-barba.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 275,
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
                            name: 'Corte normal',
                            image:
                                'assets/imagens/cliente-de-grooming-mulher-na-barbearia.jpg',
                            price: 20.0,
                            duration: Duration(minutes: 30),
                          ),
                          Service(
                            name: 'Corte navalhado',
                            image:
                                'assets/imagens/cliente-de-grooming-mulher-na-barbearia.jpg',
                            price: 25.0,
                            duration: Duration(minutes: 40),
                          ),
                        ],
                        header: _buildModalHeader,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // outros widgets vão aqui
          Positioned(
            bottom: 0,
            child: _buildBottomSheetTrigger,
          ),
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
    onTap: () {},
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
      borderRadius: BorderRadius.circular(3),
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
