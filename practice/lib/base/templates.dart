import 'package:flutter/material.dart';

class TxtShow extends StatelessWidget {
  final txt, pad, lmar, tmar, fsz, tal, clr;
  TxtShow(
      {this.txt,
      this.pad = 0.0,
      this.lmar = 0.0,
      this.tmar = 0.0,
      this.fsz = 14.0,
      this.tal = TextAlign.left,
      this.clr = Colors.black87});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        txt,
        textAlign: tal,
        style: TextStyle(fontSize: fsz, color: clr),
      ),
      margin: EdgeInsets.only(left: lmar, top: tmar),
      padding: EdgeInsets.all(pad),
    );
  }
}

class TxField extends StatelessWidget {
  final label;
  TxField(this.label);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(),
    );
  }
}

class ListTtl extends StatelessWidget {
  final label, target, icon;
  ListTtl(this.label, this.target, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Row(children: [
          Icon(
            icon,
            size: 22,
            color: Colors.white54,
          ),
          Text(
            '   $label',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ]),
        onTap: target,
      ),
    );
  }
}
