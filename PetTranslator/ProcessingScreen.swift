import Foundation
import SwiftUI

struct ProcessingScreen: View {
    @EnvironmentObject var translationData: TranslationData
    @Binding var navigationPath: NavigationPath
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.gradientColorTwo, Color.gradientColorOne]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing: 0) {
                Text("Process of translation...")
                    .font(.konkhmerSleokchher, size: 16)
                    .frame(width: 310, height: 22)
                    .padding(.top, 411)
                Image(translationData.selectedImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 184, height: 184)
                    .padding(.top, 20)
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Image("translator")
                        Text("Translator")
                            .font(.konkhmerSleokchher, size: 12)
                            .foregroundColor(.black)
                        }
                        .opacity(1.0)
                        .frame(width: 63, height: 44)
                    Spacer()
                    VStack {
                        Image("clicker")
                        Text("Clicker")
                            .font(.konkhmerSleokchher, size: 12)
                            .foregroundColor(.black)
                        }
                        .opacity(0.6)
                        .frame(width: 63, height: 44)
                    Spacer()
                }
                .frame(width: 216, height: 82)
                .background(Color.white)
                .cornerRadius(20)
                .padding(.bottom, 39)
                .shadow(color: Color.tabShadow.opacity(0.1), radius: 80, x: 0, y: 0)
            }.ignoresSafeArea()
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                navigationPath.append("Completion")
            }
        }
    }
}
