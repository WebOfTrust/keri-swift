//
// Created by Kevin Griffin on 3/14/22.
//

import Foundation

private let digestabe: Set = [
    MatterCodes.Blake3_256,
    MatterCodes.Blake2b_256,
    MatterCodes.Blake2s_256,
    MatterCodes.SHA3_256,
    MatterCodes.SHA2_256,
    MatterCodes.Blake3_512,
    MatterCodes.Blake2b_512,
    MatterCodes.SHA3_512,
    MatterCodes.SHA2_512,
]
let digCodex = Set(matterCodex.filter {
    digestabe.contains($0.key)
}
.map(\.value))
