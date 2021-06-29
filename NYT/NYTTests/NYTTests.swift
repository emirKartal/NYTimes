//
//  NYTTests.swift
//  NYTTests
//
//  Created by emir kartal on 25.06.2021.
//

import XCTest
@testable import NYT

class NYTTests: XCTestCase {
    
    private var viewModel: HomeViewModelProtocol!
    private var mockView: MockView!

    override func setUpWithError() throws {
        mockView = MockView()
        viewModel = HomeViewModel(isMock: true)
        viewModel.delegate = mockView
    }
    
    func testApiMockData() {
        viewModel.getStories()
        XCTAssertEqual(mockView.outputs.count, 3)
        XCTAssertEqual(mockView.storyList.count, 6)
    }
    
    func testFirstApiMockData() {
        mockView.resetTestOutputs()
        viewModel.getStories()
        let story = mockView.storyList.first
        XCTAssertEqual(story?.title, "Engineer Warned of ‘Major Structural Damage’ at Florida Condo Complex")
        XCTAssertNotNil(story?.publishedDate)
    }
    
    func testMockViewOutputs() {
        
        mockView.resetTestOutputs()
        viewModel.getStories()
        
        XCTAssertEqual(mockView.outputs[0], .isLoading(true))
        XCTAssertEqual(mockView.outputs[1], .isLoading(false))
        let expectedStories = mockView.storyList ?? []
        XCTAssertEqual(mockView.outputs[2], .showStories(expectedStories))
    }

}

private class MockView: HomeViewModelDelegate {
    var outputs: [HomeViewModelOutput] = []
    var storyList: [StoryResultModel]!
    
    func handleHomeViewModelOutput(_ output: HomeViewModelOutput) {
        outputs.append(output)
        switch output {
        case .showStories(let stories):
            storyList = stories
            break
        default:
            break
        }
    }
    
    func resetTestOutputs() {
        outputs.removeAll()
    }
    
    func navigate(to route: HomeRouter) {}
}
