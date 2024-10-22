import SwiftUI

struct LikesYouView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State private var likes: [CoupleProfile] = [
        CoupleProfile(names: "Emma & John", ages: "26 & 28", location: "Los Angeles, CA", bio: "Beach lovers and foodies!", prompt: "Our favorite weekend activity:", promptAnswer: "Surfing and trying new brunch spots", imageURLs: ["https://example.com/emma_john_1.jpg", "https://example.com/emma_john_2.jpg", "https://example.com/emma_john_3.jpg"], interests: ["Beach", "Food", "Surfing"], occupation: "Teacher & Software Engineer"),
        // Add more sample likes here
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(likes) { profile in
                        NavigationLink(destination: ProfileDetailView(profile: profile)) {
                            LikeCard(profile: profile)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Likes You")
        }
    }
}

struct LikeCard: View {
    let profile: CoupleProfile
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: profile.imageURLs[0])) { image in
                image.resizable().aspectRatio(contentMode: .fill)
            } placeholder: {
                Color.gray
            }
            .frame(height: 150)
            .clipped()
            
            Text(profile.names)
                .font(.headline)
                .lineLimit(1)
            
            Text(profile.ages)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .frame(height: 200)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct ProfileDetailView: View {
    let profile: CoupleProfile
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                TabView {
                    ForEach(profile.imageURLs, id: \.self) { url in
                        AsyncImage(url: URL(string: url)) { image in
                            image.resizable().aspectRatio(contentMode: .fill)
                        } placeholder: {
                            Color.gray
                        }
                    }
                }
                .tabViewStyle(.page)
                .frame(height: 300)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("\(profile.names), \(profile.ages)")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text(profile.location)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Text(profile.bio)
                        .font(.body)
                    
                    Text(profile.prompt)
                        .font(.headline)
                        .padding(.top)
                    
                    Text(profile.promptAnswer)
                        .font(.body)
                }
                .padding()
            }
        }
        .navigationTitle("Profile")
    }
}
