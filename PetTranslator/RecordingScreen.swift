import Foundation
import SwiftUI
import DotLottie

struct AnimationView: View {
    var body: some View {
        DotLottieAnimation(fileName: "animation", config: AnimationConfig(autoplay: true, loop: true)).view()
    }
}

struct RecordingScreen: View {
    @EnvironmentObject var translationData: TranslationData
    @Binding var navigationPath: NavigationPath
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.gradientColorTwo, Color.gradientColorOne]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing: 0) {
                Text("Translator").font(.konkhmerSleokchher, size: 32)
                    .frame(width: 350, height: 58)
                    .padding(.top, 80)
                HStack(spacing: 0) {
                    Text("PET").font(.konkhmerSleokchher, size: 16)
                        .frame(width: 135, height: 61)
                    Spacer()
                    Image("arrows")
                    Spacer()
                    Text("HUMAN").font(.konkhmerSleokchher, size: 16)
                        .frame(width: 135, height: 61)
                }
                .frame(width: 310, height: 61)
                .padding(.top, 12)
                HStack {
                    VStack(spacing: 0){
                        AnimationView()
                            .frame(width: 163, height: 95)
                            .padding(.top, 40)  
                        Spacer()
                        Text("Recording...")
                            .font(.konkhmerSleokchher, size: 16)
                            .padding(.bottom, 10)
                    }
                    .frame(width: 178, height: 176)
                    .background(Color(.white))
                    .cornerRadius(16)
                    .shadow(color: Color.black.opacity(0.2), radius: 14.3, x: 0, y: 4)
                    Spacer()
                    if translationData.selectedImageName == "cat" {
                        VStack {
                            Image("cat").resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .frame(width: 70, height: 70)
                                .background(Color.cat)
                                .cornerRadius(8)
                            Image("dog").resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .frame(width: 70, height: 70)
                                .background(Color.dog)
                                .cornerRadius(8)
                                .opacity(0.6)
                        }
                        .frame(width: 107, height: 176)
                        .background(Color(.white))
                        .cornerRadius(16)
                        .shadow(color: Color.black.opacity(0.2), radius: 14.3, x: 0, y: 4)
                    } else {
                        VStack {
                            Image("cat").resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .frame(width: 70, height: 70)
                                .background(Color.cat)
                                .cornerRadius(8)
                                .opacity(0.6)
                            Image("dog").resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .frame(width: 70, height: 70)
                                .background(Color.dog)
                                .cornerRadius(8)
                        }
                        .frame(width: 107, height: 176)
                        .background(Color(.white))
                        .cornerRadius(16)
                        .shadow(color: Color.black.opacity(0.2), radius: 14.3, x: 0, y: 4)
                    }

                }
                .frame(width: 320, height: 176)
                .padding(.top, 58)
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
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                navigationPath.append("Processing")
            }
        }
    }
}

