import ExtrasBase64
import XCTest

@testable import keri_swift

final class MatterTests: XCTestCase {
    let raw: [UInt8] = [197, 186, 65, 60, 51, 111, 47, 225, 251, 154, 44, 82, 95, 138, 134, 164,
                        18, 161, 219, 18, 138, 120, 65, 180, 224, 226, 23, 250, 158, 183, 253, 94]

    func testCreatingMatter() throws {
        let m = try! Matter(raw: self.raw)

        XCTAssertEqual(m.raw, self.raw)
        XCTAssertEqual(m.raw.count, 32)
        XCTAssertEqual(m.code, "B")
        XCTAssertEqual(try m.qb64()!, "BxbpBPDNvL-H7mixSX4qGpBKh2xKKeEG04OIX-p63_V4")
        XCTAssertEqual(try m.qb64b()!,
                       try Base64.decode(string: "BxbpBPDNvL-H7mixSX4qGpBKh2xKKeEG04OIX-p63_V4",
                                         options: .base64UrlAlphabet))

        let qb2: [UInt8] = [7, 22, 233, 4, 240, 205, 188, 191, 135, 238, 104, 177, 73, 126, 42, 26, 144, 74,
                            135, 108, 74, 41, 225, 6, 211, 131, 136, 95, 234, 122, 223, 245, 120]
        XCTAssertEqual(m.qb2()!, qb2)
    }

    func testCreatingMatterBadCode() {
        XCTAssertThrowsError(try Matter(raw: self.raw, code: "X")) { error in
            XCTAssertEqual(error as! MatterErrors, MatterErrors.invalidCode(code: "X", pad: 1))
        }
    }

    func testCreatingMatterBadTwoCharacterCode() throws {
        let raw = try Base64.decode(string: "0XbpBPDNvL-H7mixSX4qGpBKh2xKKeEG04OIX-p63_V4", options: .base64UrlAlphabet)
        XCTAssertThrowsError(try Matter(raw: raw, code: "0X")) { error in
            XCTAssertEqual(error as! MatterErrors, MatterErrors.invalidCode(code: "0X", pad: 0))
        }
    }

    func testCreatingMatterWithQualifiedBase64() {
        let qb64 = "BxbpBPDNvL-H7mixSX4qGpBKh2xKKeEG04OIX-p63_V4"
        let m = try! Matter(qb64: qb64)

        XCTAssertEqual(m.raw, self.raw)
        XCTAssertEqual(m.raw.count, 32)
        XCTAssertEqual(m.code, "B")
        XCTAssertEqual(try m.qb64()!, "BxbpBPDNvL-H7mixSX4qGpBKh2xKKeEG04OIX-p63_V4")
        XCTAssertEqual(try m.qb64b()!, try Base64.decode(string: "BxbpBPDNvL-H7mixSX4qGpBKh2xKKeEG04OIX-p63_V4", options: .base64UrlAlphabet))

        let qb2: [UInt8] = [7, 22, 233, 4, 240, 205, 188, 191, 135, 238, 104, 177, 73, 126, 42, 26, 144, 74, 135, 108, 74, 41, 225, 6, 211, 131, 136, 95, 234, 122, 223, 245, 120]
        XCTAssertEqual(m.qb2()!, qb2)
    }

    func testCreatingMatterWithQualifiedBase2() throws {
        let qb2: [UInt8] = [7, 22, 233, 4, 240, 205, 188, 191, 135, 238, 104, 177, 73, 126, 42, 26, 144, 74, 135, 108, 74, 41, 225, 6, 211, 131, 136, 95, 234, 122, 223, 245, 120]
        let m = try! Matter(qb2: qb2)

        XCTAssertEqual(m.raw, self.raw)
        XCTAssertEqual(m.raw.count, 32)
        XCTAssertEqual(m.code, "B")
        XCTAssertEqual(try m.qb64()!, "BxbpBPDNvL-H7mixSX4qGpBKh2xKKeEG04OIX-p63_V4")
        XCTAssertEqual(try m.qb64b()!, try Base64.decode(string: "BxbpBPDNvL-H7mixSX4qGpBKh2xKKeEG04OIX-p63_V4", options: .base64UrlAlphabet))
        XCTAssertEqual(m.qb2()!, qb2)
    }

    func testSelectCode() throws {
        let m = try Matter(qb64: "-AAB")
        XCTAssertEqual(m.code, "-A")
        XCTAssertEqual(m.size!, 1)
    }

    func testOneCharacterCountCodeSize() throws {
        let bin = try Base64.decode(string: "aU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM=", options: .base64UrlAlphabet)
        let m = try Matter(raw: bin)

        ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P"].forEach {
            XCTAssertTrue(m.OneCharacterCodes.contains($0))
        }
        XCTAssertEqual(16, m.OneCharacterCodes.count)
    }

    func testTwoCharacterCountCodeSize() throws {
        let bin = try Base64.decode(string: "aU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM=", options: .base64UrlAlphabet)
        let m = try Matter(raw: bin)

        ["0A", "0B", "0C", "0D", "0E", "0F", "0G", "0H", "4A", "4B", "5A", "5B", "6A", "6B"].forEach {
            XCTAssertTrue(m.TwoCharacterCodes.contains($0))
        }
        XCTAssertEqual(14, m.TwoCharacterCodes.count)
    }

    func testFourCharacterCountCodeSize() throws {
        let bin = try Base64.decode(string: "aU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM=", options: .base64UrlAlphabet)
        let m = try Matter(raw: bin)

        ["1AAA", "1AAB", "1AAC", "1AAD", "1AAE", "1AAF", "1AAG", "1AAH", "2AAA", "3AAA", "7AAA",
         "7AAB", "8AAA", "8AAB", "9AAA", "9AAB"].forEach {
            XCTAssertTrue(m.FourCharacterCodes.contains($0))
        }
        XCTAssertEqual(16, m.FourCharacterCodes.count)
    }
}
