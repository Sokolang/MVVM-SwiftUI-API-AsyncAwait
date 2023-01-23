//
//  UITestExampleUITests.swift
//  UITestExampleUITests
//
//  Created by Anzhelika Sokolova on 23.01.2023.
//

import XCTest

final class UITestExampleUITests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        app.launch()

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testButtonsShowAlerts() {
        app.buttons["BLUE"].tap()
        XCTAssertTrue(app.alerts["BLUE"].exists)
        app.alerts["BLUE"].scrollViews.otherElements.buttons["OK"].tap()
    }
    
    func testSliderControlsProgress() {
        //let app = XCUIApplication()
        //app.sliders["Slider"].adjust(toNormalizedSliderPosition: 1)
        //XCUIApplication().sliders["56 %"].swipeRight()
        
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
