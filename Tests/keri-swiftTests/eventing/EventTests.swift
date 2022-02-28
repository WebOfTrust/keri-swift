//
// Created by Kevin Griffin on 2/21/22.
//

import Foundation
import RNJSON
import XCTest

@testable import keri_swift

final class EventTests: XCTestCase {
    // Should maintain ordering through serialization/deserialization
    func testICP() throws {
        let _icp = ICP(v: "KERI10JSON00011c_",
                       t: Ilk.icp,
                       d: "EZAoTNZH3ULvaU6Z-i0d8JJR2nmwyYAfSVPzhzS6b5CM",
                       i: "EZAoTNZH3ULvaU6Z-i0d8JJR2nmwyYAfSVPzhzS6b5CM",
                       s: 0,
                       kt: 1,
                       k: ["DaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM"],
                       n: "EZ-i0d8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM",
                       bt: 1,
                       b: ["DTNZH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8JZAo5CM"],
                       c: ["EO"])

        let data = try RNJSONEncoder().encode(_icp)
        let expected = """
        {"v":"KERI10JSON00011c_","t":"icp","d":"EZAoTNZH3ULvaU6Z-i0d8JJR2nmwyYAfSVPzhzS6b5CM","i":"EZAoTNZH3ULvaU6Z-i0d8JJR2nmwyYAfSVPzhzS6b5CM","s":"0","kt":"1","k":["DaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM"],"n":"EZ-i0d8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM","bt":"1","b":["DTNZH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8JZAo5CM"],"c":["EO"]}
        """
        let ser = String(data: data, encoding: .utf8)!
        XCTAssertEqual(ser, expected)

        let dec = try RNJSONDecoder().decode(ICP.self, from: Data(data))
        XCTAssertEqual(dec.v, "KERI10JSON00011c_")
        XCTAssertEqual(dec.t, Ilk.icp)
        XCTAssertEqual(dec.d, "EZAoTNZH3ULvaU6Z-i0d8JJR2nmwyYAfSVPzhzS6b5CM")
        XCTAssertEqual(dec.i, "EZAoTNZH3ULvaU6Z-i0d8JJR2nmwyYAfSVPzhzS6b5CM")
        XCTAssertEqual(dec.s, 0)
        XCTAssertEqual(dec.kt, 1)
        XCTAssertEqual(dec.k, ["DaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM"])
        XCTAssertEqual(dec.n, "EZ-i0d8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM")
        XCTAssertEqual(dec.bt, 1)
        XCTAssertEqual(dec.b, ["DTNZH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8JZAo5CM"])
        XCTAssertEqual(dec.c, ["EO"])
    }

    func testROT() throws {
        let _rot = ROT(v: "KERI10JSON00011c_",
                       t: Ilk.rot,
                       d: "E0d8JJR2nmwyYAfZAoTNZH3ULvaU6Z-iSVPzhzS6b5CM",
                       i: "EZAoTNZH3ULvaU6Z-i0d8JJR2nmwyYAfSVPzhzS6b5CM",
                       s: 1,
                       p: "EULvaU6JR2nmwyZ-i0d8JZAoTNZH3YAfSVPzhzS6b5CM",
                       kt: 1,
                       k: ["EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM"],
                       n: "EYAfSVPzhzZ-i0d8JZAoTNZH3ULvaU6JR2nmwyS6b5CM",
                       bt: 1,
                       ba: ["DTNZH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8JZAo5CM"],
                       br: ["DH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8TNZJZAo5CM"])

        let data = try RNJSONEncoder().encode(_rot)
        let ser = String(data: data, encoding: .utf8)!
        let expected = """
        {"v":"KERI10JSON00011c_","t":"rot","d":"E0d8JJR2nmwyYAfZAoTNZH3ULvaU6Z-iSVPzhzS6b5CM","i":"EZAoTNZH3ULvaU6Z-i0d8JJR2nmwyYAfSVPzhzS6b5CM","s":"1","p":"EULvaU6JR2nmwyZ-i0d8JZAoTNZH3YAfSVPzhzS6b5CM","kt":"1","k":["EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM"],"n":"EYAfSVPzhzZ-i0d8JZAoTNZH3ULvaU6JR2nmwyS6b5CM","bt":"1","ba":["DTNZH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8JZAo5CM"],"br":["DH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8TNZJZAo5CM"]}
        """
        XCTAssertEqual(ser, expected)

        let dec = try RNJSONDecoder().decode(ROT.self, from: Data(data))
        XCTAssertEqual(dec.v, "KERI10JSON00011c_")
        XCTAssertEqual(dec.t, Ilk.rot)
        XCTAssertEqual(dec.d, "E0d8JJR2nmwyYAfZAoTNZH3ULvaU6Z-iSVPzhzS6b5CM")
        XCTAssertEqual(dec.i, "EZAoTNZH3ULvaU6Z-i0d8JJR2nmwyYAfSVPzhzS6b5CM")
        XCTAssertEqual(dec.s, 1)
        XCTAssertEqual(dec.p, "EULvaU6JR2nmwyZ-i0d8JZAoTNZH3YAfSVPzhzS6b5CM")
        XCTAssertEqual(dec.kt, 1)
        XCTAssertEqual(dec.k, ["EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM"])
        XCTAssertEqual(dec.n, "EYAfSVPzhzZ-i0d8JZAoTNZH3ULvaU6JR2nmwyS6b5CM")
        XCTAssertEqual(dec.bt, 1)
        XCTAssertEqual(dec.ba, ["DTNZH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8JZAo5CM"])
        XCTAssertEqual(dec.br, ["DH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8TNZJZAo5CM"])
    }

    func testORT() throws {
        let _ort = ORT(v: "KERI10JSON00011c_",
                       t: Ilk.ort,
                       d: "E0d8JJR2nmwyYAfZAoTNZH3ULvaU6Z-iSVPzhzS6b5CM",
                       i: "EZAoTNZH3ULvaU6Z-i0d8JJR2nmwyYAfSVPzhzS6b5CM",
                       s: 1,
                       p: "EULvaU6JR2nmwyZ-i0d8JZAoTNZH3YAfSVPzhzS6b5CM",
                       kt: 2,
                       k: [
                           "Ed8JZAoTNZaU6JR2nmwyZ-i0H3ULvYAfSVPzhzS6b5CM",
                           "Ed8JZAoTNZaU6JR2nmwyZ-i0H3ULvYAfSVPzhzS6b5CM",
                           "Ed8JZAoTNZaU6JR2nmwyZ-i0H3ULvYAfSVPzhzS6b5CM",
                       ],
                       ot: 3,
                       n: "EYAfSVPzhzZ-i0d8JZAoTNZH3ULvaU6JR2nmwyS6b5CM",
                       bt: 1,
                       ba: ["DTNZH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8JZAo5CM"],
                       br: ["DH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8TNZJZAo5CM"])

        let data = try RNJSONEncoder().encode(_ort)
        let ser = String(data: data, encoding: .utf8)!
        let expected = """
        {"v":"KERI10JSON00011c_","t":"ort","d":"E0d8JJR2nmwyYAfZAoTNZH3ULvaU6Z-iSVPzhzS6b5CM","i":"EZAoTNZH3ULvaU6Z-i0d8JJR2nmwyYAfSVPzhzS6b5CM","s":"1","p":"EULvaU6JR2nmwyZ-i0d8JZAoTNZH3YAfSVPzhzS6b5CM","kt":"2","k":["Ed8JZAoTNZaU6JR2nmwyZ-i0H3ULvYAfSVPzhzS6b5CM","Ed8JZAoTNZaU6JR2nmwyZ-i0H3ULvYAfSVPzhzS6b5CM","Ed8JZAoTNZaU6JR2nmwyZ-i0H3ULvYAfSVPzhzS6b5CM"],"ot":"3","n":"EYAfSVPzhzZ-i0d8JZAoTNZH3ULvaU6JR2nmwyS6b5CM","bt":"1","ba":["DTNZH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8JZAo5CM"],"br":["DH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8TNZJZAo5CM"]}
        """
        XCTAssertEqual(ser, expected)

        let dec = try RNJSONDecoder().decode(ORT.self, from: Data(data))
        XCTAssertEqual(dec.v, "KERI10JSON00011c_")
        XCTAssertEqual(dec.t, Ilk.ort)
        XCTAssertEqual(dec.d, "E0d8JJR2nmwyYAfZAoTNZH3ULvaU6Z-iSVPzhzS6b5CM")
        XCTAssertEqual(dec.i, "EZAoTNZH3ULvaU6Z-i0d8JJR2nmwyYAfSVPzhzS6b5CM")
        XCTAssertEqual(dec.s, 1)
        XCTAssertEqual(dec.p, "EULvaU6JR2nmwyZ-i0d8JZAoTNZH3YAfSVPzhzS6b5CM")
        XCTAssertEqual(dec.kt, 2)
        XCTAssertEqual(dec.k, ["Ed8JZAoTNZaU6JR2nmwyZ-i0H3ULvYAfSVPzhzS6b5CM",
                               "Ed8JZAoTNZaU6JR2nmwyZ-i0H3ULvYAfSVPzhzS6b5CM",
                               "Ed8JZAoTNZaU6JR2nmwyZ-i0H3ULvYAfSVPzhzS6b5CM"])
        XCTAssertEqual(dec.ot, 3)
        XCTAssertEqual(dec.n, "EYAfSVPzhzZ-i0d8JZAoTNZH3ULvaU6JR2nmwyS6b5CM")
        XCTAssertEqual(dec.bt, 1)
        XCTAssertEqual(dec.ba, ["DTNZH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8JZAo5CM"])
        XCTAssertEqual(dec.br, ["DH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8TNZJZAo5CM"])
    }

    func testIXN() throws {
        let _ixn = IXN(v: "KERI10JSON00011c_",
                       t: Ilk.ixn,
                       d: "E0d8JJR2nmwyYAfZAoTNZH3ULvaU6Z-iSVPzhzS6b5CM",
                       i: "EZAoTNZH3ULvaU6Z-i0d8JJR2nmwyYAfSVPzhzS6b5CM",
                       s: 2,
                       p: "EULvaU6JR2nmwyZ-i0d8JZAoTNZH3YAfSVPzhzS6b5CM",
                       a: [EventSeal(
                           d: "ELvaU6Z-i0d8JJR2nmwyYAZAoTNZH3UfSVPzhzS6b5CM",
                           i: "EJJR2nmwyYAfSVPzhzS6b5CMZAoTNZH3ULvaU6Z-i0d8",
                           s: 1
                       )])

        let data = try RNJSONEncoder().encode(_ixn)
        let ser = String(data: data, encoding: .utf8)!
        let expected = """
        {"v":"KERI10JSON00011c_","t":"ixn","d":"E0d8JJR2nmwyYAfZAoTNZH3ULvaU6Z-iSVPzhzS6b5CM","i":"EZAoTNZH3ULvaU6Z-i0d8JJR2nmwyYAfSVPzhzS6b5CM","s":"2","p":"EULvaU6JR2nmwyZ-i0d8JZAoTNZH3YAfSVPzhzS6b5CM","a":[{"d":"ELvaU6Z-i0d8JJR2nmwyYAZAoTNZH3UfSVPzhzS6b5CM","i":"EJJR2nmwyYAfSVPzhzS6b5CMZAoTNZH3ULvaU6Z-i0d8","s":"1"}]}
        """
        XCTAssertEqual(ser, expected)

        let dec = try RNJSONDecoder().decode(IXN.self, from: Data(data))
        XCTAssertEqual(dec.v, "KERI10JSON00011c_")
        XCTAssertEqual(dec.t, Ilk.ixn)
        XCTAssertEqual(dec.d, "E0d8JJR2nmwyYAfZAoTNZH3ULvaU6Z-iSVPzhzS6b5CM")
        XCTAssertEqual(dec.i, "EZAoTNZH3ULvaU6Z-i0d8JJR2nmwyYAfSVPzhzS6b5CM")
        XCTAssertEqual(dec.s, 2)
        XCTAssertEqual(dec.p, "EULvaU6JR2nmwyZ-i0d8JZAoTNZH3YAfSVPzhzS6b5CM")
        XCTAssertEqual(dec.a.count, 1)

        let _a = dec.a[0]
        XCTAssertEqual(_a.d, "ELvaU6Z-i0d8JJR2nmwyYAZAoTNZH3UfSVPzhzS6b5CM")
        XCTAssertEqual(_a.i, "EJJR2nmwyYAfSVPzhzS6b5CMZAoTNZH3ULvaU6Z-i0d8")
        XCTAssertEqual(_a.s, 1)
    }

    func testDIP() throws {
        let _dip = DIP(
            v: "KERI10JSON00011c_",
            t: Ilk.dip,
            d: "E0d8JJR2nmwyYAfZAoTNZH3ULvaU6Z-iSVPzhzS6b5CM",
            i: "EJJR2nmwyYAfSVPzhzS6b5CMZAoTNZH3ULvaU6Z-i0d8",
            s: 0,
            kt: 1,
            k: ["DaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM"],
            n: "EZ-i0d8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM",
            bt: 1,
            b: ["DTNZH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8JZAo5CM"],
            c: ["DND"],
            di: "EZAoTNZH3ULvaU6Z-i0d8JJR2nmwyYAfSVPzhzS6b5CM"
        )

        let data = try RNJSONEncoder().encode(_dip)
        let expected = """
        {"v":"KERI10JSON00011c_","t":"dip","d":"E0d8JJR2nmwyYAfZAoTNZH3ULvaU6Z-iSVPzhzS6b5CM","i":"EJJR2nmwyYAfSVPzhzS6b5CMZAoTNZH3ULvaU6Z-i0d8","s":"0","kt":"1","k":["DaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM"],"n":"EZ-i0d8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM","bt":"1","b":["DTNZH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8JZAo5CM"],"c":["DND"],"di":"EZAoTNZH3ULvaU6Z-i0d8JJR2nmwyYAfSVPzhzS6b5CM"}
        """
        let ser = String(data: data, encoding: .utf8)!
        XCTAssertEqual(ser, expected)

        let dec = try RNJSONDecoder().decode(DIP.self, from: Data(data))
        XCTAssertEqual(dec.v, "KERI10JSON00011c_")
        XCTAssertEqual(dec.t, Ilk.dip)
        XCTAssertEqual(dec.d, "E0d8JJR2nmwyYAfZAoTNZH3ULvaU6Z-iSVPzhzS6b5CM")
        XCTAssertEqual(dec.i, "EJJR2nmwyYAfSVPzhzS6b5CMZAoTNZH3ULvaU6Z-i0d8")
        XCTAssertEqual(dec.s, 0)
        XCTAssertEqual(dec.kt, 1)
        XCTAssertEqual(dec.k, ["DaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM"])
        XCTAssertEqual(dec.n, "EZ-i0d8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM")
        XCTAssertEqual(dec.bt, 1)
        XCTAssertEqual(dec.b, ["DTNZH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8JZAo5CM"])
        XCTAssertEqual(dec.c, ["DND"])
        XCTAssertEqual(dec.di, "EZAoTNZH3ULvaU6Z-i0d8JJR2nmwyYAfSVPzhzS6b5CM")
    }

    func testDRT() throws {
        let _drt = DRT(
            v: "KERI10JSON00011c_",
            t: Ilk.drt,
            d: "E0d8JJR2nmwyYAfZAoTNZH3ULvaU6Z-iSVPzhzS6b5CM",
            i: "EZAoTNZH3ULvaU6Z-i0d8JJR2nmwyYAfSVPzhzS6b5CM",
            s: 1,
            p: "EULvaU6JR2nmwyZ-i0d8JZAoTNZH3YAfSVPzhzS6b5CM",
            kt: 1,
            k: ["EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM"],
            n: "EYAfSVPzhzZ-i0d8JZAoTNZH3ULvaU6JR2nmwyS6b5CM",
            bt: 1,
            ba: ["DTNZH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8JZAo5CM"],
            br: ["DH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8TNZJZAo5CM"],
            di: "EJJR2nmwyYAZAoTNZH3ULvaU6Z-i0d8fSVPzhzS6b5CM"
        )

        let data = try RNJSONEncoder().encode(_drt)
        let expected = """
        {"v":"KERI10JSON00011c_","t":"drt","d":"E0d8JJR2nmwyYAfZAoTNZH3ULvaU6Z-iSVPzhzS6b5CM","i":"EZAoTNZH3ULvaU6Z-i0d8JJR2nmwyYAfSVPzhzS6b5CM","s":"1","p":"EULvaU6JR2nmwyZ-i0d8JZAoTNZH3YAfSVPzhzS6b5CM","kt":"1","k":["EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM"],"n":"EYAfSVPzhzZ-i0d8JZAoTNZH3ULvaU6JR2nmwyS6b5CM","bt":"1","ba":["DTNZH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8JZAo5CM"],"br":["DH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8TNZJZAo5CM"],"di":"EJJR2nmwyYAZAoTNZH3ULvaU6Z-i0d8fSVPzhzS6b5CM"}
        """
        let ser = String(data: data, encoding: .utf8)!
        XCTAssertEqual(ser, expected)

        let dec = try RNJSONDecoder().decode(DRT.self, from: Data(data))
        XCTAssertEqual(dec.v, "KERI10JSON00011c_")
        XCTAssertEqual(dec.t, Ilk.drt)
        XCTAssertEqual(dec.d, "E0d8JJR2nmwyYAfZAoTNZH3ULvaU6Z-iSVPzhzS6b5CM")
        XCTAssertEqual(dec.i, "EZAoTNZH3ULvaU6Z-i0d8JJR2nmwyYAfSVPzhzS6b5CM")
        XCTAssertEqual(dec.s, 1)
        XCTAssertEqual(dec.p, "EULvaU6JR2nmwyZ-i0d8JZAoTNZH3YAfSVPzhzS6b5CM")
        XCTAssertEqual(dec.kt, 1)
        XCTAssertEqual(dec.k, ["EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM"])
        XCTAssertEqual(dec.n, "EYAfSVPzhzZ-i0d8JZAoTNZH3ULvaU6JR2nmwyS6b5CM")
        XCTAssertEqual(dec.bt, 1)
        XCTAssertEqual(dec.ba, ["DTNZH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8JZAo5CM"])
        XCTAssertEqual(dec.br, ["DH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8TNZJZAo5CM"])
        XCTAssertEqual(dec.di, "EJJR2nmwyYAZAoTNZH3ULvaU6Z-i0d8fSVPzhzS6b5CM")
    }

    func testDOR() throws {
        let _dor = DOR(
            v: "KERI10JSON00011c_",
            t: Ilk.dor,
            d: "E0d8JJR2nmwyYAfZAoTNZH3ULvaU6Z-iSVPzhzS6b5CM",
            i: "EZAoTNZH3ULvaU6Z-i0d8JJR2nmwyYAfSVPzhzS6b5CM",
            s: 1,
            p: "EULvaU6JR2nmwyZ-i0d8JZAoTNZH3YAfSVPzhzS6b5CM",
            kt: 2,
            k: [
                "Ed8JZAoTNZaU6JR2nmwyZ-i0H3ULvYAfSVPzhzS6b5CM",
                "Ed8JZAoTNZaU6JR2nmwyZ-i0H3ULvYAfSVPzhzS6b5CM",
                "Ed8JZAoTNZaU6JR2nmwyZ-i0H3ULvYAfSVPzhzS6b5CM",
            ],
            ot: 3,
            n: "EYAfSVPzhzZ-i0d8JZAoTNZH3ULvaU6JR2nmwyS6b5CM",
            bt: 1,
            ba: ["DTNZH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8JZAo5CM"],
            br: ["DH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8TNZJZAo5CM"],
            di: "EJJR2nmwyYAZAoTNZH3ULvaU6Z-i0d8fSVPzhzS6b5CM"
        )

        let data = try RNJSONEncoder().encode(_dor)
        let expected = """
        {"v":"KERI10JSON00011c_","t":"dor","d":"E0d8JJR2nmwyYAfZAoTNZH3ULvaU6Z-iSVPzhzS6b5CM","i":"EZAoTNZH3ULvaU6Z-i0d8JJR2nmwyYAfSVPzhzS6b5CM","s":"1","p":"EULvaU6JR2nmwyZ-i0d8JZAoTNZH3YAfSVPzhzS6b5CM","kt":"2","k":["Ed8JZAoTNZaU6JR2nmwyZ-i0H3ULvYAfSVPzhzS6b5CM","Ed8JZAoTNZaU6JR2nmwyZ-i0H3ULvYAfSVPzhzS6b5CM","Ed8JZAoTNZaU6JR2nmwyZ-i0H3ULvYAfSVPzhzS6b5CM"],"ot":"3","n":"EYAfSVPzhzZ-i0d8JZAoTNZH3ULvaU6JR2nmwyS6b5CM","bt":"1","ba":["DTNZH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8JZAo5CM"],"br":["DH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8TNZJZAo5CM"],"di":"EJJR2nmwyYAZAoTNZH3ULvaU6Z-i0d8fSVPzhzS6b5CM"}
        """
        let ser = String(data: data, encoding: .utf8)!
        XCTAssertEqual(ser, expected)

        let dec = try RNJSONDecoder().decode(DOR.self, from: Data(data))
        XCTAssertEqual(dec.v, "KERI10JSON00011c_")
        XCTAssertEqual(dec.t, Ilk.dor)
        XCTAssertEqual(dec.d, "E0d8JJR2nmwyYAfZAoTNZH3ULvaU6Z-iSVPzhzS6b5CM")
        XCTAssertEqual(dec.i, "EZAoTNZH3ULvaU6Z-i0d8JJR2nmwyYAfSVPzhzS6b5CM")
        XCTAssertEqual(dec.s, 1)
        XCTAssertEqual(dec.p, "EULvaU6JR2nmwyZ-i0d8JZAoTNZH3YAfSVPzhzS6b5CM")
        XCTAssertEqual(dec.kt, 2)
        XCTAssertEqual(dec.k, [
            "Ed8JZAoTNZaU6JR2nmwyZ-i0H3ULvYAfSVPzhzS6b5CM",
            "Ed8JZAoTNZaU6JR2nmwyZ-i0H3ULvYAfSVPzhzS6b5CM",
            "Ed8JZAoTNZaU6JR2nmwyZ-i0H3ULvYAfSVPzhzS6b5CM",
        ])
        XCTAssertEqual(dec.ot, 3)
        XCTAssertEqual(dec.n, "EYAfSVPzhzZ-i0d8JZAoTNZH3ULvaU6JR2nmwyS6b5CM")
        XCTAssertEqual(dec.bt, 1)
        XCTAssertEqual(dec.ba, ["DTNZH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8JZAo5CM"])
        XCTAssertEqual(dec.br, ["DH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8TNZJZAo5CM"])
        XCTAssertEqual(dec.di, "EJJR2nmwyYAZAoTNZH3ULvaU6Z-i0d8fSVPzhzS6b5CM")
    }

    func testRCT() throws {
        let _rct = RCT(
            v: "KERI10JSON00011c_",
            t: Ilk.rct,
            d: "DZ-i0d8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM",
            i: "AaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM",
            s: 1
        )

        let data = try RNJSONEncoder().encode(_rct)
        let expected = """
        {"v":"KERI10JSON00011c_","t":"rct","d":"DZ-i0d8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM","i":"AaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM","s":"1"}
        """
        let ser = String(data: data, encoding: .utf8)!
        XCTAssertEqual(ser, expected)

        let dec = try RNJSONDecoder().decode(RCT.self, from: Data(data))
        XCTAssertEqual(dec.v, "KERI10JSON00011c_")
        XCTAssertEqual(dec.t, Ilk.rct)
        XCTAssertEqual(dec.d, "DZ-i0d8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM")
        XCTAssertEqual(dec.i, "AaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM")
        XCTAssertEqual(dec.s, 1)
    }

    func testVRC() throws {
        let _vrc = VRC(
            v: "KERI10JSON00011c_",
            t: Ilk.vrc,
            d: "DZ-i0d8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM",
            i: "AaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM",
            s: 1,
            a: EventSeal(
                d: "DZ-i0d8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM",
                i: "AYAfSVPzhzS6b5CMaU6JR2nmwyZ-i0d8JZAoTNZH3ULv",
                s: 4
            )
        )

        let data = try RNJSONEncoder().encode(_vrc)
        let expected = """
        {"v":"KERI10JSON00011c_","t":"vrc","d":"DZ-i0d8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM","i":"AaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM","s":"1","a":{"d":"DZ-i0d8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM","i":"AYAfSVPzhzS6b5CMaU6JR2nmwyZ-i0d8JZAoTNZH3ULv","s":"4"}}
        """
        let ser = String(data: data, encoding: .utf8)!
        XCTAssertEqual(ser, expected)

        let dec = try RNJSONDecoder().decode(VRC.self, from: Data(data))
        XCTAssertEqual(dec.v, "KERI10JSON00011c_")
        XCTAssertEqual(dec.t, Ilk.vrc)
        XCTAssertEqual(dec.d, "DZ-i0d8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM")
        XCTAssertEqual(dec.i, "AaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM")
        XCTAssertEqual(dec.s, 1)
        XCTAssertEqual(dec.a.d, "DZ-i0d8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM")
        XCTAssertEqual(dec.a.i, "AYAfSVPzhzS6b5CMaU6JR2nmwyZ-i0d8JZAoTNZH3ULv")
        XCTAssertEqual(dec.a.s, 4)
    }

    func testDigestSeal() throws {
        let _seal = DigestSeal(d: "DZ-i0d8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM")
        let data = try RNJSONEncoder().encode(_seal)
        let expected = """
        {"d":"DZ-i0d8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM"}
        """
        let ser = String(data: data, encoding: .utf8)!
        XCTAssertEqual(ser, expected)

        let dec = try RNJSONDecoder().decode(DigestSeal.self, from: Data(data))
        XCTAssertEqual(dec.d, "DZ-i0d8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM")
    }

    func testMerkleTreeRootDigestSeal() throws {
        let _seal = MerkleTreeRootDigestSeal(rd: "DZ-i0d8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM")
        let data = try RNJSONEncoder().encode(_seal)
        let expected = """
        {"rd":"DZ-i0d8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM"}
        """
        let ser = String(data: data, encoding: .utf8)!
        XCTAssertEqual(ser, expected)

        let dec = try RNJSONDecoder().decode(MerkleTreeRootDigestSeal.self, from: Data(data))
        XCTAssertEqual(dec.rd, "DZ-i0d8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM")
    }

    func testRegistrarSeal() throws {
        let _seal = RegistrarSeal(d: "EZAoTNZH3ULvaU6Z-i0d8JJR2nmwyYAfSVPzhzS6b5CM", bi: "DZ-i0d8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM")
        let data = try RNJSONEncoder().encode(_seal)
        let expected = """
        {"d":"EZAoTNZH3ULvaU6Z-i0d8JJR2nmwyYAfSVPzhzS6b5CM","bi":"DZ-i0d8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM"}
        """
        let ser = String(data: data, encoding: .utf8)!
        XCTAssertEqual(ser, expected)

        let dec = try RNJSONDecoder().decode(RegistrarSeal.self, from: Data(data))
        XCTAssertEqual(dec.d, "EZAoTNZH3ULvaU6Z-i0d8JJR2nmwyYAfSVPzhzS6b5CM")
        XCTAssertEqual(dec.bi, "DZ-i0d8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM")
    }

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

    func testExpose() throws {
        let _exp = ExposeMessage(
            v: "KERI10JSON00011c_",
            t: Ilk.exp,
            d: "EZ-i0d8JZAoTNZH3ULaU6JR2nmwyvYAfSVPzhzS6b5CM",
            r: "sealed/processor",
            a: A(
                d: "EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM",
                i: "EAoTNZH3ULvYAfSVPzhzS6baU6JR2nmwyZ-i0d8JZ5CM",
                dt: "2022-02-24T16:11:43.903Z".iso8601WithFractionalSeconds!,
                name: "John Jones",
                role: "Founder"
            )
        )

        let data = try RNJSONEncoder().encode(_exp)
        let expected = """
        {"v":"KERI10JSON00011c_","t":"exp","d":"EZ-i0d8JZAoTNZH3ULaU6JR2nmwyvYAfSVPzhzS6b5CM","r":"sealed\\/processor","a":{"d":"EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM","i":"EAoTNZH3ULvYAfSVPzhzS6baU6JR2nmwyZ-i0d8JZ5CM","dt":"2022-02-24T16:11:43.903Z","name":"John Jones","role":"Founder"}}
        """
        let ser = String(data: data, encoding: .utf8)!
        XCTAssertEqual(ser, expected)

        let dec = try RNJSONDecoder().decode(ExposeMessage.self, from: Data(data))
        XCTAssertEqual(dec.v, "KERI10JSON00011c_")
        XCTAssertEqual(dec.t, Ilk.exp)
        XCTAssertEqual(dec.d, "EZ-i0d8JZAoTNZH3ULaU6JR2nmwyvYAfSVPzhzS6b5CM")
        XCTAssertEqual(dec.r, "sealed/processor")
        XCTAssertEqual(dec.a.d, "EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM")
        XCTAssertEqual(dec.a.i, "EAoTNZH3ULvYAfSVPzhzS6baU6JR2nmwyZ-i0d8JZ5CM")
        XCTAssertEqual(dec.a.name, "John Jones")
        XCTAssertEqual(dec.a.role, "Founder")
    }

    func testExchange() throws {
        let _exp = ExchangeMessage(
            v: "KERI10JSON00006a_",
            t: Ilk.exn,
            d: "EF3Dd96ATbbMIZgUBBwuFAWx3_8s5XSt_0jeyCRXq_bM",
            dt: "2022-02-24T16:11:43.903Z".iso8601WithFractionalSeconds!,
            r: "/echo",
            rr: "/echo/response",
            a: Exchange(
                msg: "test"
            )
        )

        let data = try RNJSONEncoder().encode(_exp)
        let expected = """
        {"v":"KERI10JSON00006a_","t":"exn","d":"EF3Dd96ATbbMIZgUBBwuFAWx3_8s5XSt_0jeyCRXq_bM","dt":"2022-02-24T16:11:43.903Z","r":"\\/echo","rr":"\\/echo\\/response","a":{"msg":"test"}}
        """
        let ser = String(data: data, encoding: .utf8)!
        XCTAssertEqual(ser, expected)

        let dec = try RNJSONDecoder().decode(ExchangeMessage.self, from: Data(data))
        XCTAssertEqual(dec.v, "KERI10JSON00006a_")
        XCTAssertEqual(dec.t, Ilk.exn)
        XCTAssertEqual(dec.d, "EF3Dd96ATbbMIZgUBBwuFAWx3_8s5XSt_0jeyCRXq_bM")
        XCTAssertEqual(dec.r, "/echo")
        XCTAssertEqual(dec.rr, "/echo/response")
        XCTAssertEqual(dec.a.msg, "test")
    }

    func testKeyStateNotification() throws {
        let _ksn = KeyStateNotification(
            v: "KERI10JSON0001d9_",
            d: "EYk4PigtRsCd5W2so98c8r8aeRHoixJK7ntv9mTrZPmM",
            i: "E4BsxCYUtUx3d6UkDVIQ9Ke3CLQfqWBfICSmjIzkS1u4",
            s: 0,
            p: "Prior Event Digest",
            f: 0,
            dt: "2022-02-24T16:11:43.903Z".iso8601WithFractionalSeconds!,
            et: Ilk.icp,
            kt: 1,
            k: ["DqI2cOZ06RwGNwCovYUWExmdKU983IasmUKMmZflvWdQ"],
            n: "E7FuL3Z_KBgt_QAwuZi1lUFNC69wvyHSxnMFUsKjZHss",
            bt: 1,
            b: ["BFUOWBaJz-sB_6b-_u_P9W8hgBQ8Su9mAtN9cY2sVGiY"],
            c: ["List of Configuration Traits"],
            ee: EstablishmentEvent(s: 0, d: "EYk4PigtRsCd5W2so98c8r8aeRHoixJK7ntv9mTrZPmM", br: ["br"], ba: ["ba"]),
            di: "Delegator Identifier Prefix"
        )

        let data = try RNJSONEncoder().encode(_ksn)
        let expected = """
        {"v":"KERI10JSON0001d9_","d":"EYk4PigtRsCd5W2so98c8r8aeRHoixJK7ntv9mTrZPmM","i":"E4BsxCYUtUx3d6UkDVIQ9Ke3CLQfqWBfICSmjIzkS1u4","s":"0","p":"Prior Event Digest","f":"0","dt":"2022-02-24T16:11:43.903Z","et":"icp","kt":"1","k":["DqI2cOZ06RwGNwCovYUWExmdKU983IasmUKMmZflvWdQ"],"n":"E7FuL3Z_KBgt_QAwuZi1lUFNC69wvyHSxnMFUsKjZHss","bt":"1","b":["BFUOWBaJz-sB_6b-_u_P9W8hgBQ8Su9mAtN9cY2sVGiY"],"c":["List of Configuration Traits"],"ee":{"s":"0","d":"EYk4PigtRsCd5W2so98c8r8aeRHoixJK7ntv9mTrZPmM","br":["br"],"ba":["ba"]},"di":"Delegator Identifier Prefix"}
        """
        let ser = String(data: data, encoding: .utf8)!
        XCTAssertEqual(ser, expected)

        let dec = try RNJSONDecoder().decode(KeyStateNotification.self, from: Data(data))
        XCTAssertEqual(dec.v, "KERI10JSON0001d9_")
        XCTAssertEqual(dec.d, "EYk4PigtRsCd5W2so98c8r8aeRHoixJK7ntv9mTrZPmM")
        XCTAssertEqual(dec.i, "E4BsxCYUtUx3d6UkDVIQ9Ke3CLQfqWBfICSmjIzkS1u4")
        XCTAssertEqual(dec.s, 0)
        XCTAssertEqual(dec.p, "Prior Event Digest")
        XCTAssertEqual(dec.f, 0)
        XCTAssertEqual(dec.dt, "2022-02-24T16:11:43.903Z".iso8601WithFractionalSeconds!)
        XCTAssertEqual(dec.et, Ilk.icp)
        XCTAssertEqual(dec.kt, 1)
        XCTAssertEqual(dec.k.count, 1)
        XCTAssertEqual(dec.k, ["DqI2cOZ06RwGNwCovYUWExmdKU983IasmUKMmZflvWdQ"])
        XCTAssertEqual(dec.n, "E7FuL3Z_KBgt_QAwuZi1lUFNC69wvyHSxnMFUsKjZHss")
        XCTAssertEqual(dec.bt, 1)
        XCTAssertEqual(dec.b, ["BFUOWBaJz-sB_6b-_u_P9W8hgBQ8Su9mAtN9cY2sVGiY"])
        XCTAssertEqual(dec.c, ["List of Configuration Traits"])
        XCTAssertEqual(dec.ee.s, 0)
        XCTAssertEqual(dec.ee.d, "EYk4PigtRsCd5W2so98c8r8aeRHoixJK7ntv9mTrZPmM")
        XCTAssertEqual(dec.ee.br, ["br"])
        XCTAssertEqual(dec.ee.ba, ["ba"])
        XCTAssertEqual(dec.di, "Delegator Identifier Prefix")
    }

    func testTransactionStateNotification() throws {
        let _tsn = TransactionStateNotice(
            v: "KERI10JSON0001b0_",
            d: "EpltHxeKueSR1a7e0_oSAhgO6U7VDnX7x4KqNCwBqbI0",
            i: "EoN_Ln_JpgqsIys-jDOH8oWdxgWqs7hzkDGeLWHb9vSY",
            s: 1,
            ii: "EaKJ0FoLxO1TYmyuprguKO7kJ7Hbn0m0Wuk5aMtSrMtY",
            dt: "2022-02-24T16:11:43.903Z".iso8601WithFractionalSeconds!,
            et: Ilk.vrt,
            a: PhilsSeal(s: 2, d: "Ef12IRHtb_gVo5ClaHHNV90b43adA0f8vRs3jeU-AstY"),
            bt: 1,
            br: ["br"],
            ba: ["BwFbQvUaS4EirvZVPUav7R_KDHB8AKmSfXNpWnZU_YEU"],
            b: ["BwFbQvUaS4EirvZVPUav7R_KDHB8AKmSfXNpWnZU_YEU"],
            c: ["c"]
        )

        let data = try RNJSONEncoder().encode(_tsn)
        let expected = """
        {"v":"KERI10JSON0001b0_","d":"EpltHxeKueSR1a7e0_oSAhgO6U7VDnX7x4KqNCwBqbI0","i":"EoN_Ln_JpgqsIys-jDOH8oWdxgWqs7hzkDGeLWHb9vSY","s":"1","ii":"EaKJ0FoLxO1TYmyuprguKO7kJ7Hbn0m0Wuk5aMtSrMtY","dt":"2022-02-24T16:11:43.903Z","et":"vrt","a":{"s":"2","d":"Ef12IRHtb_gVo5ClaHHNV90b43adA0f8vRs3jeU-AstY"},"bt":"1","br":["br"],"ba":["BwFbQvUaS4EirvZVPUav7R_KDHB8AKmSfXNpWnZU_YEU"],"b":["BwFbQvUaS4EirvZVPUav7R_KDHB8AKmSfXNpWnZU_YEU"],"c":["c"]}
        """
        let ser = String(data: data, encoding: .utf8)!
        XCTAssertEqual(ser, expected)

        let dec = try RNJSONDecoder().decode(TransactionStateNotice.self, from: Data(data))
        XCTAssertEqual(dec.v, "KERI10JSON0001b0_")
        XCTAssertEqual(dec.d, "EpltHxeKueSR1a7e0_oSAhgO6U7VDnX7x4KqNCwBqbI0")
        XCTAssertEqual(dec.i, "EoN_Ln_JpgqsIys-jDOH8oWdxgWqs7hzkDGeLWHb9vSY")
        XCTAssertEqual(dec.s, 1)
        XCTAssertEqual(dec.ii, "EaKJ0FoLxO1TYmyuprguKO7kJ7Hbn0m0Wuk5aMtSrMtY")
        XCTAssertEqual(dec.dt, "2022-02-24T16:11:43.903Z".iso8601WithFractionalSeconds!)
        XCTAssertEqual(dec.et, Ilk.vrt)
        XCTAssertEqual(dec.a.s, 2)
        XCTAssertEqual(dec.a.d, "Ef12IRHtb_gVo5ClaHHNV90b43adA0f8vRs3jeU-AstY")
        XCTAssertEqual(dec.bt, 1)
        XCTAssertEqual(dec.br, ["br"])
        XCTAssertEqual(dec.ba, ["BwFbQvUaS4EirvZVPUav7R_KDHB8AKmSfXNpWnZU_YEU"])
        XCTAssertEqual(dec.b, ["BwFbQvUaS4EirvZVPUav7R_KDHB8AKmSfXNpWnZU_YEU"])
        XCTAssertEqual(dec.c, ["c"])
    }

    func testRegistryInception() throws {
        let _ri = RegistryInception(
            v: "KERI10JSON00011c_",
            t: Ilk.vcp,
            d: "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A",
            i: "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A",
            ii: "EJJR2nmwyYAfSVPzhzS6b5CMZAoTNZH3ULvaU6Z-i0d8",
            s: 0,
            bt: 1,
            b: ["BbIg_3-11d3PYxSInLN-Q9_T2axD6kkXd3XRgbGZTm6s"],
            c: ["NB"]
        )

        let data = try RNJSONEncoder().encode(_ri)
        let expected = """
        {"v":"KERI10JSON00011c_","t":"vcp","d":"ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A","i":"ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A","ii":"EJJR2nmwyYAfSVPzhzS6b5CMZAoTNZH3ULvaU6Z-i0d8","s":"0","bt":"1","b":["BbIg_3-11d3PYxSInLN-Q9_T2axD6kkXd3XRgbGZTm6s"],"c":["NB"]}
        """
        let ser = String(data: data, encoding: .utf8)!
        XCTAssertEqual(ser, expected)

        let dec = try RNJSONDecoder().decode(RegistryInception.self, from: Data(data))
        XCTAssertEqual(dec.v, "KERI10JSON00011c_")
        XCTAssertEqual(dec.d, "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A")
        XCTAssertEqual(dec.t, Ilk.vcp)
        XCTAssertEqual(dec.i, "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A")
        XCTAssertEqual(dec.ii, "EJJR2nmwyYAfSVPzhzS6b5CMZAoTNZH3ULvaU6Z-i0d8")
        XCTAssertEqual(dec.s, 0)
        XCTAssertEqual(dec.bt, 1)
        XCTAssertEqual(dec.b, ["BbIg_3-11d3PYxSInLN-Q9_T2axD6kkXd3XRgbGZTm6s"])
        XCTAssertEqual(dec.c, ["NB"])
    }

    func testRegistryRotation() throws {
        let _rr = RegistryRotation(
            v: "KERI10JSON00011c_",
            t: Ilk.vrt,
            d: "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A",
            i: "E_D0eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqA7BxL",
            s: 2,
            p: "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A",
            bt: 1,
            br: ["BbIg_3-11d3PYxSInLN-Q9_T2axD6kkXd3XRgbGZTm6s"],
            ba: ["ba"]
        )

        let data = try RNJSONEncoder().encode(_rr)
        let expected = """
        {"v":"KERI10JSON00011c_","t":"vrt","d":"ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A","i":"E_D0eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqA7BxL","s":"2","p":"ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A","bt":"1","br":["BbIg_3-11d3PYxSInLN-Q9_T2axD6kkXd3XRgbGZTm6s"],"ba":["ba"]}
        """
        let ser = String(data: data, encoding: .utf8)!
        XCTAssertEqual(ser, expected)

        let dec = try RNJSONDecoder().decode(RegistryRotation.self, from: Data(data))
        XCTAssertEqual(dec.v, "KERI10JSON00011c_")
        XCTAssertEqual(dec.t, Ilk.vrt)
        XCTAssertEqual(dec.d, "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A")
        XCTAssertEqual(dec.i, "E_D0eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqA7BxL")
        XCTAssertEqual(dec.s, 2)
        XCTAssertEqual(dec.p, "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A")
        XCTAssertEqual(dec.bt, 1)
        XCTAssertEqual(dec.br, ["BbIg_3-11d3PYxSInLN-Q9_T2axD6kkXd3XRgbGZTm6s"])
        XCTAssertEqual(dec.ba, ["ba"])
    }

    func testBackerlessCredentialIssuance() throws {
        let _bci = BackerlessCredentialIssuance(
            v: "KERI10JSON00011c_",
            t: Ilk.iss,
            d: "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A",
            i: "E_D0eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqA7BxL",
            s: 0,
            ri: "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A",
            dt: "2022-02-24T16:11:43.903Z".iso8601WithFractionalSeconds!
        )

        let data = try RNJSONEncoder().encode(_bci)
        let expected = """
        {"v":"KERI10JSON00011c_","t":"iss","d":"ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A","i":"E_D0eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqA7BxL","s":"0","ri":"ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A","dt":"2022-02-24T16:11:43.903Z"}
        """
        let ser = String(data: data, encoding: .utf8)!
        XCTAssertEqual(ser, expected)

        let dec = try RNJSONDecoder().decode(BackerlessCredentialIssuance.self, from: Data(data))
        XCTAssertEqual(dec.v, "KERI10JSON00011c_")
        XCTAssertEqual(dec.t, Ilk.iss)
        XCTAssertEqual(dec.d, "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A")
        XCTAssertEqual(dec.i, "E_D0eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqA7BxL")
        XCTAssertEqual(dec.s, 0)
        XCTAssertEqual(dec.ri, "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A")
        XCTAssertEqual(dec.dt, "2022-02-24T16:11:43.903Z".iso8601WithFractionalSeconds!)
    }

    func testBackerlessCredentialRevocation() throws {
        let _bci = BackerlessCredentialRevocation(
            v: "KERI10JSON00011c_",
            t: Ilk.rev,
            d: "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A",
            i: "E_D0eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqA7BxL",
            s: 1,
            p: "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A",
            ri: "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A",
            dt: "2022-02-24T16:11:43.903Z".iso8601WithFractionalSeconds!
        )

        let data = try RNJSONEncoder().encode(_bci)
        let expected = """
        {"v":"KERI10JSON00011c_","t":"rev","d":"ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A","i":"E_D0eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqA7BxL","s":"1","p":"ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A","ri":"ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A","dt":"2022-02-24T16:11:43.903Z"}
        """
        let ser = String(data: data, encoding: .utf8)!
        XCTAssertEqual(ser, expected)

        let dec = try RNJSONDecoder().decode(BackerlessCredentialRevocation.self, from: Data(data))
        XCTAssertEqual(dec.v, "KERI10JSON00011c_")
        XCTAssertEqual(dec.t, Ilk.rev)
        XCTAssertEqual(dec.d, "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A")
        XCTAssertEqual(dec.i, "E_D0eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqA7BxL")
        XCTAssertEqual(dec.s, 1)
        XCTAssertEqual(dec.p, "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A")
        XCTAssertEqual(dec.ri, "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A")
        XCTAssertEqual(dec.dt, "2022-02-24T16:11:43.903Z".iso8601WithFractionalSeconds!)
    }

    func testBackedCredentialIssuance() throws {
        let _bci = BackedCredentialIssuance(
            v: "KERI10JSON00011c_",
            t: Ilk.bis,
            d: "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A",
            i: "E_D0eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqA7BxL",
            s: 0,
            ri: "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A",
            ra: EventSeal(
                d: "E8ipype17kJlQfYp3gcF3F1PNKfdX6vpOLXU8YyykB5o",
                i: "EFvQCx4-O9bb9fGzY7KgbPeUtjtU0M4OBQWsiIk8za24",
                s: 0
            ),
            dt: "2022-02-24T16:11:43.903Z".iso8601WithFractionalSeconds!
        )

        let data = try RNJSONEncoder().encode(_bci)
        let expected = """
        {"v":"KERI10JSON00011c_","t":"bis","d":"ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A","i":"E_D0eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqA7BxL","s":"0","ri":"ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A","ra":{"d":"E8ipype17kJlQfYp3gcF3F1PNKfdX6vpOLXU8YyykB5o","i":"EFvQCx4-O9bb9fGzY7KgbPeUtjtU0M4OBQWsiIk8za24","s":"0"},"dt":"2022-02-24T16:11:43.903Z"}
        """
        let ser = String(data: data, encoding: .utf8)!
        XCTAssertEqual(ser, expected)

        let dec = try RNJSONDecoder().decode(BackedCredentialIssuance.self, from: Data(data))
        XCTAssertEqual(dec.v, "KERI10JSON00011c_")
        XCTAssertEqual(dec.t, Ilk.bis)
        XCTAssertEqual(dec.d, "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A")
        XCTAssertEqual(dec.i, "E_D0eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqA7BxL")
        XCTAssertEqual(dec.s, 0)
        XCTAssertEqual(dec.ri, "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A")
        XCTAssertEqual(dec.ra.d, "E8ipype17kJlQfYp3gcF3F1PNKfdX6vpOLXU8YyykB5o")
        XCTAssertEqual(dec.ra.i, "EFvQCx4-O9bb9fGzY7KgbPeUtjtU0M4OBQWsiIk8za24")
        XCTAssertEqual(dec.ra.s, 0)
        XCTAssertEqual(dec.dt, "2022-02-24T16:11:43.903Z".iso8601WithFractionalSeconds!)
    }

    func testBackedCredentialRevocation() throws {
        let _bci = BackedCredentialRevocation(
            v: "KERI10JSON00011c_",
            t: Ilk.brv,
            d: "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A",
            i: "E_D0eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqA7BxL",
            s: 1,
            p: "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A",
            ri: "EvxMACzQxU2rDj-X5SPDZYtUn56i4fjjH8yDRFRzaMfI",
            ra: EventSeal(
                d: "E8ipype17kJlQfYp3gcF3F1PNKfdX6vpOLXU8YyykB5o",
                i: "EFvQCx4-O9bb9fGzY7KgbPeUtjtU0M4OBQWsiIk8za24",
                s: 0
            ),
            dt: "2022-02-24T16:11:43.903Z".iso8601WithFractionalSeconds!
        )

        let data = try RNJSONEncoder().encode(_bci)
        let expected = """
        {"v":"KERI10JSON00011c_","t":"brv","d":"ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A","i":"E_D0eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqA7BxL","s":"1","p":"ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A","ri":"EvxMACzQxU2rDj-X5SPDZYtUn56i4fjjH8yDRFRzaMfI","ra":{"d":"E8ipype17kJlQfYp3gcF3F1PNKfdX6vpOLXU8YyykB5o","i":"EFvQCx4-O9bb9fGzY7KgbPeUtjtU0M4OBQWsiIk8za24","s":"0"},"dt":"2022-02-24T16:11:43.903Z"}
        """
        let ser = String(data: data, encoding: .utf8)!
        XCTAssertEqual(ser, expected)

        let dec = try RNJSONDecoder().decode(BackedCredentialRevocation.self, from: Data(data))
        XCTAssertEqual(dec.v, "KERI10JSON00011c_")
        XCTAssertEqual(dec.t, Ilk.brv)
        XCTAssertEqual(dec.d, "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A")
        XCTAssertEqual(dec.i, "E_D0eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqA7BxL")
        XCTAssertEqual(dec.s, 1)
        XCTAssertEqual(dec.p, "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A")
        XCTAssertEqual(dec.ri, "EvxMACzQxU2rDj-X5SPDZYtUn56i4fjjH8yDRFRzaMfI")
        XCTAssertEqual(dec.ra.d, "E8ipype17kJlQfYp3gcF3F1PNKfdX6vpOLXU8YyykB5o")
        XCTAssertEqual(dec.ra.i, "EFvQCx4-O9bb9fGzY7KgbPeUtjtU0M4OBQWsiIk8za24")
        XCTAssertEqual(dec.ra.s, 0)
        XCTAssertEqual(dec.dt, "2022-02-24T16:11:43.903Z".iso8601WithFractionalSeconds!)
    }
}
