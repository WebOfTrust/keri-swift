# keri-swift
Swift implementation of KERI  (Key Event Receipt Infrastructure)

[![Swift 5.5](https://img.shields.io/badge/Swift-5.5-blue.svg)](https://swift.org/download/)
[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Swift](https://github.com/WebOfTrust/keri-swift/actions/workflows/ci.yaml/badge.svg?branch=main)](https://github.com/WebOfTrust/keri-swift/actions/workflows/ci.yaml)
[![codecov](https://codecov.io/gh/weboftrust/keri-swift/branch/main/graph/badge.svg?token=QmX4JiwGoZ)](https://codecov.io/gh/weboftrust/keri-swift)

# Introduction

keri-swift is an open source Swift implementation of the [ Key Event Receipt Infrastructure (KERI) ](https://github.com/decentralized-identity/keri), a system designed to provide a secure identifier-based trust spanning layer for any stack. [The current version of the KERI paper can be found here](https://github.com/SmithSamuelM/Papers/blob/master/whitepapers/KERI_WP_2.x.web.pdf).

KERI provides the same security and verifiability properties for transactions as a blockchain or distributed ledger can, without the overhead of requiring an absolute global ordering of transactions. Because of this, there is no need for a cannonical chain and thus there is no "KERI Chain" or "KERI Network". KERI Identifiers can be generated independantly in a self-sovereign and privacy-preserving manner and are secured via a self-certifying post-quantum resistant key management scheme based on blinded pre-rotation, auditable and flexible key events and a distributed conflict resolution algorithm called KAACE.

# Features

Currently, work is focused on providing a library that implements the core logic and data structures for creating and interacting with KERI infrastructure. A future goal is to implement runnable services that make up the actual KERI infrastructure (Witnesses, Validators, etc.).

See the [KERI home](https://github.com/weboftrust/keri) for community meeting details.

Other implementations:

- [keripy](https://github.com/weboftrust/keripy) - Closest to production ready.
- [keriox](https://github.com/weboftrust/keriox)
