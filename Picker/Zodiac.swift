//
//  Zodiac.swift
//  CIS Friender
//
//  Created by Shirley Deng on 14/3/2022.
//

import Foundation

enum Zodiac: String, CaseIterable {
    case Aries
    case Taurus
    case Gemini
    case Cancer
    case Leo
    case Virgo
    case Libra
    case Scorpio
    case Sagittarius
    case Capricorn
    case Aquarius
    case Pisces

    var name: String {
        rawValue.capitalized
    }
}
