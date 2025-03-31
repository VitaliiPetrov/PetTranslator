import Foundation
import SwiftUI

struct CompletionScreen: View {
    @Binding var navigationPath: NavigationPath
    @EnvironmentObject var translationData: TranslationData
    @State private var result = Int.random(in: 1...2)
    @State private var texts = ["What are you doing, human?", "I’m hungry, feed me!"]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.gradientColorTwo, Color.gradientColorOne]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                HStack {
                    Button(action: { navigationPath = NavigationPath() }) {
                        Image("close").resizable()
                            .scaledToFit()
                            .frame(width: 28, height: 28)
                            .frame(width: 48, height: 48)
                            .background(Color.white)
                            .cornerRadius(25)
                    }
                    Spacer()
                    Text("Result")
                        .font(.konkhmerSleokchher, size: 32)
                    Spacer()
                    Rectangle().fill(.clear)
                        .frame(width: 48, height: 48)
                }
                .frame(width: 350, height: 58)
                .padding(.top, 80)
                
                if result == 1 {
                    ZStack {
                        Rectangle()
                            .fill(.result)
                            .frame(width: 291, height: 142)
                            .cornerRadius(16)
                            .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 4)
                        Image("polygon")
                            .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 4)
                            .offset(x: 80, y: 125)
                        
                        Text(texts.randomElement() ?? "")
                            .font(.konkhmerSleokchher, size: 12)
                    }.padding(.top, 80)
                } else {
                    ZStack {
                        Rectangle()
                            .fill(.result)
                            .frame(width: 291, height: 54)
                            .cornerRadius(16)
                            .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 4)
                        
                        HStack {
                            Button(action: {navigationPath.append("Recording") }) {
                                Image("rotate")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 14, height: 14)
                            }
                            Text("Repeat")
                                .font(.konkhmerSleokchher, size: 12)
                        }
                    }.padding(.top, 167)
                }
                
                Image(translationData.selectedImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 184, height: 184)
                    .padding(.top, 80)
                
                Spacer()
            }.ignoresSafeArea()
        }
    }
}



