import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorMessage = '';

  void _login() {
    // Проверяем валидацию полей формы
    if (_formKey.currentState!.validate()) {
      // Если валидация успешна, "сохраняем" поля (для вызова onSaved в TextFormField, если он есть)
      _formKey.currentState!.save();

      // Здесь должна быть ваша логика аутентификации (например, вызов API)
      // В этом примере мы просто проверяем наличие email и пароля
      final email = _emailController.text;
      final password = _passwordController.text;

      print('Attempting login with Email: $email, Password: $password');

      // --- ВАША ЛОГИКА АУТЕНТИФИКАЦИИ ---
      // Пример: Простая проверка (замените на реальную логику!)
      if (email.isNotEmpty && password.isNotEmpty) {
         // Здесь вы должны вызвать ваш сервис аутентификации
         // Например: AuthService().login(email, password).then(...)

         // В этом демо просто имитируем успех через 2 секунды
         setState(() {
            _errorMessage = 'Вход выполнен успешно (имитация)!';
         });
         // В реальном приложении здесь будет переход на другую страницу
         // Future.delayed(Duration(seconds: 2), () {
         //   Navigator.pushReplacementNamed(context, '/home'); // Пример перехода
         // });

      } else {
         // Имитация ошибки
         setState(() {
            _errorMessage = 'Пожалуйста, введите email и пароль.';
         });
      }
      // --- КОНЕЦ ЛОГИКИ АУТЕНТИФИКАЦИИ ---

    } else {
       setState(() {
          _errorMessage = 'Пожалуйста, исправьте ошибки в форме.';
       });
    }
  }

  @override
  void dispose() {
    // Обязательно очищаем контроллеры при удалении виджета
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Авторизация'),
        centerTitle: true,
      ),
      body: Center( // Центрируем содержимое
        child: SingleChildScrollView( // Позволяет прокручивать форму, если она не умещается на экране
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Центрируем элементы по вертикали в Column
              crossAxisAlignment: CrossAxisAlignment.stretch, // Растягиваем элементы по горизонтали
              children: <Widget>[
                // Иконка или логотип (опционально)
                const Icon(
                  Icons.lock,
                  size: 80,
                  color: Colors.blue, // Или любой другой цвет
                ),
                const SizedBox(height: 20), // Отступ

                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    prefixIcon: const Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите Email';
                    }
                    // Простая проверка формата email (можно улучшить)
                    if (!value.contains('@')) {
                      return 'Некорректный формат Email';
                    }
                    return null; // Возвращаем null, если валидация успешна
                  },
                ),
                const SizedBox(height: 20), // Отступ

                TextFormField(
                  controller: _passwordController,
                  obscureText: true, // Скрывает вводимый текст (для пароля)
                  decoration: InputDecoration(
                    labelText: 'Пароль',
                    border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(8.0),
                    ),
                     prefixIcon: const Icon(Icons.lock),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите пароль';
                    }
                    if (value.length < 6) { // Пример минимальной длины
                       return 'Пароль должен быть не менее 6 символов';
                    }
                    return null; // Возвращаем null, если валидация успешна
                  },
                ),
                const SizedBox(height: 20), // Отступ

                ElevatedButton(
                  onPressed: _login, // Привязываем кнопку к методу _login
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(8.0),
                    )
                  ),
                  child: const Text(
                    'Войти',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 10), // Отступ

                // Отображение сообщения об ошибке (или успеха)
                if (_errorMessage.isNotEmpty) // Показываем текст только если _errorMessage не пустой
                  Text(
                    _errorMessage,
                    style: TextStyle(
                      color: _errorMessage.contains('успешно') ? Colors.green : Colors.red, // Цвет зависит от сообщения
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),

                 const SizedBox(height: 20), // Отступ

                 // Дополнительные кнопки (опционально)
                 TextButton(
                    onPressed: () {
                       // Логика для регистрации
                       print('Переход к регистрации');
                       // Navigator.pushNamed(context, '/register'); // Пример перехода
                    },
                    child: const Text('Нет аккаунта? Зарегистрироваться'),
                 ),
                 TextButton(
                    onPressed: () {
                       // Логика для восстановления пароля
                       print('Переход к восстановлению пароля');
                       // Navigator.pushNamed(context, '/forgot_password'); // Пример перехода
                    },
                    child: const Text('Забыли пароль?'),
                 ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}