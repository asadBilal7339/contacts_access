import 'package:flutter/material.dart';
import 'main.dart';

class ContactsList extends StatelessWidget {
  final List<AppContact> contacts;
  final Function() reloadContacts;
  ContactsList({
    Key key,
    this.contacts,
    this.reloadContacts,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          AppContact contact = contacts[index];

          return ListTile(
            onTap: () {
              /// Contact Detail Page
              /*Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => ContactDetails(
                    contact,
                    onContactDelete: (AppContact _contact) {
                      reloadContacts();
                      Navigator.of(context).pop();
                    },
                    onContactUpdate: (AppContact _contact) {
                      reloadContacts();
                    },
                  ),
                ),
              );*/
            },
            title: Text(
              contact.info.displayName,
            ),
            subtitle: Text(
              contact.info.phones.length > 0
                  ? contact.info.phones.elementAt(0).value
                  : '',
            ),
            leading: ContactAvatar(
              contact,
              36,
            ),
          );
        },
      ),
    );
  }
}

///
class ContactAvatar extends StatelessWidget {
  ContactAvatar(this.contact, this.size);
  final AppContact contact;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            Colors.deepPurple,
            Colors.lightBlueAccent,
            Colors.black54,
            Colors.lightBlueAccent,
            Colors.deepPurple,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: (contact.info.avatar != null && contact.info.avatar.length > 0)
          ? CircleAvatar(
              backgroundImage: MemoryImage(
                contact.info.avatar,
              ),
            )
          : CircleAvatar(
              child: Text(
                contact.info.initials(),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.transparent,
            ),
    );
  }
}

///
