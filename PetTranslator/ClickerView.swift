import Foundation
import SwiftUI


struct ClickerView: View {
    var body: some View {
        VStack(spacing: 0){
            Text("Settings").font(.konkhmerSleokchher, size: 32)
                .frame(width: 350, height: 58)
                .padding(.top, 80)
                .padding(.bottom, 12)
            VStack(spacing: 15){
                ZStack {
                    Rectangle().fill(.settings).frame(width: 358, height: 184)
                    HStack {
                        Text("Rate Us")
                            .font(.konkhmerSleokchher, size: 16)
                            .padding(.leading, 15)
                        Spacer()
                        Image("arrowToRight")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .padding(.trailing, 15)
                    }
                }
                .frame(width: 358, height: 60)
                .cornerRadius(20)
                ZStack {
                    Rectangle().fill(.settings).frame(width: 358, height: 184)
                    HStack {
                        Text("Share App")
                            .font(.konkhmerSleokchher, size: 16)
                            .padding(.leading, 15)
                        Spacer()
                        Image("arrowToRight")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .padding(.trailing, 15)
                    }
                }
                .frame(width: 358, height: 60)
                .cornerRadius(20)
                ZStack {
                    Rectangle().fill(.settings).frame(width: 358, height: 184)
                    HStack {
                        Text("Contact Us")
                            .font(.konkhmerSleokchher, size: 16)
                            .padding(.leading, 15)
                        Spacer()
                        Image("arrowToRight")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .padding(.trailing, 15)
                    }
                }
                .frame(width: 358, height: 60)
                .cornerRadius(20)
                ZStack {
                    Rectangle().fill(.settings).frame(width: 358, height: 184)
                    HStack {
                        Text("Restore Purchases")
                            .font(.konkhmerSleokchher, size: 16)
                            .padding(.leading, 15)
                        Spacer()
                        Image("arrowToRight")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .padding(.trailing, 15)
                    }
                }
                .frame(width: 358, height: 60)
                .cornerRadius(20)
                ZStack {
                    Rectangle().fill(.settings).frame(width: 358, height: 184)
                    HStack {
                        Text("Privacy Policy")
                            .font(.konkhmerSleokchher, size: 16)
                            .padding(.leading, 15)
                        Spacer()
                        Image("arrowToRight")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .padding(.trailing, 15)
                    }
                }
                .frame(width: 358, height: 60)
                .cornerRadius(20)
                ZStack {
                    Rectangle().fill(.settings).frame(width: 358, height: 184)
                    HStack {
                        Text("Terms of Use")
                            .font(.konkhmerSleokchher, size: 16)
                            .padding(.leading, 15)
                        Spacer()
                        Image("arrowToRight")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .padding(.trailing, 15)
                    }
                }
                .frame(width: 358, height: 60)
                .cornerRadius(20)
                Spacer()
            }
        }.ignoresSafeArea()
        Spacer()
    }
}
