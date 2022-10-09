import 'package:flutter/material.dart';
import 'package:flutter_medical_crud/providers/login_form_provider.dart';
import 'package:flutter_medical_crud/ui/input_decotarion.dart';
import 'package:flutter_medical_crud/widgets/widgets.dart';
import 'package:provider/provider.dart';

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
                  ChangeNotifierProvider(
                    create: (_) => LoginFormProvider(),
                    child: const _LoginForm(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            // TextButton(
            //     onPressed: () {
            //       print("Enviar a la UI de Registro");
            //     },
            //     style: ButtonStyle(
            //         overlayColor: MaterialStateProperty.all(
            //             Colors.indigo.withOpacity(0.1)),
            //         shape: MaterialStateProperty.all(const StadiumBorder())),
            //     child: const Text('Crear una nueva cuenta',
            //         style: TextStyle(fontSize: 18, color: Colors.black87))),
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
    final loginForm = Provider.of<LoginFormProvider>(context); // ???????

    return Form(
      key: loginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(children: [
        TextFormField(
          autocorrect: false,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecorations.authInputDecoration(
            hintText: 'jhon.doe',
            labelText: 'Usuario',
            prefixIcon: Icons.account_circle_outlined,
          ),
          onChanged: (value) => loginForm.email = value,
          validator: ((value) => (value != null && value.length > 11)
              ? null
              : 'El Usuario debe tener más de 12 caracteres'),
        ),
        const SizedBox(height: 30),
        TextFormField(
          autocorrect: false,
          obscureText: loginForm.showPassword,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: '*********',
            labelText: 'Contraseña',
            labelStyle: const TextStyle(color: Colors.deepPurple),
            prefixIcon: const Icon(
              Icons.lock_outline,
              color: Colors.deepPurple,
            ),
            // suffixIconConstraints: const BoxConstraints(
            //   minWidth: 2,
            //   minHeight: 2,
            // ),
            suffixIcon: InkWell(
              child: Icon(
                loginForm.isPasswordVisible
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: Colors.deepPurple,
              ),
              onTap: () {
                loginForm.showPassword = !loginForm.isPasswordVisible;
              },
            ),
          ),

          // decoration: InputDecorations.authInputDecoration(
          //   hintText: '*********',
          //   labelText: 'Contraseña',
          //   prefixIcon: Icons.lock_outline,
          // ),
          onChanged: (value) => loginForm.password = value,
          validator: ((value) => (value != null && value.length > 8)
              ? null
              : 'La contraseña debe tener más de 8 caracteres'),
        ),
        const SizedBox(height: 30),
        MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          disabledColor: Colors.grey,
          elevation: 0,
          color: Colors.deepPurple,
          onPressed: loginForm.isLoading
              ? null
              : () async {
                  FocusScope.of(context)
                      .unfocus(); // oculta el teclado en el dispositivo
                  if (!loginForm.isValidForm()) return;

                  loginForm.isLoading = true;

                  // Navigator.pushReplacementNamed(context, 'home');
                },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
            // width: double.infinity,
            height: 55,
            // decoration: const BoxDecoration(
            //     borderRadius: BorderRadius.all(Radius.circular(7)),
            //     gradient:
            //         LinearGradient(colors: [Colors.deepPurple, Colors.purple])),
            child: Text(
              loginForm.isLoading ? 'Espere...' : 'Ingresar',
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ]),
    );
  }
}
