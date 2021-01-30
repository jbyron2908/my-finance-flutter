import 'package:flutter/material.dart';

class ItemList<T> extends StatelessWidget {
  const ItemList({
    Key key,
    @required this.modelList,
    @required this.itemBuilder,
    this.shrinkWrap = false,
    this.physics,
  }) : super(key: key);

  final List<T> modelList;
  final Widget Function(BuildContext, T model) itemBuilder;
  final bool shrinkWrap;
  final ScrollPhysics physics;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: shrinkWrap,
        physics: physics,
        itemCount: modelList.length,
        itemBuilder: (context, index) => Item<T>(
          model: modelList[index],
          builder: itemBuilder,
        ),
      ),
    );
  }
}

class Item<T> extends StatelessWidget {
  const Item({
    Key key,
    this.model,
    this.builder,
  }) : super(key: key);

  final T model;
  final Widget Function(BuildContext, T) builder;

  @override
  Widget build(BuildContext context) {
    return builder(context, model);
  }
}
