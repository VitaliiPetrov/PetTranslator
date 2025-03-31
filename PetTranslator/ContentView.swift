import SwiftUI

class TranslationData: ObservableObject {
    @Published var selectedImageName: String = "cat" // Default image
}

struct ContentView: View {
    @State private var selectedTab = 0
    @State private var navigationPath = NavigationPath()
    @StateObject private var translationData = TranslationData()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.gradientColorTwo, Color.gradientColorOne]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack (spacing: 0){
                    if selectedTab == 0 {
                        TranslatorView(navigationPath: $navigationPath).environmentObject(translationData)
                    } else {
                        ClickerView()
                    }
                    Spacer()
                    CustomTabBar(selectedTab: $selectedTab)
                }
                .ignoresSafeArea()
            }
            .navigationDestination(for: String.self) { screen in
                switch screen {
                case "Recording": RecordingScreen(navigationPath: $navigationPath).environmentObject(translationData).navigationBarBackButtonHidden(true)
                case "Processing": ProcessingScreen(navigationPath: $navigationPath).environmentObject(translationData).navigationBarBackButtonHidden(true)
                case "Completion": CompletionScreen(navigationPath: $navigationPath).environmentObject(translationData).navigationBarBackButtonHidden(true)
                default: ContentView()
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
