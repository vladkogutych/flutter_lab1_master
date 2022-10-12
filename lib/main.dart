import 'package:flutter/material.dart';

main (){
  runApp(MaterialApp(
    debugShowCheckedModeBanner:  false,
    home: MyApp(),

));

}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,

      ),

      body:CustomPaint(
        painter: BackgroundSignIn(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children:  [

            const Text('Welcome',
              style: TextStyle(color: Colors.black, fontSize: 37, fontWeight: FontWeight.w900),

            ),
            TextField(
              controller: name,
              style: const TextStyle(color: Colors.blueGrey, fontSize:25, fontWeight: FontWeight.w500),

              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)),
                labelText: "Enter Your Name"

              ),
            ),
          TextField(

              style: const TextStyle(color: Colors.blueGrey, fontSize: 25, fontWeight: FontWeight.w500),
              controller: email,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: "Enter Your email")
            ),

            ElevatedButton(
                onPressed: () {

              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>NextScreen(

                    name: name.text,
                    email: email.text,
                  ))).whenComplete(() => {
                    name.clear(),
                    email.clear(),
              });
            },
                child: const Text ("NEXT") )
          ],
        ),
      ),
    );
  }
}
class NextScreen extends StatelessWidget {
  String? name,email;
  NextScreen({
  this.email, this.name
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CustomPaint(
        painter: BackgroundSignIn(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Welcome, " + name.toString(), style: TextStyle(color: Colors.black, fontSize: 50, fontWeight: FontWeight.w700)),


            ],
          ),
        ),
      ) ,
    );
  }
}
class BackgroundSignIn extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var sw = size.width;
    var sh = size.height;
    var paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, sw, sh));
    paint.color = Colors.grey.shade100;
    canvas.drawPath(mainBackground, paint);

    // Blue
    Path blueWave = Path();
    blueWave.lineTo(sw, 0);
    blueWave.lineTo(sw, sh * 0.5);
    blueWave.quadraticBezierTo(sw * 0.5, sh * 0.45, sw * 0.2, 0);
    blueWave.close();
    paint.color = Colors.blue.shade300;
    canvas.drawPath(blueWave, paint);

    // cyan
    Path cyanWave = Path();
    cyanWave.lineTo(sw, 0);
    cyanWave.lineTo(sw, sh * 0.1);
    cyanWave.cubicTo(
        sw * 0.95, sh * 0.15, sw * 0.65, sh * 0.15, sw * 0.6, sh * 0.38);
    cyanWave.cubicTo(sw * 0.52, sh * 0.52, sw * 0.05, sh * 0.45, 0, sh * 0.4);
    cyanWave.close();
    paint.color = Colors.cyanAccent;
    canvas.drawPath(cyanWave, paint);

    // Yellow
    Path yellowWave = Path();
    yellowWave.lineTo(sw * 0.7, 0);
    yellowWave.cubicTo(
        sw * 0.5, sh * 0.2, sw * 0.27, sh * 0.01, sw * 0.2, sh * 0.1);
    yellowWave.quadraticBezierTo(sw * 0.12, sh * 0.2, 0, sh * 0.2);
    yellowWave.close();
    paint.color = Colors.orange.shade300;
    canvas.drawPath(yellowWave, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}