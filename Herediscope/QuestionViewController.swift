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
    var firstButton: UIButton = UIButton()
    var secondButton: UIButton = UIButton()
    var light: UIColor = UIColor(red: 0.788, green: 0.843, blue: 1.0, alpha: 1.0)
    var dark: UIColor = UIColor(red: 0.220, green: 0.576, blue: 0.93, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        // Body Text
        let questionText = UITextView(frame: CGRect(x: 10, y: 50, width: view.frame.width - 20, height: (view.frame.height - 20) / 3))
        questionText.text = "Q: " + question!.text
        questionText.font! = UIFont(name: questionText.font!.fontName, size: 32)!
        questionText.isEditable = false
        view.addSubview(questionText)
        
        firstButton = UIButton(frame: CGRect(x: 20, y: ((view.frame.height - 20) / 3) - 10, width: view.frame.width - 40, height: (view.frame.height / 4) - view.frame.height / 6))
        firstButton.backgroundColor = light
        firstButton.setTitle(question!.options[0], for: .normal)
        firstButton.addTarget(self, action: #selector(self.buttonClicked), for: .touchUpInside)
        view.addSubview(firstButton)
        
        
        secondButton = UIButton(frame: CGRect(x: 20, y: ((view.frame.height - 20) / 3) + 100, width: view.frame.width - 40, height: (view.frame.height / 4) - view.frame.height / 6))
        secondButton.backgroundColor = light
        secondButton.setTitle(question!.options[1], for: .normal)
        secondButton.addTarget(self, action: #selector(self.buttonClicked), for: .touchUpInside)
        view.addSubview(secondButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func buttonClicked(_ sender: Any) {
        print("Button Press")
        let buf = sender as! UIButton
        buf.backgroundColor = dark
        if (buf == firstButton) {
            secondButton.backgroundColor = light
        } else {
            firstButton.backgroundColor = light
        }
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
