import Sodium
import XCTest

@testable import keri_swift

final class MatterTests: XCTestCase {
    let s = Sodium()

    func seededPublicKey() -> Box.KeyPair.PublicKey {
        let kp = self.s.box.keyPair(seed: self.s.utils.hex2bin("00 11 22 33 44 55 66 77 88 99 aa bb cc dd ee ff 00 11 22 33 44 55 66 77 88 99 aa bb cc dd ee ff", ignore: " ")!)!
        return kp.publicKey
    }

    func testCreatingMatter() throws {
        let pub = self.seededPublicKey()
        let m = try! Matter(raw: pub)

        XCTAssertEqual(m.raw, pub)
        XCTAssertEqual(m.raw.count, 32)
        XCTAssertEqual(m.code, "B")
        XCTAssertEqual(m.qb64()!, "BxbpBPDNvL-H7mixSX4qGpBKh2xKKeEG04OIX-p63_V4")
        XCTAssertEqual(m.qb64b()!, self.s.utils.base642bin("BxbpBPDNvL-H7mixSX4qGpBKh2xKKeEG04OIX-p63_V4")!)

        let qb2: Bytes = [7, 22, 233, 4, 240, 205, 188, 191, 135, 238, 104, 177, 73, 126, 42, 26, 144, 74, 135, 108, 74, 41, 225, 6, 211, 131, 136, 95, 234, 122, 223, 245, 120]
        XCTAssertEqual(m.qb2()!, qb2)
    }

    func testCreatingMatterBadCode() {
        let pub = self.seededPublicKey()
        XCTAssertThrowsError(try Matter(raw: pub, code: "X")) { error in
            XCTAssertEqual(error as! MatterError, MatterError.invalidCode(code: "X", pad: 1))
        }
    }

    func testCreatingMatterBadTwoCharacterCode() {
        let raw = self.s.utils.base642bin("5gjSh76EtUGZbcN_adbiCjGFWye7su6_HDC2P1IlsBKxpA2_C3ZFxvt80P4CJcpCMhsLj3Mi-9fRXimWpK7zrA", variant: .URLSAFE_NO_PADDING)!
        XCTAssertThrowsError(try Matter(raw: raw, code: "XX")) { error in
            XCTAssertEqual(error as! MatterError, MatterError.invalidCode(code: "XX", pad: 2))
        }
    }

    func testCreatingMatterWithQualifiedBase64() {
        let pub = self.seededPublicKey()
        let qb64 = "BxbpBPDNvL-H7mixSX4qGpBKh2xKKeEG04OIX-p63_V4"
        let m = try! Matter(qb64: qb64)

        XCTAssertEqual(m.raw, pub)
        XCTAssertEqual(m.raw.count, 32)
        XCTAssertEqual(m.code, "B")
        XCTAssertEqual(m.qb64()!, "BxbpBPDNvL-H7mixSX4qGpBKh2xKKeEG04OIX-p63_V4")
        XCTAssertEqual(m.qb64b()!, self.s.utils.base642bin("BxbpBPDNvL-H7mixSX4qGpBKh2xKKeEG04OIX-p63_V4")!)

        let qb2: Bytes = [7, 22, 233, 4, 240, 205, 188, 191, 135, 238, 104, 177, 73, 126, 42, 26, 144, 74, 135, 108, 74, 41, 225, 6, 211, 131, 136, 95, 234, 122, 223, 245, 120]
        XCTAssertEqual(m.qb2()!, qb2)
    }

    func testCreatingMatterWithQualifiedBase2() {
        let pub = self.seededPublicKey()
        let qb2: Bytes = [7, 22, 233, 4, 240, 205, 188, 191, 135, 238, 104, 177, 73, 126, 42, 26, 144, 74, 135, 108, 74, 41, 225, 6, 211, 131, 136, 95, 234, 122, 223, 245, 120]
        let m = try! Matter(qb2: qb2)

        XCTAssertEqual(m.raw, pub)
        XCTAssertEqual(m.raw.count, 32)
        XCTAssertEqual(m.code, "B")
        XCTAssertEqual(m.qb64()!, "BxbpBPDNvL-H7mixSX4qGpBKh2xKKeEG04OIX-p63_V4")
        XCTAssertEqual(m.qb64b()!, self.s.utils.base642bin("BxbpBPDNvL-H7mixSX4qGpBKh2xKKeEG04OIX-p63_V4")!)
        XCTAssertEqual(m.qb2()!, qb2)
    }

    func testOneCharacterCountCodeSize() {
        let bin = self.s.utils.base642bin("aU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM=", variant: .URLSAFE)!
        let m = try! Matter(raw: bin)

        ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P"].forEach {
            XCTAssertTrue(m.OneCharacterCodes.contains($0))
        }
        XCTAssertEqual(16, m.OneCharacterCodes.count)
    }

    func testTwoCharacterCountCodeSize() {
        let bin = self.s.utils.base642bin("aU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM=", variant: .URLSAFE)!
        let m = try! Matter(raw: bin)

        ["0A", "0B", "0C", "0D", "0E", "0F", "0G", "0H", "4A", "4B", "5A", "5B", "6A", "6B"].forEach {
            XCTAssertTrue(m.TwoCharacterCodes.contains($0))
        }
        XCTAssertEqual(14, m.TwoCharacterCodes.count)
    }

    func testFourCharacterCountCodeSize() {
        let bin = self.s.utils.base642bin("aU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM=", variant: .URLSAFE)!
        let m = try! Matter(raw: bin)

        ["1AAA", "1AAB", "1AAC", "1AAD", "1AAE", "1AAF", "1AAG", "1AAH", "2AAA", "3AAA", "7AAA",
         "7AAB", "8AAA", "8AAB", "9AAA", "9AAB"].forEach {
            XCTAssertTrue(m.FourCharacterCodes.contains($0))
        }
        XCTAssertEqual(16, m.FourCharacterCodes.count)
    }
}
