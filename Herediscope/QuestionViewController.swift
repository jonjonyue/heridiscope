//
//  QuestionViewController.swift
//  Herediscope
//
//  Created by Jonathan yue on 10/28/17.
//  Copyright © 2017 Genesis. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    var question: Question?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        // label
        let labelInst = UILabel()
        self.view.addSubview(labelInst)
        labelInst.text = question!.text
        labelInst.translatesAutoresizingMaskIntoConstraints = false
        labelInst.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
        labelInst.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
