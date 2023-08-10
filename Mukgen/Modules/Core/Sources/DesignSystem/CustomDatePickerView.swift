//
//  CustomDatePickerView.swift
//  Core
//
//  Created by 박준하 on 2023/08/09.
//

import UIKit

open class CustomDatePickerView: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {
    private let years = Array(1900..<2101)
    private let months = Array(1...12)
    private var days: [Int] {
        let daysInMonth = Calendar.current.range(of: .day, in: .month, for: Date())?.count ?? 0
        return Array(1...daysInMonth)
    }
    
    public var selectedDate: Date? {
        let day = days[selectedRow(inComponent: 0)]
        let month = months[selectedRow(inComponent: 1)]
        let year = years[selectedRow(inComponent: 2)]
        var dateComponents = DateComponents()
        dateComponents.day = day
        dateComponents.month = month
        dateComponents.year = year
        let calendar = Calendar.current
        return calendar.date(from: dateComponents)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
        self.dataSource = self
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return days.count
        case 1:
            return months.count
        case 2:
            return years.count
        default:
            return 0
        }
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return "\(days[row])"
        case 1:
            return "\(months[row])"
        case 2:
            return "\(years[row])"
        default:
            return nil
        }
    }
}
