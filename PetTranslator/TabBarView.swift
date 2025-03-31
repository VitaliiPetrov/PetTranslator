import Foundation
import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Int
    var body: some View {
        HStack {
            Spacer()
            Button(action: { selectedTab = 0 }) {
                VStack {
                    Image("translator")
                    Text("Translator")
                        .font(.konkhmerSleokchher, size: 12)
                        .foregroundColor(.black)
                }.opacity(selectedTab == 0 ? 1.0 : 0.6)
            }.frame(width: 63, height: 44)
            Spacer()
            Button(action: { selectedTab = 1 }) {
                VStack {
                    Image("clicker")
                    Text("Clicker")
                        .font(.konkhmerSleokchher, size: 12)
                        .foregroundColor(.black)
                }.opacity(selectedTab == 1 ? 1.0 : 0.6)
            }.frame(width: 63, height: 44)
            Spacer()
        }
        .frame(width: 216, height: 82)
        .background(Color.white)
        .cornerRadius(20)
        .padding(.bottom, 39)
        .shadow(color: Color.tabShadow.opacity(0.1), radius: 80, x: 0, y: 0)

    }
}
