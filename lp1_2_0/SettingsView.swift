import SwiftUI

struct SettingsView: View {
    @State private var maxDistance = 50.0
    @State private var ageRange = 18...50
    @State private var showMen = true
    @State private var showWomen = true
    @State private var notifications = true
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Match Preferences")) {
                    Slider(value: $maxDistance, in: 1...100, step: 1) {
                        Text("Maximum Distance")
                    } minimumValueLabel: {
                        Text("1")
                    } maximumValueLabel: {
                        Text("100")
                    }
                    Text("Maximum distance: \(Int(maxDistance)) miles")
                    
                    VStack {
                        Text("Age Range: \(ageRange.lowerBound) - \(ageRange.upperBound)")
                        RangeSlider(range: $ageRange, bounds: 18...100)
                    }
                    
                    Toggle("Show Men", isOn: $showMen)
                    Toggle("Show Women", isOn: $showWomen)
                }
                
                Section(header: Text("Notifications")) {
                    Toggle("Push Notifications", isOn: $notifications)
                }
                
                Section(header: Text("Account")) {
                    Button("Change Password") {
                        // Implement password change functionality
                    }
                    Button("Delete Account") {
                        // Implement account deletion functionality
                    }
                    .foregroundColor(.red)
                }
                
                Section(header: Text("About")) {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("1.0.0")
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct RangeSlider: View {
    @Binding var range: ClosedRange<Int>
    let bounds: ClosedRange<Int>
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Text("\(bounds.lowerBound)")
                Slider(value: Binding(
                    get: { Double(range.lowerBound) },
                    set: { range = Int($0)...range.upperBound }
                ), in: Double(bounds.lowerBound)...Double(range.upperBound))
                Slider(value: Binding(
                    get: { Double(range.upperBound) },
                    set: { range = range.lowerBound...Int($0) }
                ), in: Double(range.lowerBound)...Double(bounds.upperBound))
                Text("\(bounds.upperBound)")
            }
        }
    }
}
