import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            TheGameView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("The Game")
                }
                .tag(0)
            
            ChatsView()
                .tabItem {
                    Image(systemName: "message.fill")
                    Text("Chats")
                }
                .tag(1)
            
            LikesYouView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Likes You")
                }
                .tag(2)
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(3)
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
                .tag(4)
        }
    }
}
