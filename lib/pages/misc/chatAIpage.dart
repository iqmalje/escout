import 'dart:async';

import 'package:escout/model/chat.dart';
import 'package:flutter/material.dart';

class ChatAIPage extends StatefulWidget {
  const ChatAIPage({super.key});

  @override
  State<ChatAIPage> createState() => _ChatAIPageState();
}

class _chatContent {
  String title;
  List<String> questions;
  List<void Function()> onPresseds;
  String? answer;
  bool isBotSend;
  _chatContent(
      {required this.title,
      required this.questions,
      required this.onPresseds,
      required this.isBotSend,
      this.answer});
}

class _ChatAIPageState extends State<ChatAIPage> {
  TextEditingController chatController = TextEditingController();
  List<_chatContent> chatContent = [];
  ChatSystem cs = ChatSystem();
  List<String> answers = [];
  @override
  void initState() {
    super.initState();

    initChatBot();
  }

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
        body: Column(
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
                            return Builder(builder: (context) {
                              _chatContent cc = chatContent.elementAt(index);
                              return Builder(builder: (context) {
                                if (cc.questions.isEmpty &&
                                    cc.isBotSend == true) {
                                  print("DAH LA");
                                  return buildAnswer(cc.answer!);
                                } // only for answers {
                                if (cc.isBotSend == false) {
                                  return buildOwnParty(cc.title);
                                }
                                return buildQuestions(
                                    cc.title, cc.questions, cc.onPresseds);
                              });
                            });
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
                      onPressed: () async {}, icon: const Icon(Icons.send))
                ],
              ),
            )
          ],
        ));
  }

  Widget buildQuestions(
      String title, List<String> questions, List<void Function()> onPresseds) {
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
              child: Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  ListView.builder(
                      itemCount: questions.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.white,
                                side: const BorderSide(
                                    color: Colors.white, width: 1.5)),
                            onPressed: onPresseds[index],
                            child: Text(
                              questions.elementAt(index),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ));
                      })
                ],
              ),
            )),
      ),
    );
  }

  Widget buildAnswer(String content) {
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

  void initChatBot() {
    setState(() {
      chatContent.insert(
          0,
          _chatContent(
              title: cs.greet(),
              questions: cs.questions,
              onPresseds: [
                () {
                  setState(() {
                    chatContent.insert(
                        0,
                        _chatContent(
                            title: "About Feeds",
                            questions: [],
                            onPresseds: [],
                            isBotSend: false));
                    chatContent.insert(
                        0,
                        _chatContent(
                            title: FeedGuideChat().greet(),
                            questions: FeedGuideChat().questions,
                            onPresseds: [
                              () {
                                setState(() {
                                  chatContent.insert(
                                      0,
                                      _chatContent(
                                          title: "What is Feeds?",
                                          questions: [],
                                          onPresseds: [],
                                          isBotSend: false));
                                  chatContent.insert(
                                      0,
                                      _chatContent(
                                          title: 'This might help,',
                                          questions: [],
                                          onPresseds: [],
                                          answer:
                                              "Feeds is where the activities posted by the official Scout team, where scouts can see or join!",
                                          isBotSend: true));
                                });
                              },
                              () {
                                setState(() {
                                  chatContent.insert(
                                      0,
                                      _chatContent(
                                          title:
                                              "How do I see the details of a feed?",
                                          questions: [],
                                          onPresseds: [],
                                          isBotSend: false));
                                  chatContent.insert(
                                      0,
                                      _chatContent(
                                          title: 'This might help,',
                                          questions: [],
                                          onPresseds: [],
                                          answer:
                                              "You can do so by tapping on a feed that has been posted and is visible on your homepage",
                                          isBotSend: true));
                                });
                              },
                            ],
                            isBotSend: true));
                  });
                },
                () {
                  setState(() {
                    chatContent.insert(
                        0,
                        _chatContent(
                            title: "About Activities",
                            questions: [],
                            onPresseds: [],
                            isBotSend: false));
                    chatContent.insert(
                        0,
                        _chatContent(
                            title: ActivityGuideChat().init(),
                            questions: ActivityGuideChat().questions,
                            onPresseds: List.generate(
                                ActivityGuideChat().answers.length, (index) {
                              return () => setState(() {
                                    chatContent.insert(
                                        0,
                                        _chatContent(
                                            title: ActivityGuideChat()
                                                .questions[index],
                                            questions: [],
                                            onPresseds: [],
                                            isBotSend: false));
                                    chatContent.insert(
                                        0,
                                        _chatContent(
                                            title: 'a',
                                            questions: [],
                                            onPresseds: [],
                                            answer: ActivityGuideChat()
                                                .answers[index],
                                            isBotSend: true));
                                  });
                            }),
                            isBotSend: true));
                  });
                },
                () {
                  setState(() {
                    chatContent.insert(
                        0,
                        _chatContent(
                            title: "About Facilities",
                            questions: [],
                            onPresseds: [],
                            isBotSend: false));
                    chatContent.insert(
                        0,
                        _chatContent(
                            title: FacilityGuideChat().init(),
                            questions: FacilityGuideChat().questions,
                            onPresseds: List.generate(
                                FacilityGuideChat().answers.length, (index) {
                              return () => setState(() {
                                    chatContent.insert(
                                        0,
                                        _chatContent(
                                            title: FacilityGuideChat()
                                                .questions[index],
                                            questions: [],
                                            onPresseds: [],
                                            isBotSend: false));
                                    chatContent.insert(
                                        0,
                                        _chatContent(
                                            title: 'a',
                                            questions: [],
                                            onPresseds: [],
                                            answer: FacilityGuideChat()
                                                .answers[index],
                                            isBotSend: true));
                                  });
                            }),
                            isBotSend: true));
                  });
                },
                () {
                  setState(() {
                    chatContent.insert(
                        0,
                        _chatContent(
                            title: "About Profiles",
                            questions: [],
                            onPresseds: [],
                            isBotSend: false));
                    chatContent.insert(
                        0,
                        _chatContent(
                            title: ProfileGuideChat().init(),
                            questions: ProfileGuideChat().questions,
                            onPresseds: List.generate(
                                ProfileGuideChat().answers.length, (index) {
                              return () => setState(() {
                                    chatContent.insert(
                                        0,
                                        _chatContent(
                                            title: ProfileGuideChat()
                                                .questions[index],
                                            questions: [],
                                            onPresseds: [],
                                            isBotSend: false));
                                    chatContent.insert(
                                        0,
                                        _chatContent(
                                            title: 'a',
                                            questions: [],
                                            onPresseds: [],
                                            answer: ProfileGuideChat()
                                                .answers[index],
                                            isBotSend: true));
                                  });
                            }),
                            isBotSend: true));
                  });
                },
              ],
              isBotSend: true));
    });
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
