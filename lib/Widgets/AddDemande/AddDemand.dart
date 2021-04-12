import 'package:administration/Logics/Const.dart';
import 'package:administration/Logics/Controller.dart';
import 'package:administration/Logics/Data/Ville.dart';
import 'package:administration/Logics/FilterFunctions.dart';
import 'package:administration/Logics/TimesDateFunctions.dart';
import 'package:administration/Logics/User.dart';
import 'package:administration/Widgets/AddDemande/Botton.dart';
import 'package:administration/Widgets/AddDemande/MyTextField.dart';
import 'package:administration/Widgets/AddDemande/SwitchWidgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

TextEditingController _ctrlLocalite;
TextEditingController _ctrlDestination = TextEditingController();
TextEditingController _ctrlNumberSalon = TextEditingController();
TextEditingController _ctrlNumberProduit = TextEditingController();
TextEditingController _ctrlTotalPoids = TextEditingController();

Controller _controller = Get.put(Controller());

class AddDemand extends StatelessWidget {
  const AddDemand({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => Container(
            width: 500,
            height: MediaQuery.of(context).size.height - 100,
            child: Card(
              elevation: 20,
              child: Padding(
                padding: const EdgeInsets.all(60.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: DropdownButton<String>(
                            items: actionDemande.map((String value) {
                              return new DropdownMenuItem<String>(
                                child: Text(value),
                                value: value,
                              );
                            }).toList(),
                            isDense: true,
                            hint: Text(
                              _controller.addCategorie.value,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            onChanged: (value) {
                              _controller.addCategorie.value = value;
                              print(_controller.addCategorie.value);
                            },
                          ),
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(selectCategorieImage(
                              _controller.addCategorie.value)),
                        )
                      ],
                    ),
                    AutoCompleteTextField(
                      controller: _ctrlLocalite,
                      itemSubmitted: (item) {
                        _ctrlLocalite.text = item;
                      },
                      key: null,
                      clearOnSubmit: false,
                      decoration: InputDecoration(
                        labelText: "Localité",
                      ),
                      suggestions: ville,
                      itemBuilder: (context, item) => Container(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Text(item),
                          ],
                        ),
                      ),
                      itemSorter: (a, b) => a.compareTo(b),
                      itemFilter: (item, query) =>
                          item.toLowerCase().startsWith(query.toLowerCase()),
                    ),
                    AutoCompleteTextField(
                      controller: _ctrlDestination,
                      itemSubmitted: (item) {
                        _ctrlDestination.text = item;
                      },
                      key: null,
                      clearOnSubmit: false,
                      decoration: InputDecoration(labelText: "Destination"),
                      suggestions: ville,
                      itemBuilder: (context, item) => Container(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Text(item),
                          ],
                        ),
                      ),
                      itemSorter: (a, b) => a.compareTo(b),
                      itemFilter: (item, query) =>
                          item.toLowerCase().startsWith(query.toLowerCase()),
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Date des le"),
                        Text(convertPickedToString(
                            _controller.addDateDesLe.value)),
                        IconButton(
                          icon: Icon(Icons.date_range),
                          onPressed: () {
                            selectDate(context);
                          },
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Date Jusqu'a"),
                        Text(convertPickedToString(
                            _controller.addDateJusqua.value)),
                        IconButton(
                          icon: Icon(Icons.date_range),
                          onPressed: () {
                            selectDate(context, isJusqua: true);
                          },
                        )
                      ],
                    ),
                    Divider(),
                    DropdownButton<dynamic>(
                      items: _controller.myList.map((dynamic value) {
                        return new DropdownMenuItem<dynamic>(
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(value.photoUrl),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(value.name),
                                  Text(value.email),
                                ],
                              ),
                            ],
                          ),
                          value: value,
                        );
                      }).toList(),
                      isDense: true,
                      hint: Row(
                        children: [
                          Text(
                            _controller.addUserName.value,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          _controller.addUserEmail.value.isEmpty
                              ? Text("")
                              : Text("(${_controller.addUserEmail.value})")
                        ],
                      ),
                      onChanged: (value) {
                        _controller.addUserID.value = value.id;
                        _controller.addUserName.value = value.name;
                        _controller.addUserEmail.value = value.email;
                        print(_controller.addUserID.value);
                      },
                    ),
                    Divider(),
                    MySwitcher(
                        title: "Chargement-Déchargement",
                        color: Colors.blue,
                        controller: _controller.addSwitchChargeDecharge),
                    MySwitcher(
                        title: "Montage-Démontage",
                        color: Colors.blue,
                        controller: _controller.addSwitchMontageDemantage),
                    MySwitcher(
                        title: "Besoin d'emballage",
                        color: Colors.blue,
                        controller: _controller.addSwitchBesoinEmballage),
                    MySwitcher(
                        title: "Demand de facture",
                        color: Colors.blue,
                        controller: _controller.addSwitchFacture),
                    Divider(),
                    MyTextFields(
                        title: "Nomber de salons",
                        controller: _ctrlNumberSalon),
                    MyTextFields(
                        title: "Nomber de produits",
                        controller: _ctrlNumberProduit),
                    MyTextFields(
                      title: "Poids total",
                      controller: _ctrlTotalPoids,
                      suffix: "Kg",
                    ),
                    SizedBox(height: 30),
                    MyAddBotton()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}