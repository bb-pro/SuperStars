//
//  Ex+String.swift
//  Football136
//
//  Created by Bektemur Mamashayev on 24/12/2023. Bektemur on 21.12.2023.
//

import Foundation

func formatDateToString(date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMM d, yyyy"
    dateFormatter.locale = Locale(identifier: "en_US")

    return dateFormatter.string(from: date)
}

extension Date {
    func getYearString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        dateFormatter.locale = Locale(identifier: "en_US")

        return dateFormatter.string(from: self)
    }
}

extension Date {
    func getFormattedString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        dateFormatter.locale = Locale(identifier: "en_US")

        return dateFormatter.string(from: self)
    }
}
