//
//  MyTaskRequestedCell.swift
//  howardTaskRabbit
//
//  Created by user144652 on 11/4/18.
//  Copyright © 2018 Whitney Griffith. All rights reserved.
//

import UIKit

class MyTaskRequestedCell: UITableViewCell {

    var task: Task! {
        didSet {
            self.taskNameLabel.text = task.task
            self.doneByLabel.text = "Done by: " + task.doneBy
            self.assignedRabbit.text = "Assigned Rabbit: " + task.rabbit
        }
    }
    
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var doneByLabel: UILabel!
    @IBOutlet weak var assignedRabbit: UILabel!
    
    @IBAction func didMarkAsCompleted(_ sender: Any) {
        task.done = true
        (sender as! AnyObject).setImage(UIImage(named: "check-mark-done"), for: UIControl.State.normal)
        (sender as! AnyObject).setTitle("Completed", for: UIControl.State.normal)
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
