//
//  DeserializationTests.swift
//  JSON
//
//  Created by Sam Soffes on 9/22/16.
//  Copyright © 2016 Sam Soffes. All rights reserved.
//

import XCTest
import JSON

final class DeserializationTests: XCTestCase {

	let sam = User(name: "Sam Soffes", createdAt: Date(timeIntervalSince1970: 1474576117))

	func testDeserialization() {
		let dictionary = [
			"name": "Sam Soffes",
			"created_at": "2016-09-22T22:28:37+02:00"
		]

		XCTAssertEqual(try! decode(dictionary), sam)
	}

	func testNestedDeserialization() {
		let dictionary: JSONDictionary = [
			"title": "Hello World",
			"author": [
				"name": "Sam Soffes",
				"created_at": "2016-09-22T22:28:37+02:00"
			]
		]

		let post = Post(title: "Hello World", author: sam)

		XCTAssertEqual(try! decode(dictionary), post)
	}
}
