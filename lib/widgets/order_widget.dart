import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop/providers/orders.dart';

class OrderWidget extends StatefulWidget {
  final Order order;

  OrderWidget(this.order);

  @override
  _OrderWidgetState createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  bool _expandedItem = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('R\$ ${widget.order.total.toStringAsFixed(2)}'),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(widget.order.date),
            ),
            trailing: IconButton(
              icon: Icon(Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expandedItem = !_expandedItem;
                });
              },
            ),
          ),
          if (_expandedItem)
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 4
              ),
              height: widget.order.items.length * 30.0,
              child: ListView(
                children: widget.order.items.map((prod) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        prod.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        '${prod.quantity} x R\$${prod.price}',
                        style:TextStyle(
                          fontSize: 18,
                          color: Colors.grey
                        ) ,
                      )
                    ],
                  );
                }).toList(),
              ),
            )
          
        ],
      ),
    );
  }
}