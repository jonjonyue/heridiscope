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
    var phenoTypeCache: [Phenotype] = []
    
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
        return phenoTypeCache.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath);
        cell.textLabel?.text = testArray[indexPath.row];
        print("making cell")
        return cell;
    }
    
    func loadData() {
        print("Trying to fetch Data")
        if let path = Bundle.main.path(forResource: "phenotypes", ofType: "json") {
            print("Connected to file")
            let jsonResult = getJSON(path: path)
            
            // do stuff
            print("Found Data")
            print(jsonResult[0])
            for result in jsonResult.arrayValue {
                let name = result["name"].stringValue
                let description = result["description"].stringValue
                let diagnosis = result["result"]["diagnosis"].stringValue
                let action = result["result"]["action"].stringValue
                var questions: [Question] = []
                for question in result["questions"].arrayValue {
                    let temp = Question(name: question["name"].stringValue, type: question["type"].stringValue, options: question["options"].arrayValue.map { $0.stringValue}, text: question["text"].stringValue)
                    questions.append(temp)
                }
                let answered = result["answered"].boolValue
                let buf = result["type"].stringValue
                var type: traitType = traitType.AutosomalDominant
                switch buf {
                case "AutosomalDominant":
                    type = traitType.AutosomalDominant
                case "AutosomalRecessive":
                    type = traitType.AutosomalRecessive
                case "SexLinkedDominant":
                    type = traitType.SexLinkedDominant
                case "SexLinkedRecessive":
                    type = traitType.SexLinkedRecessive
                default:
                    type = traitType.AutosomalDominant
                }
                phenoTypeCache.append(Phenotype(name: name, description: description, result: Result(diagnosis: diagnosis, action: action), questions: questions, answered: answered, type: type))
                print("Recording Data")
                print(phenoTypeCache)
            }
        }
        print("Reloading Tableview")
        tableView.reloadData()
    }
    
    private func getJSON(path: String) -> JSON {
        let url = URL(fileURLWithPath: path)
        print(url)
        do {
            let data = try Data(contentsOf: url)
            return try JSON(data: data)
        } catch {
            return JSON.null
        }
    }
}

