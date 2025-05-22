const functions = require('firebase-functions');
const admin = require('firebase-admin');

admin.initializeApp();

exports.sendChatNotification = functions.firestore
  .document('chats/{chatId}/messages/{messageId}')
  .onCreate(async (snap, context) => {
    const message = snap.data();
    const chatId = context.params.chatId;

    // Get participants of the chat
    const chatDoc = await admin.firestore().doc(`chats/${chatId}`).get();
    const chatData = chatDoc.data();

    if (!chatData || !chatData.participants) {
      console.error('Missing participants in chat document');
      return;
    }

    const participants = chatData.participants;
    const senderId = message.senderId;
    const recipientId = participants.find(id => id !== senderId);

    if (!recipientId) {
      console.error('No recipient found');
      return;
    }

    // Get recipient FCM token
    const userDoc = await admin.firestore().doc(`users/${recipientId}`).get();
    const userData = userDoc.data();
    const fcmToken = userData && userData.fcmToken;

    if (fcmToken) {
      await admin.messaging().send({
        token: fcmToken,
        notification: {
          title: 'New Message',
          body: message.text,
        },
        data: {
          chatId,
          senderId,
        },
      });
    } else {
      console.warn(`No FCM token found for user ${recipientId}`);
    }
  });
