import 'package:escout/backend/backend.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String otherPartyID;
  const ChatPage({super.key, required this.otherPartyID});

  @override
  State<ChatPage> createState() => _ChatPageState(otherPartyID);
}

class _ChatPageState extends State<ChatPage> {
  final String otherPartyID;
  final _stream = SupabaseB()
      .supabase
      .from('chats')
      .stream(primaryKey: ['id']).order('sent_at', ascending: false);
  final currentuserID = SupabaseB().supabase.auth.currentUser!.id;

  TextEditingController chatController = TextEditingController();
  List<dynamic> chatContent = [];
  _ChatPageState(this.otherPartyID);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Container(
          //blue box container
          width: MediaQuery.sizeOf(context).width,
          height: 90,
          decoration: const BoxDecoration(color: Color(0xFF2E3B78)),
          child: const Center(
            child: Text(
              'Chat',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
      body: StreamBuilder<List<dynamic>>(
          stream: _stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }
            //parse stream
            print(snapshot.data);

            chatContent.clear();

            for (var element in snapshot.data!) {
              if ((element['party1'] == currentuserID ||
                      element['party2'] == currentuserID) &&
                  (element['party1'] == otherPartyID ||
                      element['party2'] == otherPartyID)) {
                chatContent.add(element);
              }
            }

            return Column(
              children: [
                //chat content
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: ListView.builder(
                              itemCount: chatContent.length,
                              shrinkWrap: true,
                              reverse: true,
                              itemBuilder: (context, index) {
                                if (chatContent.elementAt(index)['sent_by'] ==
                                    currentuserID) {
                                  return buildOwnParty(
                                      chatContent.elementAt(index)['content']);
                                } else
                                  return buildOtherParty(
                                      chatContent.elementAt(index)['content']);
                              }),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //textfield
                Container(
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 220, 220, 220),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        child: TextField(
                          controller: chatController,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                          maxLines: 1,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.only(top: 1, left: 10),
                              hintStyle: TextStyle(
                                color: Color.fromARGB(255, 183, 183, 183),
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                              border: InputBorder.none,
                              hintText: 'Send a message'),
                        ),
                      ),
                      IconButton(
                          onPressed: () async {
                            await SupabaseB().addNewChat(otherPartyID,
                                currentuserID, chatController.text);

                            setState(() {
                              chatController.clear();
                            });
                          },
                          icon: const Icon(Icons.send))
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }

  Widget buildOtherParty(String content) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          constraints: const BoxConstraints(
            minHeight: 40,
            minWidth: 0,
            maxWidth: 300,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            color: Color.fromARGB(255, 106, 82, 215),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              content,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildOwnParty(String content) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Container(
          constraints: const BoxConstraints(
            minHeight: 40,
            minWidth: 0,
            maxWidth: 300,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10)),
            color: Color.fromARGB(255, 210, 210, 210),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              content,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
