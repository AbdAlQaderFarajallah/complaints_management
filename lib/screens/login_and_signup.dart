import 'package:complaints_management/screens/shimmer_animation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../api/controllers/auth_api_controller.dart';
import '../widgets/input_text_field.dart';
import '../widgets/signUp_icon.dart';
import 'home_screen.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import '../api/controllers/auth_api_controller.dart';
// import 'home_screen.dart';

class LoginAndSignupPage extends StatefulWidget {
  static const String id = "LoginAndSignupPage";

  const LoginAndSignupPage({Key? key}) : super(key: key);

  @override
  State<LoginAndSignupPage> createState() => _LoginAndSignupPageState();
}

class _LoginAndSignupPageState extends State<LoginAndSignupPage>
    with TickerProviderStateMixin {
  late PageController _pageController;
  bool isVisible = false;
  late TabController tabController;
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;
  late TextEditingController _nameTextController;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _nameTextController = TextEditingController();
    _pageController = PageController();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _nameTextController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFeeeeee),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 300,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFF6589FF), Color(0xFF003AFC)],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
              ),
            ),
            //
            Column(
              children: [
                const SizedBox(height: 24),
                Image.asset("images/comments.png", width: 56, height: 75),
                const Text(
                  "Complaints Management System",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(24),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              elevation: 3,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white70,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: TabBar(
                                  labelColor: Colors.white,
                                  unselectedLabelColor: const Color(0xFF003AFC),
                                  indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(120),
                                    color: const Color(0xFF003AFC),
                                  ),
                                  controller: tabController,
                                  isScrollable: true,
                                  labelPadding: const EdgeInsets.symmetric(
                                      horizontal: 48),
                                  tabs: const [
                                    Expanded(
                                      child: Tab(
                                        child: Text("Login"),
                                      ),
                                    ),
                                    Expanded(
                                      child: Tab(
                                        child: Text("SignUp"),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Expanded(
                          child: TabBarView(
                            controller: tabController,
                            children: [
                              //
                              //
                              // Login
                              //
                              //
                              ListView(
                                children: [
                                  InputTextField(
                                    icon: Icons.email,
                                    hintText: 'Enter email',
                                    textController: _emailTextController,
                                  ),
                                  const SizedBox(height: 10),
                                  InputTextField(
                                    icon: Icons.lock,
                                    hintText: 'password',
                                    textController: _passwordTextController,
                                  ),
                                  const SizedBox(height: 48),
                                  SizedBox(
                                    height: 50.0,
                                    width: 264,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            padding: const EdgeInsets.all(5),
                                            backgroundColor:
                                                const Color(0xFF003AFC),
                                            shape: const StadiumBorder()),
                                        onPressed: () async {
                                          if(isLoading) return ;
                                          setState(() {
                                            isLoading = true ;
                                          });
                                          await Future.delayed(const Duration(seconds: 2) , () async => await performLogin());
                                          setState(() {
                                            isLoading = false ;
                                          });
                                        },
                                        child: isLoading
                                            ? const CircularProgressIndicator(
                                                color: Colors.white)
                                            : const Text('LOGIN')),
                                  ),
                                ],
                              ),

                              //
                              //
                              // Register
                              //
                              //

                              Column(
                                children: [
                                  InputTextField(
                                    icon: Icons.email,
                                    hintText: 'Enter Email',
                                    textController: _emailTextController,
                                  ),
                                  const SizedBox(height: 10),
                                  InputTextField(
                                    icon: Icons.person,
                                    hintText: 'Enter Name',
                                    textController: _nameTextController,
                                  ),
                                  const SizedBox(height: 10),
                                  InputTextField(
                                    icon: Icons.lock,
                                    hintText: 'Password',
                                    textController: _passwordTextController,
                                  ),
                                  const SizedBox(height: 10),
                                  InputTextField(
                                    icon: Icons.lock,
                                    hintText: 'Confirm password',
                                    textController: _passwordTextController,
                                  ),
                                  const SizedBox(height: 30),
                                  SizedBox(
                                    height: 50.0,
                                    width: 264,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            padding: const EdgeInsets.all(5),
                                            backgroundColor:
                                            const Color(0xFF003AFC),
                                            shape: const StadiumBorder()),
                                        onPressed: () async {
                                          if(isLoading) return ;
                                          setState(() {
                                            isLoading = true ;
                                          });
                                          await Future.delayed(const Duration(seconds: 2) , () async => await performRegister());
                                          setState(() {
                                            isLoading = false ;
                                          });
                                        },
                                        child: isLoading
                                            ? const CircularProgressIndicator(
                                            color: Colors.white)
                                            : const Text('SIGN UP')),
                                  ),
                                  const SizedBox(height: 24),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text("OR",
                                            style:
                                                TextStyle(color: Colors.grey)),
                                      ]),
                                  const SizedBox(height: 24),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SignUpIcon(name: 'images/Group1.svg'),
                                      const SizedBox(width: 50),
                                      SignUpIcon(name: 'images/Group2.svg'),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //****************************************************************************

  Future<void> performLogin() async {
    if (checkData()) {
      await login();
    }
  }

  bool checkData() {
    if (_emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<void> login() async {
    bool status = await AuthApiController().login(
      context,
      email: _emailTextController.text,
      password: _passwordTextController.text,
    );
    if (status) {
      Navigator.pushReplacementNamed(context, ShimmerAnimation.id);
    }
  }

  //****************************************************************************

  Future<void> performRegister() async {
    if (checkDataRegister()) {
      await Register();
    }
  }

  bool checkDataRegister() {
    if (_emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<void> Register() async {
    bool status = await AuthApiController().register(
      context,
      name: _nameTextController.text,
      email: _emailTextController.text,
      password: _passwordTextController.text,
    );
    if (status) Navigator.pushReplacementNamed(context, HomePage.id);
  }
}
