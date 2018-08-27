//
// The MIT License (MIT)
//
// Copyright (c) 2015 Clay Smith
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import Foundation
import XCTest
import HSLuv

class AppKitTests: XCTestCase {
    let rgbRangeTolerance = 0.00000000001

    func testNSColorRGBRangeTolerance() {
        for h in stride(from: 0.0, through: 360, by: 5) {
            for s in stride(from: 0.0, through: 100, by: 5) {
                for l in stride(from: 0.0, through: 100, by: 5) {
                    let color = NSColor(hue: h, saturation: s, lightness: l, alpha: 1.0)

                    XCTAssertNotNil(color)

                    let t = color.getRGBA
                    let rgb = [t.rgb.r, t.rgb.G, t.rgb.B]

                    for channel in rgb {
                        XCTAssertGreaterThan(channel, -rgbRangeTolerance, "HSLuv: \([h, s, l]) -> RGB: \(rgb)")
                        XCTAssertLessThanOrEqual(channel, 1 + rgbRangeTolerance, "HSLuv: \([h, s, l]) -> RGB: \(rgb)")
                    }
                }
            }
        }
    }
}
