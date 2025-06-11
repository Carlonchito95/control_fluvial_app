import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.black87,
              radius: 50,
              backgroundImage: AssetImage('assets/icons/user_1.png'),
            ),
            const SizedBox(height: 10),
            const Text(
              'Paul Garcia',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const SizedBox(height: 20),
            Container(
              height: 0.5,
              width: double.infinity,
              color: Colors.grey,
            ),
            const SizedBox(height: 30),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.white,
                size: 30,
              ),
              title: const Text(
                'Inicio',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              dense: true,
              splashColor: Colors.deepOrange,
              trailing: const Icon(Icons.arrow_forward, color: Colors.white),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(height: 20),

            // 🚢 Viajes
            ListTile(
              leading: Image.asset("assets/icons/barco.png", scale: 4),
              title: const Text(
                'Viajes',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              dense: true,
              splashColor: Colors.deepOrange,
              onTap: () {},
            ),
            const SizedBox(height: 20),

            ListTile(
              leading: const Icon(Icons.people_alt_sharp, color: Colors.white),
              title: const Text(
                'Pasajeros',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              dense: true,
              splashColor: Colors.deepOrange,
              onTap: () {},
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ListTile(
                leading: const Icon(Icons.logout, color: Colors.white),
                title: const Text(
                  "Cerrar sesión",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                splashColor: Colors.deepOrange,
                onTap: () {
                  // o cerrar sesión
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
