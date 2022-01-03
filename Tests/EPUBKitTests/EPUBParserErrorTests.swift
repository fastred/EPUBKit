//
//  File.swift
//  
//
//  Created by Witek Bobrowski on 13/06/2021.
//

import XCTest
@testable import EPUBKit

final class EPUBParserErrorTests: XCTestCase {

    private lazy var library: FileLibrary = EPUBLibrary()

    func testErrorZipWithBrokenAlice() {
        let url = library.path(for: .alicesAdventuresinWonderlandBrokenArchive)
        let parser = EPUBParser()
        XCTAssertThrowsError(try parser.parse(documentAt: url), "") { error in
            guard let error = error as? EPUBParserError else {
                XCTFail("Error should be of type `EPUBParserError`")
                return
            }
            switch error {
            case .unzipFailed:
                XCTAssertNotNil(error.errorDescription)
                XCTAssertNotNil(error.failureReason)
                XCTAssertNotNil(error.recoverySuggestion)
            default:
                XCTFail("Wrong error thrown")
            }
        }
    }

    func testErrorContainerWithBrokenGeographyofBliss() {
        let url = library.path(for: .theGeographyofBlissBrokenContainer)
        let parser = EPUBParser()
        XCTAssertThrowsError(try parser.parse(documentAt: url), "") { error in
            guard let error = error as? EPUBParserError else {
                XCTFail("Error should be of type `EPUBParserError`")
                return
            }
            switch error {
            case .containerMissing:
                XCTAssertNotNil(error.errorDescription)
                XCTAssertNotNil(error.failureReason)
                XCTAssertNotNil(error.recoverySuggestion)
            default:
                XCTFail("Wrong error thrown: \(error)")
            }
        }
    }

    func testNoTocWithBrokenMetamorphosis() {
        let url = library.path(for: .theMetamorphosisBrokenToc)
        guard let document = EPUBDocument(url: url) else {
            XCTFail("Document should be parsed correctly.")
            return
        }
        XCTAssertEqual(document.title, "Metamorphosis")
        XCTAssertEqual(document.author, "Franz Kafka")
        XCTAssertEqual(document.publisher, "PressBooks.com")
        XCTAssertNotNil(document.cover)
    }

    func testErrorContentWithBrokenPhilosophy() {
        let url = library.path(for: .theProblemsofPhilosophyBrokenContent)
        let parser = EPUBParser()
        XCTAssertThrowsError(try parser.parse(documentAt: url), "") { error in
            guard let error = error as? EPUBParserError else {
                XCTFail("Error should be of type `EPUBParserError`")
                return
            }
            switch error {
            case .contentPathMissing:
                XCTAssertNotNil(error.errorDescription)
                XCTAssertNotNil(error.failureReason)
                XCTAssertNotNil(error.recoverySuggestion)
            default:
                XCTFail("Wrong error thrown: \(error)")
            }
        }
    }

}
