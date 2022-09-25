//
//  DateManager.swift
//  CRUD_JSON
//
//  Created by agmcoder on 25/9/22.
//

import Foundation


func dateManager(date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/yyyy"
    return dateFormatter.string(from: date)
}

