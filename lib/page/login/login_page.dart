import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/LoginProvider.dart';
import '../../screen_index.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Widget _userIdWidget(){
    return TextFormField(
      controller: _idController,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Login Id',
      ),
      validator: (String? value){
        if (value!.isEmpty) {// == null or isEmpty
          return 'Login Id....';
        }
        return null;
      },
    );
  }

  Widget _passwordWidget(){
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Password',
      ),
      validator: (String? value){
        if (value!.isEmpty) {// == null or isEmpty
          return 'Password....';
        }
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("let's get 1st lotto"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              //Image(width: 400.0, height: 250.0, image: AssetImage(_imageFile)),
              const SizedBox(height: 20.0),
              _userIdWidget(),
              const SizedBox(height: 20.0),
              _passwordWidget(),
              Container(
                height: 70,
                width: double.infinity,
                padding: const EdgeInsets.only(top: 8.0), // 8단위 배수가 보기 좋음
                child: ElevatedButton(
                    onPressed: () async {


                      await

                      //context.read<LoginProvider>().login(_idController.value.text, _passwordController.value.text);

                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(
                      //     content: Text("just clicked a snack bar !"),
                      //     duration: Duration(seconds: 5),
                      //     action: SnackBarAction(
                      //       label: 'Undo',
                      //       onPressed: (){
                      //         Navigator.push(
                      //             context,
                      //             MaterialPageRoute(builder: (context) => IndexScreen())
                      //         );
                      //       },
                      //     ),
                      //   ),
                      // );

                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(SnackBar(
                            content:
                            Text('welcome! ${_idController.value.text} ')));
                      Navigator.pushReplacementNamed(context, '/index');



                    },
                    child: const Text("Sign In")
                ),
              ),
              const SizedBox(height: 20.0),
              // GestureDetector(
              //   child: const Text('회원 가입'),
              //   onTap: (){
              //     //Get.to(() => const JoinPage());
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}