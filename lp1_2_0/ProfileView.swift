import SwiftUI

struct ProfileView: View {
    @State private var name = ""
    @State private var partnerName = ""
    @State private var age = ""
    @State private var partnerAge = ""
    @State private var location = ""
    @State private var interests = ""
    @State private var school = ""
    @State private var height = ""
    @State private var alcohol = ""
    @State private var drugs = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Profile Photos")) {
                    HStack {
                        ForEach(0..<4) { _ in
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(width: 80, height: 80)
                                Image(systemName: "photo")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .frame(height: 100)
                    Text("Tap to add photos")
                        .foregroundColor(.gray)
                        .italic()
                    // TODO: Implement photo picker to allow users to select and upload profile photos
                }
                
                Section(header: Text("Basic Information")) {
                    TextField("Your Name", text: $name)
                    TextField("Partner's Name", text: $partnerName)
                    TextField("Your Age", text: $age)
                    TextField("Partner's Age", text: $partnerAge)
                    TextField("Location", text: $location)
                }
                
                Section(header: Text("About Us")) {
                    TextField("Interests", text: $interests)
                    TextField("School", text: $school)
                    TextField("Height", text: $height)
                    TextField("Alcohol", text: $alcohol)
                    TextField("Drugs", text: $drugs)
                }
            }
            .navigationTitle("Profile")
        }
    }
}
