
import SwiftUI

struct ContentView: View {
    let emojis = ["👻", "😈", "🕷️", "🎃"]
    
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) { i in
                CardView(content: emojis[i])
            }
        }
        .foregroundStyle(.orange)
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
