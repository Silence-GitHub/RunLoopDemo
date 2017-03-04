//
//  ViewController.swift
//  RunLoopDemo
//
//  Created by Kaibo Lu on 2017/3/3.
//  Copyright © 2017年 Kaibo Lu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCome), userInfo: nil, repeats: true)
    }
    
    func timerCome() {
        print(Date(), #function)
    }

    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Text"
        return cell
    }
    
    // MARK: - Scroll view delegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        perform(#selector(sourceCome), with: self, afterDelay: 0, inModes: [RunLoopMode.defaultRunLoopMode])
    }
    
    func sourceCome() {
        print(Date(), #function)
    }

}

