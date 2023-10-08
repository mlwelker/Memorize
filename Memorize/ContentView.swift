
import SwiftUI

struct ContentView: View {
    let emojis = ["👻", "😈", "🕷️", "🎃", "💀", "🕸️", "🧙‍♀️", "🙀", "👹", "😱", "☠️", "🍭"]
    
    @State private var cardCount = 4
    
    var body: some View {
        VStack {
            HStack {
                ForEach(0..<cardCount, id: \.self) { i in
                    CardView(content: emojis[i])
                }
            }
            .foregroundStyle(.orange)
            
            HStack {
                Button {
                    if cardCount < 1 {
                        cardCount -= 1
                    }
                } label: {
                    Image(systemName: "rectangle.stack.badge.minus.fill")
                }
                
                Spacer()
                
                Button{
                    if cardCount < emojis.count {
                        cardCount += 1
                    }
                } label: {
                    Image(systemName: "rectangle.stack.badge.plus.fill")
                }
            }
            .imageScale(.large)
            .font(.largeTitle)
        }
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State private var isFaceUp = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.stroke(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
