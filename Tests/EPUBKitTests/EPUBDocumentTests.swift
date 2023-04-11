//
//  EPUBDocumentTests.swift
//  
//
//  Created by Witek Bobrowski on 13/06/2021.
//

import XCTest
@testable import EPUBKit

final class EPUBDocumentTests: XCTestCase {

    private lazy var library: FileLibrary = EPUBLibrary()

    func testEPUBDocumentSimpleInitialiserWithAliceInWonderland() {
        let url = library.path(for: .alicesAdventuresinWonderland)
        guard let document = EPUBDocument(url: url) else {
            XCTFail("Document should be parsed correctly.")
            return
        }
        XCTAssertNil(document.title)
        XCTAssertNil(document.author)
        XCTAssertNil(document.publisher)
        XCTAssertNil(document.cover)
    }

    func testEPUBDocumentSimpleInitialiserWithGeographyOfBliss() {
        let url = library.path(for: .theGeographyofBliss)
        guard let document = EPUBDocument(url: url) else {
            XCTFail("Document should be parsed correctly.")
            return
        }
        XCTAssertEqual(document.title, "The Geography of Bliss: One Grump's Search for the Happiest Places in the World")
        XCTAssertEqual(document.author, "Eric Weiner")
        XCTAssertEqual(document.publisher, "Twelve")
        XCTAssertNotNil(document.cover)
    }

    func testEPUBDocumentSimpleInitialiserWithMethamorphosis() {
        let url = library.path(for: .theMetamorphosis)
        guard let document = EPUBDocument(url: url) else {
            XCTFail("Document should be parsed correctly.")
            return
        }
        XCTAssertEqual(document.title, "Metamorphosis")
        XCTAssertEqual(document.author, "Franz Kafka")
        XCTAssertEqual(document.publisher, "PressBooks.com")
        XCTAssertNotNil(document.cover)
    }

    func testEPUBDocumentSimpleInitialiserWithPhilosophy() {
        let url = library.path(for: .theProblemsofPhilosophy)
        guard let document = EPUBDocument(url: url) else {
            XCTFail("Document should be parsed correctly.")
            return
        }
        XCTAssertEqual(document.title, "The Problems of Philosophy")
        XCTAssertEqual(document.author, "Bertrand Russell")
        XCTAssertEqual(document.publisher, "PresssBooks.com")
        XCTAssertNotNil(document.cover)
    }

    func testEPUBDocumentSimpleInitialiserWithWinnie() {
        let url = library.path(for: .winnie)
        guard let document = EPUBDocument(url: url) else {
            XCTFail("Document should be parsed correctly.")
            return
        }
        XCTAssertEqual(document.title, "Winnie-the-Pooh")
        XCTAssertEqual(document.author, "A. A. Milne")
        XCTAssertNotNil(document.cover)
    }

    func testEPUBDocumentSimpleInitialiserWithSatsuma() {
        let url = library.path(for: .theSatsumaComplex)
        guard let document = EPUBDocument(url: url) else {
            XCTFail("Document should be parsed correctly.")
            return
        }
        XCTAssertEqual(document.title, "The Satsuma Complex")
        XCTAssertEqual(document.author, "Bob Mortimer")
        XCTAssertNotNil(document.cover)
    }

    func testEPUBDocumentSimpleInitialiserWithLeLivreVert() {
        let url = library.path(for: .leLivreVert)
        guard let document = EPUBDocument(url: url) else {
            XCTFail("Document should be parsed correctly.")
            return
        }
        XCTAssertEqual(document.title, "Le Livre Vert")
        XCTAssertEqual(document.author, "Kadhafi Mouammar")
        XCTAssertNotNil(document.cover)
    }
}
