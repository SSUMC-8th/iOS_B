//
//  DateFormatter.swift
//  Starbucks
//
//  Created by 바견규 on 4/8/25.
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
