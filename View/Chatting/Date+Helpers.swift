//
//  Date+Helpers.swift
//  CIS Friender
//
//  Created by Kiki on 19/3/2022.
//

import Foundation

extension Date{
    func descriptiveString(dateStyle: DateFormatter.Style = .short) -> String{
        
        let formatter = DateFormatter()
        formatter.dateStyle = dateStyle
        
        let daysBetween = self.daysBetween(date:Date())
        
        if daysBetween == 0{
        return "Today"
        }
        else if daysBetween == 1{
            return "Yesterday"
        }
        else if daysBetween < 5{
            let weekdayIndex = Calendar.current.component(.weekday, from: self) - 1
            return formatter.weekdaySymbols[weekdayIndex]
        }
    }
    
    func daysBetween(date:Date) -> Int{
        let calendar = Calendar.current
        let date1 = calendar.startOfDay(for: self)
        let date2 = calendar.startOfDay(for: date)
        //if let daysBetween = Calender.dateComponents([.day], from: date1, to:date2).day{
            return daysBetween
        }
        return 0
    }

    
}

