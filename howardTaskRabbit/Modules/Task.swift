//
//  Task.swift
//  howardTaskRabbit
//
//  Created by Whitney Griffith on 10/20/18.
//  Copyright © 2018 Whitney Griffith. All rights reserved.
//

import Foundation

class Task {
    
    var task: String?
    var doneBy: Date
  
    init(task: String, date: Date) {
        self.task = task
        doneBy = date
        }
}
    

