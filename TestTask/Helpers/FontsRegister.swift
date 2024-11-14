//
//  FontsRegister.swift
//  TestTask
//
//  Created by Anna on 11/14/24.
//

import SwiftUI
import CoreText

let fonts = [
    "Cardo-Bold",
    "Cardo-Regular",
    "OpenSans-Regular",
    "OpenSans-Italic",
    "OpenSans-SemiBold"
]

func registerFonts() {
    for font in fonts {
        guard let fontURL = Bundle.main.url(forResource: font, withExtension: "ttf") else { return }
        CTFontManagerRegisterFontsForURL(fontURL as CFURL, .process, nil)
    }
    
}
