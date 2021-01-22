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
      (other is Customer) && (_firstName == other._firstName) &&
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

  List<Customer> initCustomerList(){
    _customerList = [
      Customer("Fred","Smith"),
      Customer("Brian","Johnson"),
      Customer("James","McGirl"),
      Customer("John","Brown")
    ];
    updateUpDownButton();
    return _customerList;
  }

  void dispose(){
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
    for (int idx = 0, lastIdx = _customerList.length - 1; idx <
        lastIdx; idx++) {
      Customer customer = _customerList[idx];
      customer.upButton = (idx > 0);
      customer.downButton = idx < lastIdx;
    }
  }

  Stream<List<Customer>> get customerListStream => _customerListSubject.stream;
}