//
//  TaskRequestedCell.swift
//  howardTaskRabbit
//
//  Created by user144652 on 10/21/18.
//  Copyright © 2018 Whitney Griffith. All rights reserved.
//

import UIKit

class TaskRequestedCell: UITableViewCell {

    
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var doneByLabel: UILabel!
    @IBOutlet weak var assignedRabbit: UILabel!
    
    var task: Task! {
        didSet {
            self.taskNameLabel.text = task.task
            self.doneByLabel.text = "Done by: " + task.doneBy
            self.assignedRabbit.text = "Assigned Rabbit: " + task.rabbit
            
        }
    }
    
    @IBAction func acceptTask(_ sender: Any) {
        Task.acceptTask(task: task, withCompletion: {(succeeded, error) -> Void in
            if succeeded {
                self.assignedRabbit.text = "Assigned Rabbit: " + self.task.rabbit
            } else {
                print("Can't accept task", error!)
            }
        })
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
