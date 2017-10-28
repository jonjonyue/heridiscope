//
//  LoadingViewController.swift
//  Herediscope
//
//  Created by Taehoon Bang on 10/28/17.
//  Copyright © 2017 Genesis. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {

    @IBOutlet weak var animationView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animationView.animationImages = [#imageLiteral(resourceName: "load1"), #imageLiteral(resourceName: "load2"), #imageLiteral(resourceName: "load3")]
        animationView.animationDuration = 0.5
        animationView.startAnimating();
        // Do any additional setup after loading the view.
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
