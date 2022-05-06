import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';


class home extends StatefulWidget {
  const home({ Key? key }) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List<Message> messages = [
    Message(
      text: "Hello, How can I help? Please pick a number either 1, 2, 3 or 4\n\n" +
            "1) You are worried about something\n" +
            "2) Explore a thought you have been having\n" +
            "3) You want to evaluate different perspectives of a situation\n" +
            "4) You want to weigh the costs and benefits of a thought/behaviour",
      date: DateTime.now().subtract(Duration(minutes: 1)), 
      isSentByMe: false
    ),
  ];

  int response_counter = 0;
  bool worksheet1 = false; //Worry exploration
  bool worksheet2 = false; //Cognitive restructuring
  bool worksheet3 = false; //Cognitive model example sheet
  bool worksheet4 = false; //Cost and benefits

  @override
  Widget build(BuildContext context) {
    TextEditingController msgController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade800,
        title: const Text("Chatbot"),
      ),

      body: Column(
        children: [
          Expanded(child: Container(
            child: GroupedListView<Message, DateTime>(
              reverse: true,
              order: GroupedListOrder.DESC,
              useStickyGroupSeparators: true,
              floatingHeader: true,
              padding: const EdgeInsets.all(8),
              elements: messages,
              groupBy: (message) => DateTime(
                message.date.year,
                message.date.month,
                message.date.day
              ),
              
              groupHeaderBuilder: (Message message) => SizedBox(
                height: 40,
                child: Center(
                  child: Card(
                    color: Colors.green.shade500,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        DateFormat.yMMMd().format(message.date),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              itemBuilder: (context, Message message) => Align(
                alignment: message.isSentByMe
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
                child: Card(
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(message.text),
                  ),
                ),
              ),
            ),
          )),
          Container(
            color: Colors.grey.shade300,
            child: TextField(
              controller: msgController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(12),
                hintText: 'Type your message here...'
              ),
              onSubmitted: (text) {
                final message = Message(
                  text: text,
                  date: DateTime.now(),
                  isSentByMe: true,
                );

                setState(() => messages.add(message));
                debugPrint(" counter is at $response_counter");
                debugPrint(message.text);

//===================default reply========================
                if (message.text.isEmpty){
                  debugPrint("empty is true");
                  final message_default = Message(
                    text: "I did not quite understand that. Please try again.", 
                    date: DateTime.now(), 
                    isSentByMe: false
                  );
                  setState(() => messages.add(message_default));
                }

//===================worksheet 1 (Worry exploration)====================

                else if (message.text == "1" && response_counter == 0){
                  final message_two = Message(
                    text: "What is something you are worried about?", 
                    date: DateTime.now(), 
                    isSentByMe: false
                  );
                  setState(() => messages.add(message_two));
                  response_counter = response_counter + 1;
                  worksheet1 = true;
                }

                else if (response_counter == 1 && worksheet1 == true){
                  final message_three = Message(
                    text: "what are some clues that your worry will not come true?", 
                    date: DateTime.now(), 
                    isSentByMe: false
                  );
                  setState(() => messages.add(message_three));
                  response_counter = response_counter + 1;
                }

                else if (response_counter == 2 && worksheet1 == true){
                  final message_four = Message(
                    text: "If your worry does not come true, what will probably happen instead?", 
                    date: DateTime.now(), 
                    isSentByMe: false
                  );
                  setState(() => messages.add(message_four));
                  response_counter = response_counter + 1;
                }

                else if (response_counter == 3 && worksheet1 == true){
                  final message_five = Message(
                    text: "After answer these questions, Has your worry changed?", 
                    date: DateTime.now(), 
                    isSentByMe: false
                  );
                  setState(() => messages.add(message_five));
                  response_counter = response_counter + 1;
                }

                else if (response_counter == 4 && worksheet1 == true){
                  final message_reset = Message(
                    text: "Is there anything else I can assist you with? Please pick a number between 1 and 4\n\n" +
                          "1) You are worried about something\n" +
                          "2) Explore a thought you have been having\n" +
                          "3) You want to evaluate different perspectives of a situation\n" +
                          "4) You want to weigh the costs and benefits of a thought/behaviour", 
                    date: DateTime.now(), 
                    isSentByMe: false
                  );
                  setState(() => messages.add(message_reset));
                  response_counter = 0;
                  worksheet1 = false;

                }

//===============worksheet 2 (Cognitive restructuring)==================

                else if (message.text == "2" && response_counter == 0){
                  final message_six = Message(
                    text: "What are you thinking about?", 
                    date: DateTime.now(), 
                    isSentByMe: false
                  );
                  setState(() => messages.add(message_six));
                  response_counter = response_counter + 1;
                  worksheet2 = true;
                }

                else if (response_counter == 1 && worksheet2 == true){
                  final message_seven = Message(
                    text: "What is the evidence for this thought?", 
                    date: DateTime.now(), 
                    isSentByMe: false
                  );
                  setState(() => messages.add(message_seven));
                  response_counter = response_counter + 1;
                }

                else if (response_counter == 2 && worksheet2 == true){
                  final message_eight = Message(
                    text: "What is the evidence against this thought?", 
                    date: DateTime.now(), 
                    isSentByMe: false
                  );
                  setState(() => messages.add(message_eight));
                  response_counter = response_counter + 1;
                }

                else if (response_counter == 3 && worksheet2 == true){
                  final message_nine = Message(
                    text: "Are you basing this thought on facts or feelings?", 
                    date: DateTime.now(), 
                    isSentByMe: false
                  );
                  setState(() => messages.add(message_nine));
                  response_counter = response_counter + 1;
                }

                else if (response_counter == 4 && worksheet2 == true){
                  final message_ten = Message(
                    text: "Is this thought black and white, when reality is more complicated?", 
                    date: DateTime.now(), 
                    isSentByMe: false
                  );
                  setState(() => messages.add(message_ten));
                  response_counter = response_counter + 1;
                }

                else if (response_counter == 5 && worksheet2 == true){
                  final message_eleven = Message(
                    text: "Could you be misinterpreting the evidence? What are the assumptions?", 
                    date: DateTime.now(), 
                    isSentByMe: false
                  );
                  setState(() => messages.add(message_eleven));
                  response_counter = response_counter + 1;
                }

                else if (response_counter == 6 && worksheet2 == true){
                  final message_reset2 = Message(
                    text: "Is there anything else I can assist you with? Please pick a number between 1 and 4\n\n" +
                          "1) You are worried about something\n" +
                          "2) Explore a thought you have been having\n" +
                          "3) You want to evaluate different perspectives of a situation\n" +
                          "4) You want to weigh the costs and benefits of a thought/behaviour", 
                    date: DateTime.now(), 
                    isSentByMe: false
                  );
                  setState(() => messages.add(message_reset2));
                  response_counter = 0;
                  worksheet2 = false;

                }

//=====================Cognitive Model=========================
                else if (message.text == "3" && response_counter == 0){
                  final message_twelve = Message(
                    text: "Describe the situation", 
                    date: DateTime.now(), 
                    isSentByMe: false
                  );
                  setState(() => messages.add(message_twelve));
                  response_counter = response_counter + 1;
                  worksheet3 = true;
                }

                else if (response_counter == 1 && worksheet3 == true){
                  final message_thirteen = Message(
                    text: "What are the thoughts that were derived from this situation?", 
                    date: DateTime.now(), 
                    isSentByMe: false
                  );
                  setState(() => messages.add(message_thirteen));
                  response_counter = response_counter + 1;
                }

                else if (response_counter == 2 && worksheet3 == true){
                  final message_fourteen = Message(
                    text: "How did this situation make you feel?", 
                    date: DateTime.now(), 
                    isSentByMe: false
                  );
                  setState(() => messages.add(message_fourteen));
                  response_counter = response_counter + 1;
                }

                else if (response_counter == 3 && worksheet3 == true){
                  final message_fifteen = Message(
                    text: "What was your response to the situation as a result of the thought?", 
                    date: DateTime.now(), 
                    isSentByMe: false
                  );
                  setState(() => messages.add(message_fifteen));
                  response_counter = response_counter + 1;
                }

                else if (response_counter == 4 && worksheet3 == true){
                  final message_sixteen = Message(
                    text: "Describe an alternate thought to the situation considering the other persons point of view", 
                    date: DateTime.now(), 
                    isSentByMe: false
                  );
                  setState(() => messages.add(message_sixteen));
                  response_counter = response_counter + 1;
                }

                else if (response_counter == 5 && worksheet3 == true){
                  final message_seventeen = Message(
                    text: "If you thought of it this way, how would the situation make you feel?", 
                    date: DateTime.now(), 
                    isSentByMe: false
                  );
                  setState(() => messages.add(message_seventeen));
                  response_counter = response_counter + 1;
                }

                else if (response_counter == 6 && worksheet3 == true){
                  final message_eighteen = Message(
                    text: "Thinking of the situation this way, how would you respond to the situation?", 
                    date: DateTime.now(), 
                    isSentByMe: false
                  );
                  setState(() => messages.add(message_eighteen));
                  response_counter = response_counter + 1;
                }

                else if (response_counter == 7 && worksheet3 == true){
                  final message_reset3 = Message(
                    text: "Is there anything else I can assist you with? Please pick a number between 1 and 4\n\n" +
                          "1) You are worried about something\n" +
                          "2) Explore a thought you have been having\n" +
                          "3) You want to evaluate different perspectives of a situation\n" +
                          "4) You want to weigh the costs and benefits of a thought/behaviour", 
                    date: DateTime.now(), 
                    isSentByMe: false
                  );
                  setState(() => messages.add(message_reset3));
                  response_counter = 0;
                  worksheet3 = false;
                }

//=================Cost benefit analysis=======================

                else if (message.text == "4" && response_counter == 0){
                  final message_nineteen = Message(
                    text: "What is a though or behaviour you might want to change?", 
                    date: DateTime.now(), 
                    isSentByMe: false
                  );
                  setState(() => messages.add(message_nineteen));
                  response_counter = response_counter + 1;
                  worksheet4 = true;
                }

                else if (response_counter == 1 && worksheet4 == true){
                  final message_twenty = Message(
                    text: "List the costs of the thought or behaviour", 
                    date: DateTime.now(), 
                    isSentByMe: false
                  );
                  setState(() => messages.add(message_twenty));
                  response_counter = response_counter + 1;
                }

                else if (response_counter == 2 && worksheet4 == true){
                  final message_twentyone = Message(
                    text: "What are the benefits of the thought or behaviour?", 
                    date: DateTime.now(), 
                    isSentByMe: false
                  );
                  setState(() => messages.add(message_twentyone));
                  response_counter = response_counter + 1;
                }

                else if (response_counter == 3 && worksheet4 == true){
                  final message_twentytwo = Message(
                    text: "After reviewing the costs and benefits of the current thought or behaviour, develop a more adaptive alternative", 
                    date: DateTime.now(), 
                    isSentByMe: false
                  );
                  setState(() => messages.add(message_twentytwo));
                  response_counter = response_counter + 1;
                }

                else if (response_counter == 4 && worksheet4 == true){
                  final message_reset4 = Message(
                    text: "Is there anything else I can assist you with? Please pick a number between 1 and 4\n\n" +
                          "1) You are worried about something\n" +
                          "2) Explore a thought you have been having\n" +
                          "3) You want to evaluate different perspectives of a situation\n" +
                          "4) You want to weigh the costs and benefits of a thought/behaviour", 
                    date: DateTime.now(), 
                    isSentByMe: false
                  );
                  setState(() => messages.add(message_reset4));
                  response_counter = 0;
                  worksheet4 = false;
                }

                msgController.clear();
              },
            ),
          )
        ]
      ),
      
    );
  }
}

class Message {
  final String text;
  final DateTime date;
  final bool isSentByMe;

  const Message({
    required this.text,
    required this.date,
    required this.isSentByMe
  });
}
