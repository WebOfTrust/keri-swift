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
}
