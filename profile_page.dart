import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffffffff),
        leading: const Icon(Icons.arrow_back, color: Colors.black54),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            titleSection,
            section1,
            numberValueWidget,
            Container(
                padding: const EdgeInsets.all(18), child: listViewSection4)
          ],
        ),
      ),
      persistentFooterButtons: [
        Container(padding: const EdgeInsets.all(10), child: footerLogout())
      ],
    );
  }
}

Widget section1 = Container(
    padding: const EdgeInsets.only(top: 30, left: 18), child: section2);

Widget section2 = Column(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    listOfSection1(Icons.add_ic_call, '+19159969739'),
    listOfSection1(Icons.mail, 'sheldoncopper@gmail.com')
  ],
);

Row listOfSection1(IconData icon, String label) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Icon(
        icon,
        color: Colors.grey,
        size: 15,
      ),
      Container(
        padding: const EdgeInsets.only(left: 8),
        child: Text(
          label,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
      )
    ],
  );
}

Column footerLogout() {
  return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.logout,
              size: 20,
              color: Colors.deepOrangeAccent,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 8,
              ),
              child: const Text(
                'Log Out',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
            )
          ],
        )
      ]);
}

Row listOfSection4(IconData icon, String label) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Icon(
        icon,
        size: 20,
        color: Colors.deepOrangeAccent,
      ),
      Container(
        padding: const EdgeInsets.only(
          left: 8,
        ),
        child: Text(
          label,
          style: const TextStyle(color: Colors.black, fontSize: 12),
        ),
      )
    ],
  );
}

Widget numberValueWidget = Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    numberValues('\$1000', 'Balance'),
    numberValues('14', 'Order'),
  ],
);

Column numberValues(String label1, String label2) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label1,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      Text(
        label2,
        style: const TextStyle(color: Colors.grey, fontSize: 15),
      ),
    ],
  );
}

Stack setImage() {
  return Stack(
    alignment: const Alignment(0.0, 1.3),
    children: [
      Container(
        padding: const EdgeInsets.only(left: 50),
        height: 140,
        width: 100,
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('asset/out.png'),
              fit: BoxFit.fill,
            ),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
      Container(
        width: 70,
        height: 30,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        alignment: Alignment.center,
        child: const Text(
          'EMMA',
        ),
      ),
    ],
  );
}

Widget titleSection = Container(
  padding: const EdgeInsets.only(left: 20),
  child: Row(
    children: [
      setImage(),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 50),
          ),
          const SizedBox(
            height: 50,
          ),
          Card(
            elevation: 20,
            child: Container(
              height: 40,
              width: 60,
              decoration: const BoxDecoration(
                color: Colors.deepOrangeAccent,
                borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
              ),
              child: const Text('+\nFollow',style: TextStyle(fontWeight: FontWeight.bold),),
              alignment: Alignment.center,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              numberValues('104', 'Design Posted'),
              numberValues('12', 'Board Created'),
            ],
          ),
        ],
      )
    ],
  ),
);

Widget listViewSection4 = Column(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  mainAxisSize: MainAxisSize.max,
  children: [
    listOfSection4(Icons.heart_broken, 'Your Favorites'),
    const SizedBox(
      height: 13,
    ),
    listOfSection4(Icons.payment, 'Payment'),
    const SizedBox(
      height: 13,
    ),
    listOfSection4(Icons.code, 'Referral Code'),
    const SizedBox(
      height: 13,
    ),
    listOfSection4(Icons.discount, 'Promotions'),
    const SizedBox(
      height: 13,
    ),
    listOfSection4(Icons.settings, 'Settings')
  ],
);
