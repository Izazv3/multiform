import 'package:flutter/material.dart';
import 'package:flutter_multipage_form/user.dart';

typedef OnDelete();

class UserForm extends StatefulWidget {
  final User? user;
  final state = _UserFormState();
  final OnDelete? onDelete;

  UserForm({Key? key, this.user, this.onDelete}) : super(key: key);
  @override
  _UserFormState createState() => state;

  bool isValid() => state.validate();
}

class _UserFormState extends State<UserForm> {
  final form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: Material(
        elevation: 1,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(8),
        child: Form(
          key: form,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                child: Row(
                  children: [
                    Flexible(
                      flex: 7,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                        ),
                        child: TextFormField(
                          initialValue: widget.user!.fullName,
                          onSaved: (val) => widget.user!.fullName = val!,
                          validator: (val) =>
                              val!.length > 3 ? null : 'enter expense category',
                          decoration: InputDecoration(
                            labelText: 'Category',
                            hintText: 'Expence category',
                            icon: Icon(Icons.category),
                            isDense: true,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 7,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                        ),
                        child: TextFormField(
                          initialValue: widget.user!.email,
                          onSaved: (val) => widget.user!.email = val!,
                          validator: (val) =>
                              val!.length > 3 ? null : 'enter expence',
                          decoration: InputDecoration(
                            labelText: 'Expence',
                            hintText: 'Expence (monthly)',
                            icon: Icon(Icons.currency_rupee_outlined),
                            isDense: true,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: widget.onDelete,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///form validator
  bool validate() {
    var valid = form.currentState!.validate();
    if (valid) form.currentState!.save();
    return valid;
  }
}
