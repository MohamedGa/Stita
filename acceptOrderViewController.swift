//
//  acceptOrderViewController.swift
//  Stita
//
//  Created by Mohammed Gamal on 8/11/20.
//  Copyright © 2020 codelabs. All rights reserved.
//

import UIKit

class acceptOrderViewController: UIViewController {
    @IBOutlet weak var smallView: UIView!
     @IBOutlet weak var downView: UIView!
     @IBOutlet weak var upView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
smallView.layer.cornerRadius = smallView.frame.size.height / 2
           upView.roundCorners(corners: [ .bottomRight, .bottomLeft], radius: 15)
          downView.roundCorners(corners: [ .bottomRight, .bottomLeft], radius: 15)
        // Do any additional setup after loading the view.
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
