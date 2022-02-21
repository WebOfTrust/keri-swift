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
        let _icp = icp(v: "KERI10JSON00011c_",
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

        let dec = try RNJSONDecoder().decode(icp.self, from: Data(data))
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
        let _rot = rot(v: "KERI10JSON00011c_",
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
        print(String(data: data, encoding: .utf8)!)
        let ser = String(data: data, encoding: .utf8)!
        let expected = """
                       {"v":"KERI10JSON00011c_","t":"rot","d":"E0d8JJR2nmwyYAfZAoTNZH3ULvaU6Z-iSVPzhzS6b5CM","i":"EZAoTNZH3ULvaU6Z-i0d8JJR2nmwyYAfSVPzhzS6b5CM","s":"1","p":"EULvaU6JR2nmwyZ-i0d8JZAoTNZH3YAfSVPzhzS6b5CM","kt":"1","k":["EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM"],"n":"EYAfSVPzhzZ-i0d8JZAoTNZH3ULvaU6JR2nmwyS6b5CM","bt":"1","ba":["DTNZH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8JZAo5CM"],"br":["DH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8TNZJZAo5CM"]}
                       """
        XCTAssertEqual(ser, expected)

        let dec = try RNJSONDecoder().decode(rot.self, from: Data(data))
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
        let _ort = ort(v: "KERI10JSON00011c_",
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
        print(String(data: data, encoding: .utf8)!)
        let ser = String(data: data, encoding: .utf8)!
        let expected = """
                       {"v":"KERI10JSON00011c_","t":"ort","d":"E0d8JJR2nmwyYAfZAoTNZH3ULvaU6Z-iSVPzhzS6b5CM","i":"EZAoTNZH3ULvaU6Z-i0d8JJR2nmwyYAfSVPzhzS6b5CM","s":"1","p":"EULvaU6JR2nmwyZ-i0d8JZAoTNZH3YAfSVPzhzS6b5CM","kt":"2","k":["Ed8JZAoTNZaU6JR2nmwyZ-i0H3ULvYAfSVPzhzS6b5CM","Ed8JZAoTNZaU6JR2nmwyZ-i0H3ULvYAfSVPzhzS6b5CM","Ed8JZAoTNZaU6JR2nmwyZ-i0H3ULvYAfSVPzhzS6b5CM"],"ot":"3","n":"EYAfSVPzhzZ-i0d8JZAoTNZH3ULvaU6JR2nmwyS6b5CM","bt":"1","ba":["DTNZH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8JZAo5CM"],"br":["DH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8TNZJZAo5CM"]}
                       """
        XCTAssertEqual(ser, expected)

        let dec = try RNJSONDecoder().decode(ort.self, from: Data(data))
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
        let _ixn = ixn(v: "KERI10JSON00011c_",
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
        print(String(data: data, encoding: .utf8)!)
        let ser = String(data: data, encoding: .utf8)!
        let expected = """
                       {"v":"KERI10JSON00011c_","t":"ixn","d":"E0d8JJR2nmwyYAfZAoTNZH3ULvaU6Z-iSVPzhzS6b5CM","i":"EZAoTNZH3ULvaU6Z-i0d8JJR2nmwyYAfSVPzhzS6b5CM","s":"2","p":"EULvaU6JR2nmwyZ-i0d8JZAoTNZH3YAfSVPzhzS6b5CM","a":[{"d":"ELvaU6Z-i0d8JJR2nmwyYAZAoTNZH3UfSVPzhzS6b5CM","i":"EJJR2nmwyYAfSVPzhzS6b5CMZAoTNZH3ULvaU6Z-i0d8","s":"1"}]}
                       """
        XCTAssertEqual(ser, expected)

        let dec = try RNJSONDecoder().decode(ixn.self, from: Data(data))
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
        let _dip = dip(
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

        let dec = try RNJSONDecoder().decode(dip.self, from: Data(data))
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
        let _drt = drt(
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

        let dec = try RNJSONDecoder().decode(drt.self, from: Data(data))
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
        let _dor = dor(
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
                    "Ed8JZAoTNZaU6JR2nmwyZ-i0H3ULvYAfSVPzhzS6b5CM"
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

        let dec = try RNJSONDecoder().decode(dor.self, from: Data(data))
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
            "Ed8JZAoTNZaU6JR2nmwyZ-i0H3ULvYAfSVPzhzS6b5CM"
        ])
        XCTAssertEqual(dec.ot, 3)
        XCTAssertEqual(dec.n, "EYAfSVPzhzZ-i0d8JZAoTNZH3ULvaU6JR2nmwyS6b5CM")
        XCTAssertEqual(dec.bt, 1)
        XCTAssertEqual(dec.ba, ["DTNZH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8JZAo5CM"])
        XCTAssertEqual(dec.br, ["DH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8TNZJZAo5CM"])
        XCTAssertEqual(dec.di, "EJJR2nmwyYAZAoTNZH3ULvaU6Z-i0d8fSVPzhzS6b5CM")
    }
}
