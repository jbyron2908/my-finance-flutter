import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/common/ui_helpers.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_viewer/controller/account_viewer_controller.dart';
import 'package:my_finance_flutter/ui/widgets/model/category/category_icon.dart';

class OperationView extends StatelessWidget {
  OperationView(
    this.index, {
    Key key,
  }) : super(key: key);

  final int index;
  final AccountViewerController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    var operation = controller.getOperation(index);

    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          CategoryIcon(operation.category),
          UIHelper.horizontalSpaceSmall,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        operation.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                    Text(
                      operation.getValueWithCurrency(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.subtitle1,
                    )
                  ],
                ),
                UIHelper.verticalSpaceTiny,
                Text(
                  operation.getOperationInfo(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                UIHelper.verticalSpaceTiny,
                Text(
                  operation.getAccountInfo(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OperationIcon extends StatelessWidget {
  const OperationIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.add,
              size: 32,
              color: Colors.white,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add,
                size: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OperationRow extends StatelessWidget {
  const OperationRow({
    Key key,
    @required this.rightText,
    @required this.leftText,
  }) : super(key: key);

  final String rightText;
  final String leftText;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Text(
              rightText,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          VerticalDivider(
            color: Colors.grey,
          ),
          Expanded(
            flex: 2,
            child: Text(
              leftText,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        ],
      ),
    );
  }
}
