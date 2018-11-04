//
//  Task.swift
//  howardTaskRabbit
//
//  Created by Whitney Griffith on 10/20/18.
//  Copyright © 2018 Whitney Griffith. All rights reserved.
//

import Foundation
import Parse

class Task: PFObject, PFSubclassing {
    
    static func parseClassName() -> String {
        return "Task"
    }
    
    
//    var task: String?
//    var doneBy: Date
   
//    init(task: String, date: Date) {
//        self.task = task
//        doneBy = date
//        }
    
    @NSManaged var task : String?
    @NSManaged var requester: PFUser
    @NSManaged var doneBy: String
    @NSManaged var rabbit: String
    
    class func postTask(taskName: String?, doneByDate: Date, withCompletion completion: PFBooleanResultBlock?) {
        // use subclass approach
        let task = Task()
        
        // Add relevant fields to the object
        task.requester = PFUser.current()! // Pointer column type that points to PFUser
        task.task = taskName!
        
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let dateString = formatter.string(from: doneByDate)
        task.doneBy = dateString
        task.rabbit = ""
        // Save object (following function will save the object in Parse asynchronously)
        task.saveInBackground(block: completion)
    }
    
    class  func acceptTask(task: Task, withCompletion completion: PFBooleanResultBlock?){
        
        if task.rabbit == ""{
            task.rabbit = PFUser.current()?.username ?? "anonymous"
            // Save object (following function will save the object in Parse asynchronously)
            task.saveInBackground(block: completion)
        }
        
    }
    
}



