//
//  MyRequestedTasksViewController.swift
//  howardTaskRabbit
//
//  Created by user144652 on 11/4/18.
//  Copyright © 2018 Whitney Griffith. All rights reserved.
//

import UIKit
import Parse

class MyRequestedTasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet weak var tableView: UITableView!
    var tasks: [Task] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tasks.count != nil {
            return tasks.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskRequestedCell", for: indexPath) as! TaskRequestedCell
        cell.task = tasks[indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(viewRequestController.didPulltoRefresh(_:)), for: UIControl.Event.valueChanged)
        tableView.insertSubview(refreshControl, at: 0)
        loadQueries()
    }
    
    func loadQueries() {
        // construct PFQuery
        let query = PFQuery(className: "Task")
        query.whereKey("requester", equalTo: PFUser.current())
        query.order(byDescending: "DoneBy")
        query.includeKey("requester")
        query.includeKey("DoneBy")
        //query.limit = 20
        
        query.findObjectsInBackground { (tasks: [PFObject]?, error: Error?) in
            if let tasks = tasks {
                self.tasks = tasks as! [Task]
                //print(tasks.posts)
                self.tableView.reloadData()
                self.tableView.refreshControl?.endRefreshing()
            } else {
                print(error?.localizedDescription)
            }
            
        }
    }
    
    @objc func didPulltoRefresh(_ refreshControl: UIRefreshControl) {
        loadQueries()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
