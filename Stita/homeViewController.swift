//
//  homeViewController.swift
//  Stita
//
//  Created by Mohammed Gamal on 7/19/20.
//  Copyright © 2020 codelabs. All rights reserved.
//

import UIKit

class homeViewController: UIViewController {
    @IBOutlet weak var firstBigView: UIView!
    @IBOutlet weak var secondBigView: UIView!
    @IBOutlet weak var thirdBigView: UIView!
    @IBOutlet weak var firstImageView: UIView!
    @IBOutlet weak var secondImageView: UIView!
    @IBOutlet weak var thirdImageView: UIView!
    @IBOutlet weak var soonLbl: UILabel!
    @IBOutlet weak var upView: UIView!
    @IBOutlet weak var menuCollectionView: UICollectionView!
    var arrayOfStrings: [String] = ["المزيد", "العروض", "طلباتي", "الرئيسية"]
    var MenuPicture:[UIImage] = [
        
        UIImage(named: "more")!,
        UIImage(named: "offers")!,
        UIImage(named: "myorders")!,
        UIImage(named: "home")!,
      ]
    
    private let spacing:CGFloat = 2.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
               layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
               layout.minimumLineSpacing = spacing
               layout.minimumInteritemSpacing = spacing
               self.menuCollectionView?.collectionViewLayout = layout
        upView.roundCorners(corners: [ .bottomRight, .bottomLeft], radius: 40)
        menuCollectionView.roundCorners(corners: [ .bottomRight, .bottomLeft], radius: 15)
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        upView.backgroundColor = UIColor(red: 0.10, green: 0.58, blue: 0.73, alpha: 1.00)
        firstBigView.clipsToBounds = true
        firstBigView.layer.masksToBounds = false
        firstBigView.layer.borderWidth = 1
        firstBigView.layer.borderColor = UIColor.white.cgColor
        firstBigView.layer.cornerRadius = 12
        soonLbl.layer.cornerRadius = soonLbl.frame.size.height/2
       // soonLbl.clipsToBounds = true
        soonLbl.layer.masksToBounds = true
        //To apply Shadow
        firstBigView.layer.shadowOpacity = 1
        firstBigView.layer.shadowRadius = 3.0
        firstBigView.layer.shadowOffset = CGSize.zero // Use any CGSize
        firstBigView.layer.shadowColor = UIColor.darkGray.cgColor
        
        secondBigView.clipsToBounds = true
        secondBigView.layer.masksToBounds = false
        secondBigView.layer.borderWidth = 1
        secondBigView.layer.borderColor = UIColor.white.cgColor
        secondBigView.layer.cornerRadius = 12
        //To apply Shadow
        secondBigView.layer.shadowOpacity = 1
        secondBigView.layer.shadowRadius = 3.0
        secondBigView.layer.shadowOffset = CGSize.zero // Use any CGSize
        secondBigView.layer.shadowColor = UIColor.darkGray.cgColor
        
        thirdBigView.clipsToBounds = true
        thirdBigView.layer.masksToBounds = false
        thirdBigView.layer.borderWidth = 1.0
        thirdBigView.layer.borderColor = UIColor.lightGray.cgColor
        thirdBigView.layer.cornerRadius = 12
        //To apply Shadow
        thirdBigView.layer.shadowOpacity = 1
        thirdBigView.layer.shadowRadius = 3.0
        thirdBigView.layer.shadowOffset = CGSize.zero // Use any CGSize
        thirdBigView.layer.shadowColor = UIColor.darkGray.cgColor
        
        // inside Shadow
        firstImageView.layer.shadowColor = UIColor.darkGray.cgColor
        firstImageView.layer.shadowOpacity = 0.3
        firstImageView.layer.shadowOffset = CGSize.zero
        firstImageView.layer.shadowRadius = 6
        firstImageView.layer.masksToBounds = false
        firstImageView.layer.borderWidth = 1.5
        firstImageView.layer.borderColor = UIColor.white.cgColor
        firstImageView.layer.cornerRadius = 12
        
        // inside Shadow
               secondImageView.layer.shadowColor = UIColor.darkGray.cgColor
               secondImageView.layer.shadowOpacity = 0.3
               secondImageView.layer.shadowOffset = CGSize.zero
               secondImageView.layer.shadowRadius = 6
               secondImageView.layer.masksToBounds = false
               secondImageView.layer.borderWidth = 1.5
               secondImageView.layer.borderColor = UIColor.white.cgColor
               secondImageView.layer.cornerRadius = 12
        
        thirdImageView.layer.shadowColor = UIColor.darkGray.cgColor
                     thirdImageView.layer.shadowOpacity = 0.3
                     thirdImageView.layer.shadowOffset = CGSize.zero
                     thirdImageView.layer.shadowRadius = 6
                     thirdImageView.layer.masksToBounds = false
                     thirdImageView.layer.borderWidth = 1.5
                     thirdImageView.layer.borderColor = UIColor.white.cgColor
                     thirdImageView.layer.cornerRadius = 12
        
        
        

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
    @IBAction func homeTapped(_ sender: Any) {
    }
    @IBAction func moreTapped(_ sender: Any) {
        self.performSegue(withIdentifier:  "goToMore", sender: self)
    }
    // add inside shadow
 

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension homeViewController : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return arrayOfStrings.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let cell : MenuCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCollectionViewCell", for: indexPath) as! MenuCollectionViewCell
        cell.menuLabel.text = arrayOfStrings[indexPath.row]
        cell.menuPic.image = MenuPicture[indexPath.item]
     // cell.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        cell.layoutIfNeeded()
            return cell
        
     
        
    }
   func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
          cell.layoutIfNeeded()
      }
   

  
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        selectedIndex = indexPath.item
//        refreshContent()
    }
   
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let numberOfItemsPerRow:CGFloat = 4
            let spacingBetweenCells:CGFloat = 5
            
            let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
            
            if let collection = self.menuCollectionView{
                let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
                return CGSize(width: width, height: width)
            }else{
                return CGSize(width: 0, height: 0)
            }
        }
}

