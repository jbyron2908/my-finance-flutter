import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/widget/category_list_view.dart';
import 'package:my_finance_flutter/ui/widgets/item_list/item_list.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    Key key,
    @required this.parentBuilder,
    this.childBuilder,
    this.onlyParent = false,
  }) : super(key: key);

  final bool onlyParent;
  final Widget Function(BuildContext, CategoryModel) parentBuilder;
  final Widget Function(BuildContext, CategoryModel) childBuilder;

  @override
  Widget build(BuildContext context) {
    if (onlyParent) {
      return Container(
        child: ParentCategoryList(
          itemBuilder: parentBuilder,
        ),
      );
    } else {
      return Container(
        child: FullCategoryList(
          parentBuilder: parentBuilder,
          childBuilder: childBuilder,
        ),
      );
    }
  }
}

class ParentCategoryList extends StatelessWidget {
  const ParentCategoryList({
    Key key,
    @required this.itemBuilder,
  }) : super(key: key);

  final Widget Function(BuildContext, CategoryModel) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<List<CategoryModel>>(
        builder: (context, list, child) {
          if (list == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var parentList = _filterParentCategoryList(list);
            return ItemList(
              modelList: parentList,
              itemBuilder: itemBuilder,
            );
          }
        },
      ),
    );
  }

  List<CategoryModel> _filterParentCategoryList(
    List<CategoryModel> categoryList,
  ) {
    return categoryList
        .where(
          (category) => category.parent == null,
        )
        .toList();
  }
}

class FullCategoryList extends StatelessWidget {
  const FullCategoryList({
    Key key,
    @required this.parentBuilder,
    @required this.childBuilder,
  }) : super(key: key);

  final Widget Function(BuildContext, CategoryModel) parentBuilder;
  final Widget Function(BuildContext, CategoryModel) childBuilder;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<List<CategoryModel>>(
        builder: (context, list, child) {
          if (list == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var itemList = _buildCategoryItemList(list);
            return SingleChildScrollView(
              child: ParentCategoryExpasionPanelList(
                itemList: itemList,
                parentBuilder: parentBuilder,
                childBuilder: childBuilder,
              ),
            );
          }
        },
      ),
    );
  }

  List<CategoryItemModel> _buildCategoryItemList(
    List<CategoryModel> categoryList,
  ) {
    return categoryList.where((category) => category.parent == null).map(
      (parent) {
        var children = categoryList
            .where(
              (category) => category.parent == parent,
            )
            .toList();

        return CategoryItemModel(false, parent, children);
      },
    ).toList();
  }
}

class ParentCategoryExpasionPanelList extends StatefulWidget {
  ParentCategoryExpasionPanelList({
    Key key,
    @required this.itemList,
    @required this.parentBuilder,
    @required this.childBuilder,
  }) : super(key: key);

  final List<CategoryItemModel> itemList;
  final Widget Function(BuildContext, CategoryModel) parentBuilder;
  final Widget Function(BuildContext, CategoryModel) childBuilder;

  @override
  _ParentCategoryExpasionPanelListState createState() =>
      _ParentCategoryExpasionPanelListState();
}

class _ParentCategoryExpasionPanelListState
    extends State<ParentCategoryExpasionPanelList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ExpansionPanelList(
        expansionCallback: (index, expanded) {
          setState(() {
            widget.itemList[index].isExpanded = !expanded;
          });
        },
        children: widget.itemList
            .map(
              (item) => _buildItem(item),
            )
            .toList(),
      ),
    );
  }

  ExpansionPanel _buildItem(CategoryItemModel item) {
    return ExpansionPanel(
      isExpanded: item.isExpanded,
      canTapOnHeader: true,
      headerBuilder: (context, expanded) {
        return widget.parentBuilder(context, item.parent);
      },
      body: CategoryListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        categoryList: item.children,
        itemBuilder: widget.childBuilder,
      ),
    );
  }
}

class CategoryItemModel {
  CategoryItemModel(
    this.isExpanded,
    this.parent,
    this.children,
  );

  bool isExpanded;
  CategoryModel parent;
  List<CategoryModel> children;
}
