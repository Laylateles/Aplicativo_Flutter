import 'package:flutter/material.dart';

class TelaLogin extends StatelessWidget {
  const TelaLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),

          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,

                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },

                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 18,
                  ),
                ),
              ),
            
              const SizedBox(height: 20),

              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,

                  children: [

                    Icon(
                      Icons.location_on,
                      color: Colors.deepPurple,
                      size: 40,
                    ),

                    SizedBox(width: 8),

                    Text(
                      "KeepClose",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Align(
                alignment: Alignment.centerLeft,

                child: Text(
                  "Bem-vindo de volta",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Align(
                alignment: Alignment.centerLeft,

                child: Text(
                  "Faça login para continuar",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
            ],

          ),
        ),
      ),
    );
  }
}