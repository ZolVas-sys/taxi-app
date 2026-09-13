import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'supabase_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: supabaseUrl,
    publishableKey: supabasePublishableKey,
  );

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
        builder: (_) => RoleScreen(role: role, icon: icon),
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
                style: TextStyle(fontSize: 16, color: Colors.white60),
              ),

              const SizedBox(height: 50),

              const Text(
                'Выберите, как войти',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
              ),

              const SizedBox(height: 16),

              RoleButton(
                title: 'Пассажир',
                subtitle: 'Заказать такси или доставку',
                icon: Icons.person_rounded,
                onTap: () =>
                    openRole(context, 'Пассажир', Icons.person_rounded),
              ),

              const SizedBox(height: 12),

              RoleButton(
                title: 'Водитель',
                subtitle: 'Принимать заказы и зарабатывать',
                icon: Icons.local_taxi_rounded,
                onTap: () =>
                    openRole(context, 'Водитель', Icons.local_taxi_rounded),
              ),

              const SizedBox(height: 12),

              RoleButton(
                title: 'Магазин',
                subtitle: 'Товары, заказы и доставка',
                icon: Icons.storefront_rounded,
                onTap: () =>
                    openRole(context, 'Магазин', Icons.storefront_rounded),
              ),

              const Spacer(),

              const Text(
                'Сервис создан ZolVas',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white38, fontSize: 13),
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
                child: Icon(icon, color: Colors.black, size: 29),
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
              const Icon(Icons.chevron_right_rounded, color: Colors.white38),
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

  const RoleScreen({super.key, required this.role, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),

            Icon(icon, size: 72, color: const Color(0xFFFFC400)),

            const SizedBox(height: 24),

            Text(
              role,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
            ),

            const SizedBox(height: 10),

            const Text(
              'Войдите в аккаунт или зарегистрируйтесь',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white60, fontSize: 15),
            ),

            const SizedBox(height: 40),

            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFFFFC400),
                foregroundColor: Colors.black,
                minimumSize: const Size.fromHeight(56),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AuthScreen(role: role, isRegister: false),
                  ),
                );
              },
              child: const Text(
                'ВОЙТИ',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
              ),
            ),

            const SizedBox(height: 14),

            OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(56),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AuthScreen(role: role, isRegister: true),
                  ),
                );
              },
              child: const Text('РЕГИСТРАЦИЯ'),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class AuthScreen extends StatefulWidget {
  final String role;
  final bool isRegister;

  const AuthScreen({super.key, required this.role, required this.isRegister});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool hidePassword = true;

  Future<void> submit() async {
    final name = nameController.text.trim();
    final phone = phoneController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (widget.isRegister && name.isEmpty) {
      showMessage('Введите имя');
      return;
    }

    if (widget.isRegister && phone.isEmpty) {
      showMessage('Введите номер телефона');
      return;
    }

    if (email.isEmpty || !email.contains('@')) {
      showMessage('Введите правильный Email');
      return;
    }

    if (password.length < 6) {
      showMessage('Пароль должен быть не меньше 6 символов');
      return;
    }

    try {
      if (widget.isRegister) {
        final response = await Supabase.instance.client.auth.signUp(
          email: email,
          password: password,
          data: {'name': name, 'phone': phone, 'role': widget.role},
        );

        if (!mounted) return;

        if (response.session == null) {
          showMessage(
            'Регистрация успешна. Проверьте почту и подтвердите Email.',
          );
          return;
        }
      } else {
        await Supabase.instance.client.auth.signInWithPassword(
          email: email,
          password: password,
        );
      }

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => DashboardScreen(role: widget.role)),
      );
    } on AuthException catch (e) {
      if (!mounted) return;
      showMessage(e.message);
    } catch (e) {
      if (!mounted) return;
      showMessage('Ошибка подключения. Попробуйте ещё раз.');
    }
  }

  void showMessage(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30),
            Text(
              widget.isRegister ? 'Регистрация' : 'Вход',
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 8),
            Text(
              widget.role,
              style: const TextStyle(
                color: Color(0xFFFFC400),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),

            if (widget.isRegister) ...[
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Имя',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
            ],

            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Номер телефона',
                hintText: '+7 700 000 00 00',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'example@mail.com',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: hidePassword,
              decoration: InputDecoration(
                labelText: 'Пароль',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() => hidePassword = !hidePassword);
                  },
                  icon: Icon(
                    hidePassword ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFFFFC400),
                foregroundColor: Colors.black,
                minimumSize: const Size.fromHeight(56),
              ),
              onPressed: submit,
              child: Text(widget.isRegister ? 'ЗАРЕГИСТРИРОВАТЬСЯ' : 'ВОЙТИ'),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  final String role;

  const DashboardScreen({super.key, required this.role});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final fromController = TextEditingController();
  final toController = TextEditingController();
  final priceController = TextEditingController();
  final waitingController = TextEditingController(text: '0');

  final List<TextEditingController> stopControllers = [];

  void addStop() {
    if (stopControllers.length >= 5) {
      showMessage('Можно добавить не больше 5 остановок');
      return;
    }

    setState(() {
      stopControllers.add(TextEditingController());
    });
  }

  void removeStop(int index) {
    stopControllers[index].dispose();

    setState(() {
      stopControllers.removeAt(index);
    });
  }

  @override
  void dispose() {
    fromController.dispose();
    toController.dispose();
    priceController.dispose();
    waitingController.dispose();

    for (final controller in stopControllers) {
      controller.dispose();
    }

    super.dispose();
  }

  Future<void> createOrder() async {
    final from = fromController.text.trim();
    final to = toController.text.trim();
    final price = int.tryParse(priceController.text.trim());
    final waitingMinutes = int.tryParse(waitingController.text.trim()) ?? 0;

    final stops = stopControllers
        .map((controller) => controller.text.trim())
        .where((text) => text.isNotEmpty)
        .toList();

    if (from.isEmpty) {
      showMessage('Укажите, откуда ехать');
      return;
    }

    if (to.isEmpty) {
      showMessage('Укажите, куда ехать');
      return;
    }

    if (price == null || price <= 0) {
      showMessage('Укажите правильную фиксированную цену');
      return;
    }

    if (waitingMinutes < 0 || waitingMinutes > 180) {
      showMessage('Ожидание можно указать от 0 до 180 минут');
      return;
    }

    final user = Supabase.instance.client.auth.currentUser;

    if (user == null) {
      showMessage('Необходимо войти в аккаунт');
      return;
    }

    try {
      await Supabase.instance.client.from('orders').insert({
        'passenger_id': user.id,
        'from_address': from,
        'to_address': to,
        'stops': stops,
        'waiting_minutes': waitingMinutes,
        'price': price,
        'status': 'pending',
      });

      if (!mounted) return;

      fromController.clear();
      toController.clear();
      priceController.clear();
      waitingController.text = '0';

      for (final controller in stopControllers) {
        controller.dispose();
      }

      setState(() {
        stopControllers.clear();
      });

      showMessage(
        'Заказ создан • ${stops.length} остановок • '
        '$waitingMinutes мин • $price ₸',
      );
    } catch (e) {
      if (!mounted) return;
      showMessage('Не удалось создать заказ: $e');
    }
  }

  Future<List<Map<String, dynamic>>> loadDriverOrders() async {
    final data = await Supabase.instance.client
        .from('orders')
        .select(
          'id, from_address, to_address, stops, '
          'waiting_minutes, price, status, created_at',
        )
        .eq('status', 'pending')
        .order('created_at', ascending: false);

    return List<Map<String, dynamic>>.from(data);
  }

  Future<void> offerPrice(Map<String, dynamic> order) async {
    final controller = TextEditingController(text: '${order['price'] ?? ''}');

    final result = await showDialog<int>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Предложить свою цену'),
          content: TextField(
            controller: controller,
            autofocus: true,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Ваша цена',
              suffixText: '₸',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('ОТМЕНА'),
            ),
            FilledButton(
              onPressed: () {
                final price = int.tryParse(controller.text.trim());

                if (price == null || price <= 0) {
                  return;
                }

                Navigator.pop(dialogContext, price);
              },
              child: const Text('ПРЕДЛОЖИТЬ'),
            ),
          ],
        );
      },
    );

    controller.dispose();

    if (result == null) return;

    final user = Supabase.instance.client.auth.currentUser;

    if (user == null) {
      showMessage('Необходимо войти в аккаунт');
      return;
    }

    try {
      await Supabase.instance.client.from('order_offers').upsert({
        'order_id': order['id'],
        'driver_id': user.id,
        'price': result,
        'status': 'pending',
      }, onConflict: 'order_id,driver_id');

      if (!mounted) return;

      showMessage('Предложение $result ₸ отправлено пассажиру');

      setState(() {});
    } catch (e) {
      if (!mounted) return;
      showMessage('Не удалось отправить предложение: $e');
    }
  }

  void showMessage(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  Widget buildPassenger() {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ТАКСИ БОНУС',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.person_outline),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Куда едем?',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 8),
              const Text(
                'Маршрут, остановки, ожидание и фиксированная цена',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 28),
              TextField(
                controller: fromController,
                decoration: const InputDecoration(
                  labelText: 'Откуда',
                  hintText: 'Адрес подачи',
                  prefixIcon: Icon(Icons.my_location),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              ...List.generate(stopControllers.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: TextField(
                    controller: stopControllers[index],
                    decoration: InputDecoration(
                      labelText: 'Остановка ${index + 1}',
                      hintText: 'Адрес остановки',
                      prefixIcon: const Icon(Icons.add_location_alt_outlined),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => removeStop(index),
                      ),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                );
              }),

              OutlinedButton.icon(
                onPressed: addStop,
                icon: const Icon(Icons.add),
                label: Text('ДОБАВИТЬ ОСТАНОВКУ (${stopControllers.length}/5)'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: toController,
                decoration: const InputDecoration(
                  labelText: 'Куда',
                  hintText: 'Конечный адрес',
                  prefixIcon: Icon(Icons.location_on_outlined),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: waitingController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Ожидание',
                  prefixIcon: Icon(Icons.schedule),
                  suffixText: 'мин',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Ваша цена',
                  hintText: 'Например: 2500',
                  prefixIcon: Icon(Icons.payments_outlined),
                  suffixText: '₸',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 28),
              SizedBox(
                height: 58,
                child: FilledButton(
                  onPressed: createOrder,
                  child: const Text(
                    'ЗАКАЗАТЬ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              SizedBox(
                height: 52,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PassengerOffersScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.local_taxi_outlined),
                  label: const Text(
                    'ПРЕДЛОЖЕНИЯ ВОДИТЕЛЕЙ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 18),

              const Center(
                child: Text(
                  'Водители смогут предложить свою цену',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDriver() {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ЗАКАЗЫ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: loadDriverOrders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Ошибка загрузки заказов:\n${snapshot.error}',
                textAlign: TextAlign.center,
              ),
            );
          }

          final orders = snapshot.data ?? [];

          if (orders.isEmpty) {
            return RefreshIndicator(
              onRefresh: () async => setState(() {}),
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: const [
                  SizedBox(height: 220),
                  Icon(Icons.local_taxi_outlined, size: 70),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      'Пока нет свободных заказов',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async => setState(() {}),
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: orders.length,
              separatorBuilder: (_, _) => const SizedBox(height: 14),
              itemBuilder: (context, index) {
                final order = orders[index];

                final stopsRaw = order['stops'];
                final stops = stopsRaw is List
                    ? stopsRaw.map((e) => '$e').toList()
                    : <String>[];

                final waiting = order['waiting_minutes'] ?? 0;
                final price = order['price'] ?? 0;

                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          '${order['from_address']}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 6),
                          child: Icon(Icons.arrow_downward),
                        ),

                        ...List.generate(stops.length, (stopIndex) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              'Остановка ${stopIndex + 1}: '
                              '${stops[stopIndex]}',
                            ),
                          );
                        }),

                        Text(
                          '${order['to_address']}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Divider(height: 28),

                        Text('Остановок: ${stops.length}'),
                        const SizedBox(height: 6),

                        Text('Ожидание: $waiting мин'),
                        const SizedBox(height: 12),

                        Text(
                          'Цена пассажира: $price ₸',
                          style: const TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 18),

                        SizedBox(
                          height: 52,
                          child: FilledButton(
                            onPressed: () => offerPrice(order),
                            child: const Text(
                              'ПРЕДЛОЖИТЬ СВОЮ ЦЕНУ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.role == 'Пассажир') {
      return buildPassenger();
    }

    if (widget.role == 'Водитель') {
      return buildDriver();
    }

    return Scaffold(
      appBar: AppBar(title: Text(widget.role)),
      body: Center(
        child: Text(
          '${widget.role}: вход выполнен',
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class PassengerOffersScreen extends StatefulWidget {
  const PassengerOffersScreen({super.key});

  @override
  State<PassengerOffersScreen> createState() => _PassengerOffersScreenState();
}

class _PassengerOffersScreenState extends State<PassengerOffersScreen> {
  late Future<List<Map<String, dynamic>>> offersFuture;

  @override
  void initState() {
    super.initState();
    offersFuture = loadOffers();
  }

  Future<List<Map<String, dynamic>>> loadOffers() async {
    final client = Supabase.instance.client;
    final user = client.auth.currentUser;

    if (user == null) {
      return [];
    }

    final ordersData = await client
        .from('orders')
        .select(
          'id, from_address, to_address, stops, '
          'waiting_minutes, price, status',
        )
        .eq('passenger_id', user.id)
        .eq('status', 'pending');

    final orders = List<Map<String, dynamic>>.from(ordersData);

    if (orders.isEmpty) {
      return [];
    }

    final ordersById = <String, Map<String, dynamic>>{};

    for (final order in orders) {
      ordersById['${order['id']}'] = order;
    }

    final orderIds = ordersById.keys.toList();

    final offersData = await client
        .from('order_offers')
        .select('id, order_id, driver_id, price, status, created_at')
        .inFilter('order_id', orderIds)
        .eq('status', 'pending')
        .order('created_at', ascending: false);

    final offers = List<Map<String, dynamic>>.from(offersData);

    final driverIds = offers
        .map((offer) => '${offer['driver_id']}')
        .toSet()
        .toList();

    final driverNames = <String, String>{};

    if (driverIds.isNotEmpty) {
      try {
        final profilesData = await client
            .from('profiles')
            .select('id, name')
            .inFilter('id', driverIds);

        for (final profile in List<Map<String, dynamic>>.from(profilesData)) {
          final name = '${profile['name'] ?? ''}'.trim();

          if (name.isNotEmpty) {
            driverNames['${profile['id']}'] = name;
          }
        }
      } catch (_) {
        // Если политика profiles пока не разрешает просмотр,
        // просто показываем "Водитель".
      }
    }

    final result = <Map<String, dynamic>>[];

    for (final offer in offers) {
      final order = ordersById['${offer['order_id']}'];

      if (order == null) {
        continue;
      }

      result.add({
        ...offer,
        'order': order,
        'driver_name': driverNames['${offer['driver_id']}'] ?? 'Водитель',
      });
    }

    return result;
  }

  void reload() {
    setState(() {
      offersFuture = loadOffers();
    });
  }

  Future<void> acceptOffer(Map<String, dynamic> offer) async {
    final price = offer['price'];

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Принять предложение?'),
          content: Text(
            'Цена поездки будет $price ₸.\n'
            'Этот водитель получит заказ.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, false),
              child: const Text('ОТМЕНА'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(dialogContext, true),
              child: const Text('ПРИНЯТЬ'),
            ),
          ],
        );
      },
    );

    if (confirmed != true) {
      return;
    }

    try {
      await Supabase.instance.client.rpc(
        'accept_driver_offer',
        params: {'p_offer_id': offer['id']},
      );

      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Предложение $price ₸ принято')));

      reload();
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Не удалось принять предложение: $e')),
      );
    }
  }

  Future<void> rejectOffer(Map<String, dynamic> offer) async {
    try {
      await Supabase.instance.client.rpc(
        'reject_driver_offer',
        params: {'p_offer_id': offer['id']},
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Предложение отклонено')));

      reload();
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Не удалось отклонить предложение: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ПРЕДЛОЖЕНИЯ ВОДИТЕЛЕЙ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: offersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  'Ошибка загрузки:\n${snapshot.error}',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          final offers = snapshot.data ?? [];

          if (offers.isEmpty) {
            return RefreshIndicator(
              onRefresh: () async {
                reload();
                await offersFuture;
              },
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: const [
                  SizedBox(height: 220),
                  Icon(Icons.local_taxi_outlined, size: 72),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      'Пока нет предложений',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Center(
                    child: Text(
                      'Потяните вниз, чтобы обновить',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              reload();
              await offersFuture;
            },
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: offers.length,
              separatorBuilder: (_, _) => const SizedBox(height: 14),
              itemBuilder: (context, index) {
                final offer = offers[index];
                final order = Map<String, dynamic>.from(offer['order']);

                final stopsRaw = order['stops'];
                final stops = stopsRaw is List
                    ? stopsRaw.map((e) => '$e').toList()
                    : <String>[];

                final waiting = order['waiting_minutes'] ?? 0;

                final passengerPrice = order['price'] ?? 0;

                final offerPrice = offer['price'] ?? 0;

                final driverName = '${offer['driver_name']}';

                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(child: Icon(Icons.local_taxi)),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                driverName,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const Divider(height: 28),

                        Text(
                          '${order['from_address']}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),

                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Icon(Icons.arrow_downward, size: 20),
                        ),

                        ...List.generate(
                          stops.length,
                          (stopIndex) => Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Text(
                              'Остановка ${stopIndex + 1}: '
                              '${stops[stopIndex]}',
                            ),
                          ),
                        ),

                        Text(
                          '${order['to_address']}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),

                        const SizedBox(height: 14),

                        Text('Остановок: ${stops.length}'),
                        Text('Ожидание: $waiting мин'),

                        const Divider(height: 28),

                        Text('Ваша цена: $passengerPrice ₸'),

                        const SizedBox(height: 7),

                        Text(
                          'Водитель предлагает: '
                          '$offerPrice ₸',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                          ),
                        ),

                        const SizedBox(height: 18),

                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () => rejectOffer(offer),
                                child: const Text('ОТКЛОНИТЬ'),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: FilledButton(
                                onPressed: () => acceptOffer(offer),
                                child: const Text(
                                  'ПРИНЯТЬ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
