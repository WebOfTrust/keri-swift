//
// Created by Kevin Griffin on 2/22/22.
//

import Foundation

import RNJSON
import XCTest

@testable import keri_swift

final class MessageTests: XCTestCase {
    // Should maintain ordering through serialization/deserialization
    func testQuery() throws {
        let _qry = QueryMessage(
            v: "KERI10JSON00011c_",
            t: Ilk.qry,
            d: "EZ-i0d8JZAoTNZH3ULaU6JR2nmwyvYAfSVPzhzS6b5CM",
            dt: "2022-02-24T16:11:43.903Z".iso8601WithFractionalSeconds!,
            r: "logs",
            rr: "log/processor",
            q: Query(
                d: "EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM",
                i: "EAoTNZH3ULvYAfSVPzhzS6baU6JR2nmwyZ-i0d8JZ5CM",
                s: 5,
                dt: "2022-02-24T16:11:43.903Z".iso8601WithFractionalSeconds!
            )
        )

        let data = try RNJSONEncoder().encode(_qry)
        let expected = """
        {"v":"KERI10JSON00011c_","t":"qry","d":"EZ-i0d8JZAoTNZH3ULaU6JR2nmwyvYAfSVPzhzS6b5CM","dt":"2022-02-24T16:11:43.903Z","r":"logs","rr":"log\\/processor","q":{"d":"EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM","i":"EAoTNZH3ULvYAfSVPzhzS6baU6JR2nmwyZ-i0d8JZ5CM","s":"5","dt":"2022-02-24T16:11:43.903Z"}}
        """
        let ser = String(data: data, encoding: .utf8)!
        XCTAssertEqual(ser, expected)

        let dec = try RNJSONDecoder().decode(QueryMessage.self, from: Data(data))
        XCTAssertEqual(dec.v, "KERI10JSON00011c_")
        XCTAssertEqual(dec.t, Ilk.qry)
        XCTAssertEqual(dec.d, "EZ-i0d8JZAoTNZH3ULaU6JR2nmwyvYAfSVPzhzS6b5CM")
        XCTAssertEqual(dec.dt, "2022-02-24T16:11:43.903Z".iso8601WithFractionalSeconds)
        XCTAssertEqual(dec.r, "logs")
        XCTAssertEqual(dec.rr, "log/processor")
        XCTAssertEqual(dec.q.d, "EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM")
        XCTAssertEqual(dec.q.i, "EAoTNZH3ULvYAfSVPzhzS6baU6JR2nmwyZ-i0d8JZ5CM")
        XCTAssertEqual(dec.q.s, 5)
        XCTAssertEqual(dec.q.dt, "2022-02-24T16:11:43.903Z".iso8601WithFractionalSeconds!)
    }

    func testReply() throws {
        let _rpy = ReplyMessage(
            v: "KERI10JSON00011c_",
            t: Ilk.rpy,
            d: "EZ-i0d8JZAoTNZH3ULaU6JR2nmwyvYAfSVPzhzS6b5CM",
            dt: "2022-02-24T16:11:43.903Z".iso8601WithFractionalSeconds!,
            r: "logs/processor",
            a: Reply(
                d: "EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM",
                i: "EAoTNZH3ULvYAfSVPzhzS6baU6JR2nmwyZ-i0d8JZ5CM",
                name: "John Jones",
                role: "Founder"
            )
        )

        let data = try RNJSONEncoder().encode(_rpy)
        let expected = """
        {"v":"KERI10JSON00011c_","t":"rpy","d":"EZ-i0d8JZAoTNZH3ULaU6JR2nmwyvYAfSVPzhzS6b5CM","dt":"2022-02-24T16:11:43.903Z","r":"logs\\/processor","a":{"d":"EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM","i":"EAoTNZH3ULvYAfSVPzhzS6baU6JR2nmwyZ-i0d8JZ5CM","name":"John Jones","role":"Founder"}}
        """
        let ser = String(data: data, encoding: .utf8)!
        XCTAssertEqual(ser, expected)

        let dec = try RNJSONDecoder().decode(ReplyMessage.self, from: Data(data))
        XCTAssertEqual(dec.v, "KERI10JSON00011c_")
        XCTAssertEqual(dec.t, Ilk.rpy)
        XCTAssertEqual(dec.d, "EZ-i0d8JZAoTNZH3ULaU6JR2nmwyvYAfSVPzhzS6b5CM")
        XCTAssertEqual(dec.dt, "2022-02-24T16:11:43.903Z".iso8601WithFractionalSeconds)
        XCTAssertEqual(dec.r, "logs/processor")
        XCTAssertEqual(dec.a.d, "EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM")
        XCTAssertEqual(dec.a.i, "EAoTNZH3ULvYAfSVPzhzS6baU6JR2nmwyZ-i0d8JZ5CM")
        XCTAssertEqual(dec.a.name, "John Jones")
        XCTAssertEqual(dec.a.role, "Founder")
    }
}
