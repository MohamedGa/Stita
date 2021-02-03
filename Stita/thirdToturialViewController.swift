//
//  thirdToturialViewController.swift
//  Stita
//
//  Created by Mohammed Gamal on 6/28/20.
//  Copyright © 2020 codelabs. All rights reserved.
//

import UIKit

class thirdToturialViewController: UIViewController {
    @IBOutlet weak var firstIndicator: UIView!
    @IBOutlet weak var secondIndicator: UIView!
    @IBOutlet weak var thirdIndicator: UIView!
    @IBOutlet weak var nextBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        firstIndicator.layer.cornerRadius = secondIndicator.frame.size.height/2
              secondIndicator.layer.cornerRadius = secondIndicator.frame.size.height/2
               thirdIndicator.layer.cornerRadius = thirdIndicator.frame.size.height/2
              nextBtn.layer.cornerRadius = 15
        nextBtn.backgroundColor = UIColor(red: 0.10, green: 0.58, blue: 0.73, alpha: 1.00)
           
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
          if #available(iOS 13.0, *) {
              let app = UIApplication.shared
              let statusBarHeight: CGFloat = app.statusBarFrame.size.height
              
              let statusbarView = UIView()
              statusbarView.backgroundColor = UIColor(red: 0.10, green: 0.58, blue: 0.73, alpha: 1.00)
              view.addSubview(statusbarView)
            
              statusbarView.translatesAutoresizingMaskIntoConstraints = false
              statusbarView.heightAnchor
                  .constraint(equalToConstant: statusBarHeight).isActive = true
              statusbarView.widthAnchor
                  .constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
              statusbarView.topAnchor
                  .constraint(equalTo: view.topAnchor).isActive = true
              statusbarView.centerXAnchor
                  .constraint(equalTo: view.centerXAnchor).isActive = true
            
          } else {
              let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
              statusBar?.backgroundColor = UIColor(red: 0.10, green: 0.58, blue: 0.73, alpha: 1.00)
          }
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
