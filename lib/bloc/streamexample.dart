/**
 * Created by Nguyễn Trung Thành on 1/22/2021.
 *
 * victo202298@gmail.com
 */
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class Customer {
  String _firstName;
  String _lastName;
  bool _upButton;
  bool _downButton;

  Customer(this._firstName, this._lastName) {
    _upButton = false;
    _downButton = false;
  }

  String get name => "$_firstName $_lastName";

  bool get upButton => _upButton;

  bool get downButton => _downButton;

  set upButton(bool value) {
    _upButton = value;
  }

  set downButton(bool value) {
    _downButton = value;
  }

  operator ==(other) =>
      (other is Customer) &&
      (_firstName == other._firstName) &&
      (_lastName == other._lastName);

  int get hasCode => _firstName.hashCode ^ _lastName.hashCode;
}

class Bloc {
  List<Customer> _customerList = [];
  final _upActionStreamController = StreamController<Customer>();
  final _downActionStreamController = StreamController<Customer>();
  final _customerListSubject = BehaviorSubject<List<Customer>>();
  final _messageSubject = BehaviorSubject<String>();

  Bloc() {
    _upActionStreamController.stream.listen(_handleUp);
    _downActionStreamController.stream.listen(_handleDown);
  }

  List<Customer> initCustomerList() {
    _customerList = [
      Customer("Fred", "Smith"),
      Customer("Brian", "Johnson"),
      Customer("James", "McGirl"),
      Customer("John", "Brown")
    ];
    updateUpDownButton();
    return _customerList;
  }

  void dispose() {
    _upActionStreamController.close();
    _downActionStreamController.close();
  }

  void _handleUp(Customer customer) {
    swap(customer, true);
    updateUpDownButton();
    _customerListSubject.add(_customerList);
    _messageSubject.add("${customer.name} move up");
  }

  void _handleDown(Customer customer) {
    swap(customer, false);
    updateUpDownButton();
    _customerListSubject.add(_customerList);
    _messageSubject.add("${customer.name} move down");
  }

  void swap(Customer customer, bool up) {
    int idx = _customerList.indexOf(customer);
    _customerList.remove(customer);
    _customerList.insert(up ? idx - 1 : idx + 1, customer);
  }

  void updateUpDownButton() {
    for (int idx = 0, lastIdx = _customerList.length - 1;
        idx < lastIdx;
        idx++) {
      Customer customer = _customerList[idx];
      customer.upButton = (idx > 0);
      customer.downButton = idx < lastIdx;
    }
  }

  Stream<List<Customer>> get customerListStream => _customerListSubject.stream;

  Stream<String> get messageStream => _messageSubject.stream;

  Sink<Customer> get upAction => _upActionStreamController.sink;

  Sink<Customer> get downAction => _downActionStreamController.sink;
}

class BlocProvider extends InheritedWidget {
  final Bloc bloc;

  BlocProvider({Key key, @required this.bloc, Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static Bloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider).bloc;
}

class CustomerWidget extends StatelessWidget {
  final Customer _customer;

  CustomerWidget(this._customer);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of(context);
    Text text = Text(_customer.name,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold));
    IconButton upbutton = IconButton(
        icon: Icon(
          Icons.arrow_drop_up,
          color: Colors.blue,
        ),
        onPressed: () {
          bloc.upAction.add(_customer);
        });
    IconButton downButton = IconButton(
        icon: Icon(Icons.arrow_drop_down, color: Colors.blue),
        onPressed: () {
          bloc.downAction.add(_customer);
        });

    List<Widget> children = [];
    children.add(Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 20.0),
        child: text,
      ),
    ));

    if (_customer.upButton) children.add(upbutton);
    if (_customer.downButton) children.add(downButton);
    return Padding(
      padding: EdgeInsets.all(6.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.cyan[80]),
          child: Row(
            children: children,
            mainAxisAlignment: MainAxisAlignment.start,
          ),
        ),
      ),
    );
  }
}

class CustomerAppWidget extends StatelessWidget {
  final Bloc _bloc = Bloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        bloc: _bloc,
        child: CustomerListWidget(
          title: 'flutter',
          messageStream: _bloc.messageStream,
        ),
      ),
    );
  }
}

class CustomerListWidget extends StatelessWidget {
  CustomerListWidget({Key key, this.title, Stream<String> this.messageStream})
      : super(key: key) {
    this.messageStream.listen((event) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(event),
        duration: Duration(seconds: 1),
      ));
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final String title;
  final Stream<String> messageStream;

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(title),
      ),
      body: StreamBuilder<List<Customer>>(
        stream: bloc.customerListStream,
        initialData: bloc.initCustomerList(),
        builder: (context, snapshot) {
          List<Widget> customerWidgets =
              snapshot.data.map((e) => CustomerWidget(e)).toList();
          return ListView(
            padding: const EdgeInsets.all(10.0),
            children: customerWidgets,
          );
        },
      ),
    );
  }
}
