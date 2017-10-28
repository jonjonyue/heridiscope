//
//  ChildViewController.swift
//  Herediscope
//
//  Created by Jonathan Yue on 10/27/17 @ Archhacks.
//  Copyright © 2017 Genesis. All rights reserved.
//

import UIKit

class ChildViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!    
    
    override func viewDidLoad() {
        searchBar.isHidden = true;
        searchBar.isUserInteractionEnabled = false;
        searchBar.delegate = self;
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
        return 5;
    }
 
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath);
        
        return cell;
    }
    
    @IBAction func searchPressed(_ sender: Any) {
        searchBar.isHidden = false;
        searchBar.isUserInteractionEnabled = true;
        searchBar.showsCancelButton = true;
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.isHidden = true;
        searchBar.isUserInteractionEnabled = false;
        searchBar.text = "";
    }
    
    
}

