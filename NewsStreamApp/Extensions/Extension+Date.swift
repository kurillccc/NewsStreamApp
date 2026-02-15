//
//  Extension+Date.swift
//  NewsStreamApp
//
//  Created by Кирилл on 14.02.2026.
//

import Foundation

extension Date {
    
    func convertDate() -> String {
        return formatted(.dateTime.hour().minute().day().month().year())
    }
    
}
