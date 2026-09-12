import 'package:flutter/material.dart';

void main() {
  runApp(const TaxiBonusApp());
}

class TaxiBonusApp extends StatelessWidget {
  const TaxiBonusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Такси Бонус',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFFC400),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF0B0B0D),
      ),
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void openRole(BuildContext context, String role, IconData icon) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => RoleScreen(
          role: role,
          icon: icon,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(22, 28, 22, 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),

              Center(
                child: Container(
                  width: 92,
                  height: 92,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFC400),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: const Icon(
                    Icons.local_taxi_rounded,
                    size: 52,
                    color: Colors.black,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                'ТАКСИ БОНУС',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.4,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Такси • Доставка • Магазины',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white60,
                ),
              ),

              const SizedBox(height: 50),

              const Text(
                'Выберите, как войти',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 16),

              RoleButton(
                title: 'Пассажир',
                subtitle: 'Заказать такси или доставку',
                icon: Icons.person_rounded,
                onTap: () => openRole(
                  context,
                  'Пассажир',
                  Icons.person_rounded,
                ),
              ),

              const SizedBox(height: 12),

              RoleButton(
                title: 'Водитель',
                subtitle: 'Принимать заказы и зарабатывать',
                icon: Icons.local_taxi_rounded,
                onTap: () => openRole(
                  context,
                  'Водитель',
                  Icons.local_taxi_rounded,
                ),
              ),

              const SizedBox(height: 12),

              RoleButton(
                title: 'Магазин',
                subtitle: 'Товары, заказы и доставка',
                icon: Icons.storefront_rounded,
                onTap: () => openRole(
                  context,
                  'Магазин',
                  Icons.storefront_rounded,
                ),
              ),

              const Spacer(),

              const Text(
                'Сервис создан ZolVas',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoleButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const RoleButton({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF18181B),
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFC400),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  icon,
                  color: Colors.black,
                  size: 29,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: Colors.white38,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoleScreen extends StatelessWidget {
  final String role;
  final IconData icon;

  const RoleScreen({
    super.key,
    required this.role,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),

            Icon(
              icon,
              size: 72,
              color: const Color(0xFFFFC400),
            ),

            const SizedBox(height: 24),

            Text(
              role,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Войдите в аккаунт или зарегистрируйтесь',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white60,
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 40),

            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFFFFC400),
                foregroundColor: Colors.black,
                minimumSize: const Size.fromHeight(56),
              ),
              onPressed: () {},
              child: const Text(
                'ВОЙТИ',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                ),
              ),
            ),

            const SizedBox(height: 14),

            OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(56),
              ),
              onPressed: () {},
              child: const Text('РЕГИСТРАЦИЯ'),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}
