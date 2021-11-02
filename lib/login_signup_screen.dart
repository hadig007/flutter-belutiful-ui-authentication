import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_ui/pallete.dart';

class LoginSignUpScreen extends StatefulWidget {
  const LoginSignUpScreen({Key? key}) : super(key: key);

  @override
  _LoginSignUpScreenState createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen> {
  bool isMale = true;
  bool isSignUpScreen = true;
  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      "https://news.umanitoba.ca/wp-content/uploads/2018/12/Top-of-page-15-photo.jpg",
                    ),
                    fit: BoxFit.cover),
              ),
              child: Container(
                padding: EdgeInsets.only(top: 90, left: 20),
                color: Pallete.facebookColor.withOpacity(0.85),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: "Welcome to",
                          style: TextStyle(
                              letterSpacing: 2,
                              fontSize: 25,
                              color: Colors.yellow[700]),
                          children: [
                            TextSpan(
                              text: isSignUpScreen ? " Rizona" : " Back",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.yellow[700],
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      isSignUpScreen
                          ? "Signup to Continue"
                          : "Signin to Continue",
                      style: TextStyle(color: Colors.white, letterSpacing: 1),
                    )
                  ],
                ),
              ),
            ),
          ),
          // trick to add the shadow for the submit button
          buidBottomButton(true),
          AnimatedPositioned(
            curve: Curves.bounceInOut,
            duration: Duration(milliseconds: 300),
            top: 200,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.bounceInOut,
              padding: EdgeInsets.all(20),
              height: isSignUpScreen? 435 : 300,
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 5)
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignUpScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: !isSignUpScreen
                                        ? Pallete.activeColor
                                        : Pallete.textColor1),
                              ),
                              if (!isSignUpScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.orange,
                                )
                            ],
                          ),
                        ),
                        // main container for login and signup
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignUpScreen = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "SignUp",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isSignUpScreen
                                        ? Pallete.activeColor
                                        : Pallete.textColor1),
                              ),
                              if (isSignUpScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.orange,
                                )
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (isSignUpScreen) buildSignUpSection(),
                    if (!isSignUpScreen)
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: buildTextField(Icons.mail_outline,
                                  "info@mail.com", true, false),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: buildTextField(
                                  Icons.mail_outline, "*******", false, true),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      value: isRememberMe,
                                      onChanged: (value) {
                                        setState(() {
                                          isRememberMe = !isRememberMe;
                                        });
                                      },
                                      activeColor: Pallete.activeColor,
                                    ),
                                    Text(
                                      "Remember Me",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Pallete.textColor1),
                                    )
                                  ],
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Forgot Password",
                                    style: TextStyle(color: Pallete.textColor2),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                  ],
                ),
              ),
            ),
          ),
          // trick to add submit button
          buidBottomButton(false),
          // bottom buttons
          Positioned(
            top: MediaQuery.of(context).size.height - 120,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  isSignUpScreen? "Or Signup with" : "Or Signin with",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildButton(CommunityMaterialIcons.facebook,
                          Pallete.facebookColor, "Facebook"),
                      buildButton(CommunityMaterialIcons.google_plus,
                          Pallete.googleColor, "Google"),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildSignUpSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildTextField(CommunityMaterialIcons.account_outline,
                "User Name", false, false),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildTextField(
                CommunityMaterialIcons.email_outline, "Email", true, false),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildTextField(
                CommunityMaterialIcons.key_outline, "Password", false, true),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = true;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                            color: isMale ? Pallete.textColor1 : Colors.white,
                            border: Border.all(
                              width: 1,
                              color: isMale ? Colors.white : Pallete.textColor1,
                            ),
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Icon(
                          CommunityMaterialIcons.account_outline,
                          color: isMale ? Colors.white : Pallete.textColor1,
                        ),
                      ),
                      Text(
                        "Male",
                        style: TextStyle(color: Pallete.textColor1),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = false;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                            color: !isMale ? Pallete.textColor2 : Colors.white,
                            border: Border.all(
                              width: 1,
                              color: Pallete.textColor2,
                            ),
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Icon(
                          CommunityMaterialIcons.account_outline,
                          color: isMale ? Pallete.textColor1 : Colors.white,
                        ),
                      ),
                      Text(
                        "Female",
                        style: TextStyle(color: Pallete.textColor1),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 200,
            margin: EdgeInsets.only(top: 20, bottom: 30),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "By pressing 'Submit' you agree to ",
                  style: TextStyle(color: Pallete.textColor2),
                  children: [
                    TextSpan(
                        text: "term & conditions",
                        style: TextStyle(color: Colors.orange))
                  ]),
            ),
          )
        ],
      ),
    );
  }

  TextButton buildButton(IconData icon, Color color, String teks) {
    return TextButton(
        style: TextButton.styleFrom(
            side: BorderSide(width: 1, color: Colors.grey),
            minimumSize: Size(145, 40),
            primary: Colors.white,
            backgroundColor: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        onPressed: () {},
        child: Row(
          children: [
            Icon(icon),
            SizedBox(
              width: 5,
            ),
            Text(teks)
          ],
        ));
  }

  Widget buidBottomButton(bool showShadow) {
    return AnimatedPositioned(
      duration: Duration(microseconds: 300),
      top: isSignUpScreen? 580 : 450,
      left: 0,
      right: 0,
      child: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: 90,
          width: 90,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                if (showShadow)
                  BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 1.5,
                      blurRadius: 10),
              ],
              borderRadius: BorderRadius.circular(50)),
          child: !showShadow
              ? GestureDetector(
                onTap: (){
                  setState(() {
                    isSignUpScreen =! isSignUpScreen;
                  });
                },
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: LinearGradient(
                          colors: [Colors.orange.shade200, Colors.red.shade400]),
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
              )
              : Center(),
        ),
      ),
    );
  }

  TextField buildTextField(
      IconData icon, String hintText, bool isEmail, bool isPawword) {
    return TextField(
      obscureText: isPawword,
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Pallete.iconColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Pallete.textColor1),
            borderRadius: BorderRadius.all(
              Radius.circular(35.0),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Pallete.textColor1),
            borderRadius: BorderRadius.all(
              Radius.circular(35.0),
            ),
          ),
          hintText: hintText),
    );
  }
}
