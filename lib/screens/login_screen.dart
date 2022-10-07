import 'package:flutter/material.dart';
import 'package:flutter_medical_crud/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 250),
            CardContainer(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Text('Ingresar',
                      style: Theme.of(context).textTheme.headline4),
                  const SizedBox(height: 30),
                  const _LoginForm(),
                ],
              ),
            ),
            const SizedBox(height: 50),
            TextButton(
                onPressed: () {
                  print("Enviar a la UI de Registro");
                },
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(
                        Colors.indigo.withOpacity(0.1)),
                    shape: MaterialStateProperty.all(const StadiumBorder())),
                child: const Text('Crear una nueva cuenta',
                    style: TextStyle(fontSize: 18, color: Colors.black87))),
          ],
        ),
      )),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        // TODO: Implementar el Formulario
        child: Column(children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.lock),
              labelText: "Usuario",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple, width: 2),
              ),
              // hintText: 'Usuario',
              labelStyle: TextStyle(color: Colors.grey),
            ),
          ),
          const SizedBox(height: 30),
          TextFormField(
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.lock_outline),
              labelText: "Password",
            ),
          ),
          const SizedBox(height: 30),
        ]),
      ),
    );
  }
}
