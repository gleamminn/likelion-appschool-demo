//
//  TayoCharatersData.swift
//  Animations
//
//  Created by Jongwook Park on 7/5/24.
//

import Foundation

let tayoCharaters: [TayoCharacter] = [
    TayoCharacter(
        name: "타요", color: .blue,
        imageUrlString: "https://i.namu.wiki/i/qz9NeA8pbYKkM4QkN-V--geebxCu6DCvEfVRLvC9DccaIeu0J2IOPsQxuPXPCqFsVUzR5i-1IryjQepjzEsK7pbolImEQr495YVLkMVV4XsBKVvuw1aLG6VxemW49grdBst_Qir8COFm66Jm_OdrEg.webp",
        busKind: .trunk,
        number: "120"),
    TayoCharacter(
        name: "로기",
        color: .green,
        imageUrlString: "https://i.namu.wiki/i/sQ842a8FO7IOThjBMI9kbm9upE6LXm8nPDaj-yiN-2spyW3GXtxR4gOAOOBIN3YNUAEvAnHKEe2WZB1A8LLhwDt3G4bxqNDsjoSIp6NuAMsrQhnxg08cYl9AsBkSP2K7XZzKlJuOozpM4TLf5id5mQ.webp",
        busKind: .branch,
        number: "1000"),
    TayoCharacter(
        name: "라니",
        color: .yellow, imageUrlString: "https://i.namu.wiki/i/AzP7wz13pbcl-6omnMK0aEejxvySRbAx4YnDoGFsIbgSaQlKwe1agyVsK_sCs6FHIO_6xUsWJiKQHp7BI7Ckr2tnJEb7Z1K7dGrsIO5T0_EubyTt4IsoVGydtho8t-vGSJ_67hYTyqGhovxcsKTnSw.webp",
        busKind: .circulation,
        number: "02"),
    TayoCharacter(
        name: "가니",
        color: .red,
        imageUrlString: "https://i.namu.wiki/i/CitHSW_QNX1RUNif5K_OO4uOPJFftl5RcR3a-cx1ZTFl3qnkX0N6NyEWse7SnXimMC6j-HLtr5ZBUHzKcoaNuDkmBxITn_xgKRHePRBw9me00c4gQHx1rB6fd-dCac2F4i2Ov9RY0OxALQCuk8e4wA.webp",
        busKind: .rapid,
        number: "1339"),
]

let sampleTayoCharater: TayoCharacter = tayoCharaters.first!
