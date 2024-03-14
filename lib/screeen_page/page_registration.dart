// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart';

class PageRegistration extends StatefulWidget {
  const PageRegistration({super.key});

  @override
  State<PageRegistration> createState() => _PageRegistrationState();
}

class _PageRegistrationState extends State<PageRegistration> {
  TextEditingController txtFullname = TextEditingController();
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPass = TextEditingController();
  TextEditingController txtTglLahir = TextEditingController();
  String? valAgama, valJk;
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  Future selectDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2100));
    if (pickedDate != null) {
      setState(() {
        txtTglLahir.text = DateFormat("dd-MM-YYYY").format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Register Form"),
      ),
      body: Form(
        key: keyForm,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: txtFullname,
                  validator: (val) {
                    return val!.isEmpty ? "Tidak boleh kosong" : null;
                  },
                  decoration: InputDecoration(
                      hintText: "Full Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: txtUsername,
                  validator: (val) {
                    return val!.isEmpty ? "Tidak boleh kosong" : null;
                  },
                  decoration: InputDecoration(
                      hintText: "UserName",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: txtEmail,
                  validator: (val) {
                    return val!.isEmpty ? "Tidak boleh kosong" : null;
                  },
                  decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: txtPass,
                  validator: (val) {
                    return val!.isEmpty ? "Tidak boleh kosong" : null;
                  },
                  decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  onTap: () {
                    selectDate();
                  },
                  validator: (val) {
                    return val!.isEmpty ? "Tidak boleh kosong" : null;
                  },
                  controller: txtTglLahir,
                  decoration: InputDecoration(
                      hintText: "Tanggal Lahir",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 65,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black54),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton(
                      value: valAgama,
                      underline: Container(),
                      isExpanded: true,
                      hint: const Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text("Pilih Agama"),
                      ),
                      items: ["islam", "budha", "kristem"].map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(e),
                          ),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          valAgama = val;
                          print('agama yang dipilih $val');
                        });
                      }),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                        child: RadioListTile(
                      value: "laki-laki",
                      groupValue: valJk,
                      onChanged: (val) {
                        valJk = val;
                      },
                      activeColor: Colors.green,
                      title: const Text("laki-laki"),
                    )),
                    Flexible(
                        child: RadioListTile(
                      value: "Wanita",
                      groupValue: valJk,
                      onChanged: (val) {
                        valJk = val;
                      },
                      activeColor: Colors.green,
                      title: const Text("Wanita"),
                    ))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  onPressed: () {
                    if (keyForm.currentState?.validate() == true) {
                      if (valJk != null && valAgama != null) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Data Registrasi"),
                                content: Column(
                                  children: [
                                    Text(
                                        "Full name Anda :  ${txtFullname.text}"),
                                    Text(
                                        "Username Anda :  ${txtUsername.text}"),
                                    Text("Email Anda :  ${txtEmail.text}"),
                                    Text(
                                        "Jenis Kelamin name Anda :  ${txtFullname.text}"),
                                    Text(
                                        "Full name Anda :  ${txtFullname.text}"),
                                    Text(
                                        "Full name Anda :  ${txtFullname.text}"),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("ok"),
                                  )
                                ],
                              );
                            });
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("silahkan isi data terlebih dahulu")));
                    }
                  },
                  color: Colors.green,
                  textColor: Colors.white,
                  height: 45,
                  child: const Text("simpan"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
