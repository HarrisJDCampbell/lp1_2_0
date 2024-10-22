import SwiftUI

struct Chat: Identifiable {
    let id = UUID()
    let name: String
    let lastMessage: String
    let imageURL: String
    var isQueued: Bool
}

struct ChatsView: View {
    @State private var chats: [Chat] = [
        Chat(name: "Sarah & Mike", lastMessage: "Hey, are you free this weekend?", imageURL: "https://example.com/sarah_mike.jpg", isQueued: false),
        Chat(name: "Emma & John", lastMessage: "Let's plan that double date!", imageURL: "https://example.com/emma_john.jpg", isQueued: true),
    ]
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Unqueued Duos")) {
                    ForEach(chats.filter { !$0.isQueued }) { chat in
                        NavigationLink(destination: ChatDetailView(chat: chat)) {
                            ChatRow(chat: chat)
                        }
                    }
                }
                
                Section(header: Text("Queued Duos")) {
                    ForEach(chats.filter { $0.isQueued }) { chat in
                        NavigationLink(destination: ChatDetailView(chat: chat)) {
                            ChatRow(chat: chat)
                        }
                    }
                }
            }
            .navigationTitle("Chats")
        }
    }
}

struct ChatRow: View {
    let chat: Chat
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: chat.imageURL)) { image in
                image.resizable().aspectRatio(contentMode: .fill)
            } placeholder: {
                Color.gray
            }
            .frame(width: 50, height: 50)
            .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(chat.name).font(.headline)
                Text(chat.lastMessage).font(.subheadline).foregroundColor(.gray)
            }
        }
    }
}

struct ChatDetailView: View {
    let chat: Chat
    @State private var message = ""
    @State private var showingGroupChat = false
    
    var body: some View {
        VStack {
            HStack {
                Button("Duo Chat") {
                    showingGroupChat = false
                }
                .padding()
                .background(showingGroupChat ? Color.gray.opacity(0.2) : Color.blue)
                .foregroundColor(showingGroupChat ? .black : .white)
                .cornerRadius(8)
                
                Button("Group Chat") {
                    showingGroupChat = true
                }
                .padding()
                .background(showingGroupChat ? Color.blue : Color.gray.opacity(0.2))
                .foregroundColor(showingGroupChat ? .white : .black)
                .cornerRadius(8)
            }
            .padding()
            
            if showingGroupChat {
                GroupChatView(chat: chat)
            } else {
                DuoChatView(chat: chat)
            }
        }
        .navigationTitle(chat.name)
    }
}

struct GroupChatView: View {
    let chat: Chat
    @State private var message = ""
    
    var body: some View {
        VStack {
            Text("Group Chat")
                .font(.title)
            
            // Add group chat messages here
            
            Spacer()
            
            HStack {
                TextField("Type a message", text: $message)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: sendMessage) {
                    Text("Send")
                }
            }
            .padding()
        }
    }
    
    func sendMessage() {
        // Implement send message functionality
        message = ""
    }
}

struct DuoChatView: View {
    let chat: Chat
    @State private var message = ""
    
    var body: some View {
        VStack {
            Text("Duo Chat")
                .font(.title)
            
            // Add duo chat messages here
            
            Spacer()
            
            HStack {
                TextField("Type a message", text: $message)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: sendMessage) {
                    Text("Send")
                }
            }
            .padding()
        }
    }
    
    func sendMessage() {
        // Implement send message functionality
        message = ""
    }
}
