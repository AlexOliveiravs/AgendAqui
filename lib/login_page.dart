import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Color myColor;
  late Size mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberUser = false;

  @override
  Widget build(BuildContext context) {
    myColor = Color(0xFF191D32);
    mediaSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: myColor,
          image: DecorationImage(
              image: const AssetImage(
                  "assets/imagens/homem-bonito-na-barbearia-barbeando-a-barba.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  myColor.withOpacity(0.2), BlendMode.dstATop))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Positioned(top: 80, child: _buildTop()),
          Positioned(bottom: 0, child: _buildButtom()),
        ]),
      ),
    );
  }

  Widget _buildTop() {
    return SizedBox(
      width: mediaSize.width,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.calendar_today_outlined,
            size: 100,
            color: Colors.white,
          ),
          Text(
            "AgendAqui",
            style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                letterSpacing: 2,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildButtom() {
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Bem-vindo",
          style: TextStyle(
              color: myColor, fontSize: 32, fontWeight: FontWeight.w500),
        ),
        _buildGrayText("Faça login para continuar"),
        const SizedBox(height: 60),
        _buildGrayText("E-mail"),
        _buildInputField(emailController),
        const SizedBox(height: 40),
        _buildGrayText("Senha"),
        _buildInputField(passwordController, isPassword: true),
        const SizedBox(height: 20),
        _buildRememberPassword(),
        const SizedBox(height: 20),
        _buildLoginButton(),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildGrayText(String text) {
    return Text(
      text,
      style: TextStyle(color: Colors.grey),
    );
  }

  Widget _buildInputField(TextEditingController controller,
      {isPassword = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: isPassword ? Icon(Icons.remove_red_eye) : Icon(Icons.done),
      ),
      obscureText: isPassword,
    );
  }

  Widget _buildRememberPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
                value: rememberUser,
                onChanged: (value) {
                  setState(() {
                    rememberUser = value!;
                  });
                }),
            _buildGrayText("Lembrar usuário"),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: _buildGrayText("Esqueceu a senha?"),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        debugPrint("Email: ${emailController.text}");
        debugPrint("Senha: ${passwordController.text}");
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: 20,
        shadowColor: myColor,
        backgroundColor: myColor,
        minimumSize: const Size.fromHeight(60),
      ),
      child: const Text(
        "LOGIN",
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
