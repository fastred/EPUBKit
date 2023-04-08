//
//  EPUBMetadataParser.swift
//  EPUBKit
//
//  Created by Witek Bobrowski on 30/06/2018.
//  Copyright © 2018 Witek Bobrowski. All rights reserved.
//

import Foundation
import AEXML

protocol EPUBMetadataParser {
    func parse(_ xmlElement: AEXMLElement) -> EPUBMetadata
}

class EPUBMetadataParserImplementation: EPUBMetadataParser {

    func parse(_ xmlElement: AEXMLElement) -> EPUBMetadata {
        var metadata = EPUBMetadata()
        metadata.contributor = EPUBCreator(
            name: xmlElement["contributor"].value,
            role: xmlElement["contributor"].attributes["role"],
            fileAs: xmlElement["contributor"].attributes["file-as"]
        )
        metadata.coverage = xmlElement["coverage"].value
        metadata.creator = EPUBCreator(
            name: xmlElement["creator"].value,
            role: xmlElement["creator"].attributes["role"],
            fileAs: xmlElement["creator"].attributes["file-as"]
        )
        metadata.date = xmlElement["date"].value
        metadata.description = xmlElement["description"].value
        metadata.format = xmlElement["format"].value
        metadata.identifier = xmlElement["identifier"].value
        metadata.language = xmlElement["language"].value
        metadata.publisher = xmlElement["publisher"].value
        metadata.relation = xmlElement["relation"].value
        metadata.rights = xmlElement["rights"].value
        metadata.source = xmlElement["source"].value
        metadata.subject = xmlElement["subject"].value
        metadata.title = xmlElement["title"].value
        metadata.type = xmlElement["type"].value
        xmlElement["meta"].all?
            .filter { $0.attributes["name"] == "cover" }
            .forEach { metadata.coverId = $0.attributes["content"] }
        return metadata
    }

}
