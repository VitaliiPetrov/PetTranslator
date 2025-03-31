import Foundation
import SwiftUI

enum CustomFont: String {
    case konkhmerSleokchher = "Konkhmer Sleokchher"
}

extension Font {
    static func custom(_ customFont: CustomFont, size: CGFloat) -> Font {
        Font.custom(customFont.rawValue, fixedSize: size)
    }
}

extension Text {
    func font(_ customFont: CustomFont, size: CGFloat) -> Text {
        self.font(Font.custom(customFont, size: size))
    }
}
