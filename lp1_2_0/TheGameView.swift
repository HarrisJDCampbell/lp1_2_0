import SwiftUI

struct CoupleProfile: Identifiable {
    let id = UUID()
    let names: String
    let ages: String
    let location: String
    let bio: String
    let prompt: String
    let promptAnswer: String
    let imageURLs: [String]
    let interests: [String]
    let occupation: String
}

struct TheGameView: View {
    @State private var cardOffset = CGSize.zero
    @State private var cardRotation = Angle(degrees: 0)
    @State private var currentCardIndex = 0
    
    let exampleCards = [
        "John, 28",
        "Emma, 25",
        "Michael, 30",
        "Sophia, 27",
        "Daniel, 29",
        "Olivia, 26",
        "William, 31",
        "Ava, 24",
        "James, 28",
        "Isabella, 27"
    ]
    
    var body: some View {
        VStack {
            Text("The Game")
                .font(.largeTitle)
                .padding()
            
            ZStack {
                ForEach(0..<min(3, exampleCards.count - currentCardIndex), id: \.self) { index in
                    CardView(name: exampleCards[currentCardIndex + index])
                        .zIndex(Double(3 - index))
                        .offset(x: index == 0 ? cardOffset.width : 0,
                                y: CGFloat(-index * 4))
                        .rotationEffect(index == 0 ? cardRotation : .zero)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    if index == 0 {
                                        self.cardOffset = gesture.translation
                                        self.cardRotation = Angle(degrees: Double(gesture.translation.width) * 0.1)
                                    }
                                }
                                .onEnded { _ in
                                    if index == 0 {
                                        handleSwipe()
                                    }
                                }
                        )
                }
            }
            .animation(.spring(), value: cardOffset)
            
            HStack(spacing: 50) {
                Button(action: { handleChoice(accepted: false) }) {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                        .foregroundColor(.red)
                }
                
                Button(action: { handleChoice(accepted: true) }) {
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                        .foregroundColor(.green)
                }
            }
            .padding(.top, 20)
            
            Spacer()
        }
    }
    
    private func handleSwipe() {
        let threshold: CGFloat = 100
        if cardOffset.width > threshold {
            handleChoice(accepted: true)
        } else if cardOffset.width < -threshold {
            handleChoice(accepted: false)
        } else {
            resetCard()
        }
    }
    
    private func handleChoice(accepted: Bool) {
        withAnimation(.spring()) {
            cardOffset = CGSize(width: accepted ? 500 : -500, height: 0)
            cardRotation = Angle(degrees: accepted ? 20 : -20)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            currentCardIndex += 1
            if currentCardIndex >= exampleCards.count {
                currentCardIndex = 0
            }
            resetCard()
        }
    }
    
    private func resetCard() {
        cardOffset = .zero
        cardRotation = .zero
    }
}

struct CardView: View {
    let name: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .shadow(radius: 10)
            
            VStack {
                Image(systemName: "person.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
                    .padding(.top)
                
                Text(name)
                    .font(.title)
                    .padding()
                
                Text("This is a longer description for the card. It includes more information about the person, their interests, and other details that might be relevant for a dating app.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
            }
        }
        .frame(width: 300, height: 500)
    }
}

struct TheGameView_Previews: PreviewProvider {
    static var previews: some View {
        TheGameView()
    }
}
