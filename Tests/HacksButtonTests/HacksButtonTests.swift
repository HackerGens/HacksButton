import XCTest
import HacksButton
import SwiftUI

@available(iOS 13.0, *)
class HacksButtonTests: XCTestCase {
    func testDefaultButton() {
        if #available(iOS 14.0, *) {
            let button = HacksButton(text: "Test Button",
                                     textColor: .black,
                                     backgroundColor: .white,
                                     font: nil,
                                     fontWeight: nil,
                                     overlayColor: nil,
                                     overlayLineWidth: nil,
                                     backgroundFill: nil,
                                     cornerRadius: nil,
                                     fontSize: 20.0)
                .frame(width: 200, height: 50)
        } else {
            // Fallback on earlier versions
        }

    }

    // Add more test cases to cover other functionalities of the HacksButton library
}
