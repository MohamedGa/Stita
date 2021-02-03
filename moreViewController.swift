//
//  moreViewController.swift
//  Stita
//
//  Created by Mohammed Gamal on 7/26/20.
//  Copyright © 2020 codelabs. All rights reserved.






//UIApplication.shared.keyWindow?.rootViewController = self.storyboard!.instantiateViewController(withIdentifier: "SWRevealViewController")
//

import UIKit

class moreViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {
     var ManuNameArray:Array = [String]()
    @IBOutlet weak var smallView: UIView!
    @IBOutlet weak var downView: UIView!
    @IBOutlet weak var tblTableView: UITableView!
    @IBOutlet weak var moreBtn: UIButton!
    @IBOutlet weak var homeBtn: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
         
             self.ManuNameArray=["حسابي","سلة المشتريات","طلباتي","العروض","خيارات الدفع","الدعم","الاعدادت"]
            
        
        
        
        
     }
    @IBAction func moreTapped(_ sender: Any) {
    }
    @IBAction func homeTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "goToHome", sender: self)
    }
    @IBAction func offerBtn(_ sender: Any) {
        
                   UIApplication.shared.keyWindow?.rootViewController = self.storyboard!.instantiateViewController(withIdentifier: "offersViewController")
    }
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        smallView.layer.cornerRadius = smallView.frame.size.height / 2
        tblTableView.dataSource = self
        tblTableView.delegate = self

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return ManuNameArray.count
           
       }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moreTableViewCell", for: indexPath) as! moreTableViewCell
        
       // cell.menuBtn.titleLabel?.text = ManuNameArray[indexPath.row]
         cell.menuBtn.setTitle(ManuNameArray[indexPath.row], for: .normal)
      
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       
        
        let cell:moreTableViewCell = tableView.cellForRow(at: indexPath) as! moreTableViewCell
        print(cell.menuBtn.titleLabel?.text )
       
        if cell.menuBtn.titleLabel?.text  == "حسابي"
        {
//            print("Home Tapped")
//            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "selectCityViewController") as! selectCityViewController
//            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
//
//            revealviewcontroller.pushFrontViewController(newFrontController, animated: true)
//            UIApplication.shared.keyWindow?.rootViewController = self.storyboard!.instantiateViewController(withIdentifier: "SWRevealViewController")
            
        }
        if cell.menuBtn.titleLabel?.text == "سلة المشتريات"
        {
            
           
            
        }
       
       
        if cell.menuBtn.titleLabel?.text  ==  "طلباتي"
            
        {
            
          
            
        }
        if cell.menuBtn.titleLabel?.text  == "العروض"
        {
            
            UIApplication.shared.keyWindow?.rootViewController = self.storyboard!.instantiateViewController(withIdentifier: "offersViewController")
           
        }
        if cell.menuBtn.titleLabel?.text  == "خيارات الدفع"
        {
          
            
          
        }
       
        if cell.menuBtn.titleLabel?.text  == "الدعم"
        {
            
           
            
        
    }
        if cell.menuBtn.titleLabel?.text  == "الاعدادت"
               {
                   
                  
                   
               
           }
       

}
}
/*/    // MARK: - Navigation

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

 }*/
