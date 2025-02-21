import 'package:flutter/material.dart';
import 'package:my_diary/db_my/my_entity.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:get/get.dart';
import '../../main.dart';

class Item extends StatefulWidget {
  const Item(this.entity, {this.onTap, Key? key}) : super(key: key);
  final MyEntity entity;
  final Function(int)? onTap;

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        child: <Widget>[
          <Widget>[
            Image.asset(
              'assets/icon${widget.entity.type}.webp',
              width: 38,
              height: 38,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                widget.entity.createdTimeHMStr,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
            const Icon(
              Icons.more_horiz,
              size: 30,
              color: Colors.black,
            ).gestures(onTap: () {
              setState(() {
                isShow = !isShow;
              });
            })
          ].toRow(),
          Divider(
            height: 20,
            color: Colors.grey[300],
          ),
          Text(
            widget.entity.content,
            textAlign: TextAlign.start,
          ),
          Divider(
            height: 20,
            color: Colors.grey[300],
          ),
          <Widget>[
            Text(
              widget.entity.weekday,
              style: const TextStyle(color: Colors.grey),
            ),
            Text(
              widget.entity.createdTimeYMDStr,
              style: const TextStyle(color: Colors.grey),
            )
          ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween)
        ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
      ).decorated(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: primaryColor,
                offset: const Offset(0, -2),
                spreadRadius: 1,
                blurRadius: 1)
          ]).marginOnly(bottom: 20),
      Visibility(
          visible: isShow,
          child: Positioned(
            top: 35,
            right: 12,
            child: Container(
              width: 80,
              padding: const EdgeInsets.all(8),
              child: <Widget>[
                const Text(
                  'Pinned',
                  style: TextStyle(fontSize: 14),
                ).marginOnly(bottom: 10).gestures(onTap: () {
                  setState(() {
                    isShow = false;
                    widget.onTap?.call(0);
                  });
                }),
                const Text(
                  'Delete',
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ).gestures(onTap: () {
                  setState(() {
                    isShow = false;
                    widget.onTap?.call(1);
                  });
                })
              ].toColumn(mainAxisAlignment: MainAxisAlignment.start),
            ).decorated(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color:const Color(0xff262626).withOpacity(0.28), width: 1)),
          ))
    ].toStack();
  }
}
