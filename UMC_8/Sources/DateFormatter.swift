//
//  DateFormatter.swift
//  Starbucks
//
//  Created by 소민준 on 4/8/25.
//
import SwiftUI

extension Date {
    func formattedString() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy.MM.dd hh:mm"
        return formatter.string(from: self)
    }
}
