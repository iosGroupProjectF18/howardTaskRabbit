//
//  RequestTaskViewController.swift
//  howardTaskRabbit
//
//  Created by Whitney Griffith on 10/20/18.
//  Copyright © 2018 Whitney Griffith. All rights reserved.
//

import UIKit

class RequestTaskViewController: UIViewController {

    @IBOutlet weak var taskInput: UITextField!
    @IBOutlet weak var DoneBy: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submit(_ sender: Any) {
        var taskObj = Task(task: taskInput.text as! String, date: DoneBy.date)
        
        //submit new task to list of tasks
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let viewRequestController = segue.destination as! viewRequestController
        }
    
}
