//
//  YourViewController.swift
//  Herediscope
//
//  Created by Jonathan yue on 10/27/17.
//  Copyright © 2017 Genesis. All rights reserved.
//

import UIKit

class YourViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var testArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("View Loaded")
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return array.size
        return testArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath);
        cell.textLabel?.text = testArray[indexPath.row];
        print("making cell")
        return cell;
    }

    func loadData() {
        print("Trying to fetch Data")
        if let path = Bundle.main.path(forResource: "data", ofType: "json") {
            do {
                print("Connected to file")
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                print("URL good")
                let jsonResult = try JSONSerialization.jsonObject(with: data)
                print("JSON result good")
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject> {
                    // do stuff
                    print("Found Data")
                    for result in jsonResult["results"] as! [String] {
                        testArray.append(result)
                        print("Recording Data")
                    }
                }
            } catch {
                // handle error
                print("ERROR")
            }
        }
        print("Reloading Tableview")
        tableView.reloadData()
    }
}

