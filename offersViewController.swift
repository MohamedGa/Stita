//
//  offersViewController.swift
//  Stita
//
//  Created by Mohammed Gamal on 8/4/20.
//  Copyright © 2020 codelabs. All rights reserved.
//

import UIKit

class offersViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var smallView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var downView: UIView!
    var logoImage: [UIImage] = [
        UIImage(named: "offer1.png")!,
        UIImage(named: "offer2.png")!
    ]
    @IBOutlet weak var moreTapped: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
               tableView.delegate = self
        smallView.layer.cornerRadius = smallView.frame.size.height / 2
        

        // Do any additional setup after loading the view.
    }
    @IBAction func offerPress(_ sender: Any) {
        UIApplication.shared.keyWindow?.rootViewController = self.storyboard!.instantiateViewController(withIdentifier: "myOrdersViewController")
    }
    @IBAction func morePress(_ sender: Any) {
         UIApplication.shared.keyWindow?.rootViewController = self.storyboard!.instantiateViewController(withIdentifier: "moreViewController")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 2
           
       }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "offerTableViewCell", for: indexPath) as! offerTableViewCell

        cell.offerImage.image = logoImage[indexPath.row]
      
        
        return cell
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
