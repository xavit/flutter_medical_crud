import 'package:flutter/material.dart';
import 'package:flutter_medical_crud/ui/input_decotarion.dart';
import 'package:flutter_medical_crud/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            const SizedBox(height: 50),
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
            decoration: InputDecorations.authInputDecoration(
              hintText: 'jhon.doe',
              labelText: 'Usuario',
              prefixIcon: Icons.account_circle_outlined,
            ),
          ),
          const SizedBox(height: 30),
          TextFormField(
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
              hintText: '*****',
              labelText: 'Contraseña',
              prefixIcon: Icons.lock_outline,
            ),
          ),
          const SizedBox(height: 30),
          MaterialButton(
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            disabledColor: Colors.grey,
            elevation: 0,
            // color: Colors.deepPurple,
            child: Container(
              width: double.infinity,
              height: 55,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  gradient: LinearGradient(
                      colors: [Colors.deepPurple, Colors.purple])),
              child: const Center(
                  child: Text(
                'Ingresar',
                style: TextStyle(color: Colors.white, fontSize: 18),
              )),
            ),
          ),
          const SizedBox(height: 20),
        ]),
      ),
    );
  }
}
