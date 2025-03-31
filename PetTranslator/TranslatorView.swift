import Foundation
import SwiftUI
import AVFoundation


struct TranslatorView: View {
    @Binding var navigationPath: NavigationPath
    @State private var selectedTab = 0
    @State private var showSettingsAlert = false
    @EnvironmentObject var translationData: TranslationData
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Translator").font(.konkhmerSleokchher, size: 32)
                .frame(width: 350, height: 58)
                .padding(.top, 80)
            HStack(spacing: 0) {
                Text("HUMAN").font(.konkhmerSleokchher, size: 16)
                    .frame(width: 135, height: 61)
                Spacer()
                Image("arrows")
                Spacer()
                Text("PET").font(.konkhmerSleokchher, size: 16)
                    .frame(width: 135, height: 61)
            }
            .frame(width: 310, height: 61)
            .padding(.top, 12)
            HStack {
                VStack(spacing: 0){
                    Button(action: startRecording) {
                        Image("microphone")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70)
                            .foregroundColor(.white)
                            .padding(.top, 40)
                    }
                    Spacer()
                    Text("Start Speak")
                        .font(.konkhmerSleokchher, size: 16)
                        .padding(.bottom, 10)
                }
                .frame(width: 178, height: 176)
                .background(Color(.white))
                .cornerRadius(16)
                .shadow(color: Color.black.opacity(0.2), radius: 14.3, x: 0, y: 4)
                Spacer()
                VStack {
                    Button(action: { selectAnimal(index: 0) }) {
                        VStack {
                            Image("cat").resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .frame(width: 70, height: 70)
                                .background(Color.cat)
                                .cornerRadius(8)
                        }.opacity(selectedTab == 0 ? 1.0 : 0.6)
                    }
                    Button(action: { selectAnimal(index: 1) }) {
                        VStack {
                            Image("dog").resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .frame(width: 70, height: 70)
                                .background(Color.dog)
                                .cornerRadius(8)
                        }.opacity(selectedTab == 1 ? 1.0 : 0.6)
                    }
                }
                .frame(width: 107, height: 176)
                .background(Color(.white))
                .cornerRadius(16)
                .shadow(color: Color.black.opacity(0.2), radius: 14.3, x: 0, y: 4)
            }
            .frame(width: 320, height: 176)
            .padding(.top, 58)
            Image(translationData.selectedImageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 184, height: 184)
                            .padding(.top, 20)
            Spacer()
        }
        .ignoresSafeArea()
        .alert("Enable Microphone Access", isPresented: $showSettingsAlert) {
            Button("Settings") {
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(url)
                }
            }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Please allow access to your mircophone to use the app’s features")
        }
    }
    
    func selectAnimal(index: Int) {
            selectedTab = index
            translationData.selectedImageName = (index == 0) ? "cat" : "dog"
    }
    
    func startRecording() {
        checkMicrophonePermission { granted in
            if granted {
                navigationPath.append("Recording")
            } else {
                showSettingsAlert = true
            }
        }
    }

    func checkMicrophonePermission(completion: @escaping (Bool) -> Void) {
        let status = AVAudioApplication.shared.recordPermission
        
        switch status {
        case .granted:
            completion(true)
        case .denied:
            completion(false)
        case .undetermined:
            AVAudioApplication.requestRecordPermission { granted in
                DispatchQueue.main.async {
                    completion(granted)
                }
            }
        default:
            completion(false)
        }
    }
}
