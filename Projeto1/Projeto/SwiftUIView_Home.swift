import SwiftUI

struct SwiftUIView_Home: View {
    @State var nome_: String = ""
    var body: some View {
        VStack {
            Text("Home Screen")
                .font(.largeTitle)
                .bold()
            Spacer()
        }
    }
}

#Preview {
    SwiftUIView_Home()
}
