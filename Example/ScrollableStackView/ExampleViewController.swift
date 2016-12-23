//
//  ExampleViewController.swift
//  ScrollableStackView
//
//  Created by G on 23/12/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class ExampleViewController: UITableViewController {
    
    let kCellIdentifier = "CellIdentifier"
    let demos = ["Vertical Layout", "Horizondal Layout"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "ScrollableStackView iOS Demos"
        
        self.tableView?.register(UITableViewCell.self, forCellReuseIdentifier: kCellIdentifier)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellIdentifier)! as UITableViewCell
        
        cell.textLabel?.text = demos[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return demos.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "VerticalLayoutViewController") as! VerticalLayoutViewController
            self.navigationController?.pushViewController(controller, animated: true)
        }
            //        } else if indexPath.row == 1 {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let controller = storyboard.instantiateViewController(withIdentifier: "HorizontalLayoutViewController") as! HorizontalLayoutViewController
//        self.present(controller, animated: true, completion: nil)
        
        
//        }
    }
}
