import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(.systemMint).ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                Image("rivendell")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(15)
                HStack {
                    Text("Rivendell Fall").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundColor(.black)
                    Spacer()
                    VStack {
                        HStack {
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.leadinghalf.fill")
                        }
                        Text("(Reviews 361)")
                    }.foregroundColor(.orange).font(.caption)
                }
                Text("Come visit the falls for an experience of a lifetime").foregroundColor(.black)
                HStack {
                    Spacer()
                    Image(systemName: "fork.knife")
                    Image(systemName: "binoculars.fill")
                }.foregroundColor(.gray).font(.caption)
            }
            .padding()
            .background(Rectangle()
                .foregroundColor(.white)
                .cornerRadius(15)
                .shadow(radius: 15))
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

