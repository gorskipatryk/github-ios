//
//  DateFormatter+Extensions.swift
//  tumblr
//
//  Created by Patryk Górski on 10/12/2018.
//  Copyright © 2018 Patryk Górski. All rights reserved.
//
import Foundation

extension DateFormatter {
    
    static private let dateFormatter: DateFormatter = {
        $0.calendar = Calendar.current
        return $0
    }(DateFormatter())
    
    func formatDate(dateFormat: DateFormat) -> DateFormatter {
        DateFormatter.dateFormatter.dateFormat = dateFormat.rawValue
        return DateFormatter.dateFormatter
    }
}
