import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.green,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          const _PurpleBox(),

          const _HeaderIcon(),

          child,
          // const Positioned(
          //   top: -50,
          //   right: -50,
          //   child: _PurpleBox(),
          // ),
          // const Positioned(
          //   bottom: -50,
          //   left: -10,
          //   child: _PurpleBox(),
          // ),
          // const Positioned(
          //   bottom: 120,
          //   right: 20,
          //   child: _PurpleBox(),
          // ),
          // const Positioned(
          //   bottom: -50,
          //   right: -50,
          //   child: _PurpleBox(),
          // ),
          // Container(
          //   margin: const EdgeInsets.only(top: 80),
          //   child: const Icon(
          //     Icons.person_pin,
          //     color: Colors.white,
          //     size: 100,
          //   ),
          // ),
        ],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        width: double.infinity,
        child: const Icon(Icons.person_pin, color: Colors.white, size: 100),
      ),
    );
  }
}

class _PurpleBox extends StatelessWidget {
  const _PurpleBox();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _purpleBackground(),
      child: Stack(children: const [
        Positioned(top: 90, left: 30, child: _Bubble()),
        Positioned(top: -40, left: -30, child: _Bubble()),
        Positioned(top: -50, right: -20, child: _Bubble()),
        Positioned(bottom: -50, left: 10, child: _Bubble()),
        Positioned(bottom: 120, right: 20, child: _Bubble()),
      ]),
    );
  }

  BoxDecoration _purpleBackground() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromRGBO(63, 63, 156, 1),
          Color.fromRGBO(90, 70, 178, 1),
        ],
      ),
      // borderRadius: BorderRadius.only(
      //   bottomLeft: Radius.circular(100),
      //   bottomRight: Radius.circular(100),
      // ),
    );
  }
}

class _Bubble extends StatelessWidget {
  const _Bubble();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
