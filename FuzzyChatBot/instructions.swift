//
//  instructions.swift
//  Fuzzy Test
//
//  Created by Ian Hall on 12/7/20.
//

//  Chat Interface Test
//  Simple chat interface test for iOS engineering roles
//
//  Instructions
//  Below, you'll see a dictionary of chats, some sent, some received. Your task is to create a simple chat interface to display these chats. You do not need to implement any user input.

let chatData = [
        [
            "type": "received",
            "message": "Lets get you all set up 😎"
        ],
        [
            "type": "received",
            "message": "I'll need a little info."
        ],
        [
            "type": "received",
            "message": "Who am I speaking with?"
        ],
        [
            "type": "sent",
            "message": "Hi, I'm [NAME]"
        ],
        [
            "type": "received",
            "message": "Hi, [NAME] 👋"
        ],
        [
            "type": "recieved",
            "message": "What can I help you with?"
        ],
        [
            "type": "sent",
            "message": "I'd like to chat with a vet"
        ],
        [
            "type": "received",
            "message": "Ok! Let's get you set up to chat with our team."
        ],
        [
            "type": "received",
            "message": "To start, how many pets do you have?"
        ],
        [
            "type": "sent",
            "message": "I have 2 pets"
        ],
        [
            "type": "received",
            "message": "Nice! What are your pet's names?"
        ],
        [
            "type": "sent",
            "message": "My pet's names are Wyatt and Pippin"
        ],
        [
            "type": "received",
            "message": "Aww I love it! 😍"
        ],
        [
            "type": "received",
            "message": "We're all done here! 👏"
        ],
        [
            "type": "received",
            "message": "Let's get you chatting with a Fuzzy vet 👩‍⚕️."
        ]
    ]

//  You need to implement a timer that will display each message in the order it came in (descending order of the dictionary) with a 1.5 second gap between each message.

//  You can use the sent and received cell files in the Cells folder. Please create simple prototype cells using the suzy image from Assets for the received cell and the user image for the sent cell.

//  See the reference image (chatbot.jpg) for an example of how it should look.

//  Important Note

//  The chat messages must start at the bottom of the screen and move upwards. See chatbot.mp4. You do not need to replicate the chatbot exactly, but you do need to ensure the messages start at the bottom and fill the screen upwards as shown in chatbot.mp4.
//
//  Bonus

//  Bonus points: display "Suzy is typing..." message during the 1.5 second delay between receiving messages and or implement a method to replace [NAME] with your name as chats are inserted.
