//
//  resturantViewController.swift
//  Stita
//
//  Created by Mohammed Gamal on 7/20/20.
//  Copyright © 2020 codelabs. All rights reserved.
//

import UIKit

class resturantViewController: UIViewController ,UITextFieldDelegate  {
    @IBOutlet weak var timeReceiptTF: UITextField!
    @IBOutlet weak var recieptPlaceTF: UITextField!
    @IBOutlet weak var upView: UIView!
    @IBOutlet weak var downView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var menuCollectionView: UICollectionView!
    @IBOutlet var allView: UIView!
    var refresher : UIRefreshControl!
    var catalog_list = [foodCatalog]()
       var food_list = [subfoods]()
    var media_list = [media]()
    var selectedArray = [subfoods]()
       var selectedIndex = 0
       var selectedIndexPath = IndexPath(item: 0, section: 0)
     let indicatorHeight : CGFloat = 3
    var indicatorView = UIView()
    var arrayOfStrings: [String] = ["المزيد", "العروض", "طلباتي", "الرئيسية"]
    var MenuPicture:[UIImage] = [
        
        UIImage(named: "more")!,
        UIImage(named: "offers")!,
        UIImage(named: "myorders")!,
        UIImage(named: "home")!,
      ]
    
    private let spacing:CGFloat = 0.0
   
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
               layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
               layout.minimumLineSpacing = spacing
               layout.minimumInteritemSpacing = spacing
               self.menuCollectionView?.collectionViewLayout = layout
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        menuCollectionView.roundCorners(corners: [ .bottomRight, .bottomLeft], radius: 15)
     //    downView.roundCorners(corners: [ .bottomRight, .bottomLeft], radius: 15)
         upView.roundCorners(corners: [ .bottomRight, .bottomLeft], radius: 40)
        timeReceiptTF.clipsToBounds = true
               timeReceiptTF.layer.masksToBounds = true
        recieptPlaceTF.clipsToBounds = true
                     recieptPlaceTF.layer.masksToBounds = true
        menuCollectionView.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.95, alpha: 1.00)
        timeReceiptTF.layer.cornerRadius = timeReceiptTF.frame.size.height / 2
        recieptPlaceTF.layer.cornerRadius = timeReceiptTF.frame.size.height / 2
        collectionView.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.95, alpha: 1.00)
        
        timeReceiptTF.attributedPlaceholder = NSAttributedString(string: " وقت استلام الطلب",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.10, green: 0.58, blue: 0.73, alpha: 1.00)])
        
        allView.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.95, alpha: 1.00)
        //Define the imageView 2
        let iconWidth = 30;
        let iconHeight = 30;
                             let imageView4 = UIImageView();
                             let imageEmail4 = UIImage(named: "delivery.png");
                             imageView4.image = imageEmail4;
        let XRight = Int(self.timeReceiptTF.layer.frame.size.width - 40)
        let YRight = Int(self.timeReceiptTF.layer.frame.size.height/4)
        
                      imageView4.frame = CGRect(x: XRight, y: YRight, width: iconWidth, height: iconHeight)
                      timeReceiptTF.rightViewMode = UITextField.ViewMode.always
                      timeReceiptTF.addSubview(imageView4)
        
        
        
        let iconWidth2 = 10;
               let iconHeight2 = 10;
                                    let imageView = UIImageView();
                                    let imageEmail = UIImage(named: "arrow.png");
                                    imageView.image = imageEmail;
               let XLeft = Int(10)
               let YLeft = 14 //Int(self.timeReceiptTF.layer.frame.size.height/2)
               
                             imageView.frame = CGRect(x: XLeft, y: YLeft, width: iconWidth2, height: iconHeight2)
                             timeReceiptTF.rightViewMode = UITextField.ViewMode.always
                             timeReceiptTF.addSubview(imageView)
//        //left image
//        let imageView = UIImageView();
//               let imageEmail = UIImage(named: "delivery.png");
//               imageView.image = imageEmail;
//        imageView.frame = CGRect(x: 10, y: 12, width: iconWidth, height: iconHeight)
//        timeReceiptTF.leftViewMode = UITextField.ViewMode.always
//        timeReceiptTF.addSubview(imageView4)
        let iconWidth3 = 20;
        let iconHeight3 = 20;
                             let imageView2 = UIImageView();
                             let imageEmail2 = UIImage(named: "locationMark.png");
                             imageView2.image = imageEmail2;
        let XRight2 = Int(self.recieptPlaceTF.layer.frame.size.width - 40)
        let YRight2 = Int(self.recieptPlaceTF.layer.frame.size.height/4)
        
                      imageView2.frame = CGRect(x: XRight2, y: YRight2, width: iconWidth3, height: iconHeight3)
                      recieptPlaceTF.rightViewMode = UITextField.ViewMode.always
                      recieptPlaceTF.addSubview(imageView2)
        
        
        let iconWidth5 = 10;
                     let iconHeight5 = 10;
                                          let imageView5 = UIImageView();
                                          let imageEmail5 = UIImage(named: "arrow.png");
                                          imageView5.image = imageEmail5;
                     let XLeft5 = Int(10)
                     let YLeft5 = 14 //Int(self.timeReceiptTF.layer.frame.size.height/2)
                     
                                   imageView5.frame = CGRect(x: XLeft5, y: YLeft5, width: iconWidth5, height: iconHeight5)
                                   recieptPlaceTF.rightViewMode = UITextField.ViewMode.always
                                   recieptPlaceTF.addSubview(imageView5)
        
               // tool bar of date piker
                      let toolBar = UIToolbar(frame: CGRect(x: 0, y: 40, width: self.view.frame.size.width, height: self.view.frame.size.height/10))

                      toolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)

                      toolBar.barStyle = UIBarStyle.blackTranslucent

                      toolBar.tintColor = UIColor.white

                      toolBar.backgroundColor = UIColor.black


                     
                      let okBarBtn = UIBarButtonItem(title: "تم", style: UIBarButtonItem.Style.plain, target: self, action: #selector(resturantViewController.donePressed))

                      let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)

                      let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width / 3, height: self.view.frame.size.height))

                      label.font = UIFont(name: "Helvetica", size: 12)

                      label.backgroundColor = UIColor.clear

                      label.textColor = UIColor.white

                      label.text = "اختار الوقت"

                      label.textAlignment = NSTextAlignment.center

                      let textBtn = UIBarButtonItem(customView: label)

                      toolBar.setItems([flexSpace,textBtn,flexSpace,okBarBtn], animated: true)

                      timeReceiptTF.inputAccessoryView = toolBar
               

        // Do any additional setup after loading the view.
        timeReceiptTF.delegate = self
           timeReceiptTF.tag = 0
         handleRefresh()
        collectionView.delegate = self
               collectionView.dataSource = self
        tableView.delegate = self
        tableView.dataSource = self
        refresher = UIRefreshControl()
               refresher.attributedTitle = NSAttributedString(string: "loading")
               refresher.addTarget(self, action: #selector (resturantViewController.handleRefresh), for: UIControl.Event.valueChanged)
              
               tableView.addSubview(refresher)
        
        
        
        //
      //  selectedArray = [food_list[selectedIndex]]
        // indi ator
        indicatorView.backgroundColor = UIColor(red: 0.10, green: 0.58, blue: 0.73, alpha: 1.00)
        indicatorView.frame = CGRect(x: collectionView.bounds.minX, y: collectionView.bounds.maxY - indicatorHeight, width: collectionView.bounds.width / CGFloat(catalog_list.count), height: indicatorHeight)
        collectionView.addSubview(indicatorView)
       // collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: .right)
  //    collectionView.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        self.collectionView.scrollToItem(at: //scroll collection view to indexpath
                       NSIndexPath.init(row:(self.collectionView?.numberOfItems(inSection: 0))!-1, //get last item of self collectionview (number of items -1)
                           section: 0) as IndexPath //scroll to bottom of current section
                       , at: UICollectionView.ScrollPosition.bottom, //right, left, top, bottom, centeredHorizontally, centeredVertically
                       animated: true)
    }
    func collectionReloadData(){
           DispatchQueue.main.async(execute: {
               self.collectionView.reloadData()
           })
       }
  
    
    @IBAction func recieptTime(_ sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()

                              datePickerView.datePickerMode = UIDatePicker.Mode.time
                              datePickerView.locale = Locale.init(identifier: "ar")

                              sender.inputView = datePickerView

                              datePickerView.addTarget(self, action: #selector(resturantViewController.timePicker), for: UIControl.Event.valueChanged)
    }
    @objc  func timePicker (sender:UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "hh:mm a"
        
        //    dateFormatter.timeStyle = DateFormatter.Style.none
        dateFormatter.locale = Locale.init(identifier: "ar")
        let pet =    dateFormatter.string(from: sender.date)
        timeReceiptTF.text = "وقت استلام الطلب  \(pet)"
    
     
        
    }
     @objc func donePressed(sender: UIBarButtonItem) {
          
           
               timeReceiptTF.resignFirstResponder()
                let dateFormatter = DateFormatter()
                          
                          // set the dateFormatter's dateFormat to the dateString's format
                          dateFormatter.dateFormat = "hh:mm a"
                          dateFormatter.locale = Locale.init(identifier: "ar")


           }
    @objc public func handleRefresh() {

          
          API.getCategory{ (error: Error?, category_list:[foodCatalog]?) in
              if let category_list = category_list {
                  self.catalog_list = category_list
                self.food_list = (self.catalog_list.first?.foods)!
                self.media_list = (self.catalog_list.first?.mediaArray)!
                  if (self.refresher) != nil {
                      self.refresher.endRefreshing()
                  }
               
                      self.collectionReloadData()
                self.selectedArray = self.catalog_list[0].foods
                self.refreshContent()
                 
                //  self.handleRefresh()
              }
          }
          
      }
    
       func refreshContent(){
        selectedArray =  catalog_list[selectedIndex].foods
       // selectedArray = [food_list[selectedIndex]]
           tableView.reloadData()
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
extension resturantViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView {
        return catalog_list.count
        }
   
        return arrayOfStrings.count
        
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView {
            let cell : foodCatalogCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "foodCatalogCollectionViewCell", for: indexPath) as! foodCatalogCollectionViewCell
        cell.catalogName.text = catalog_list[indexPath.row].name
        cell.containerView.layer.cornerRadius = 15
     // cell.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        cell.layoutIfNeeded()
            return cell
        }
        else {
               let cellB : MenuCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCollectionViewCell", for: indexPath) as! MenuCollectionViewCell
            cellB.menuLabel.text = arrayOfStrings[indexPath.row]
            cellB.menuPic.image = MenuPicture[indexPath.item]
            cellB.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.95, alpha: 1.00)
            cellB.containerView.backgroundColor =  UIColor(red: 0.93, green: 0.93, blue: 0.95, alpha: 1.00)
         // cell.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            cellB.layoutIfNeeded()
               return cellB
           }
        
     
        
    }
   func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
          cell.layoutIfNeeded()
      }
   

  
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.collectionView {
        selectedIndex = indexPath.item
        refreshContent()
    }
    }
   
    
   
    

    
    // cell size
    
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if collectionView == self.collectionView {
        let width : CGFloat
        let height : CGFloat

      
            // First section
    width = 375
            height = 60

            return CGSize(width: width, height: height)

    }
    else {
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
  
    
}
extension resturantViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return selectedArray.count
    }
//    private func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
//        // Do what ever you want
//        handleRefresh()
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodTypeTableViewCell", for: indexPath) as! foodTypeTableViewCell
        cell.foodName.text = selectedArray[indexPath.section].name
        cell.priceLabel.text  = selectedArray[indexPath.section].price
       cell.foofDescription.text = selectedArray[indexPath.section].description
        cell.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.95, alpha: 1.00)
   ///
        
        cell.containerView.clipsToBounds = true
        cell.containerView.layer.masksToBounds = false
        cell.containerView.layer.borderWidth = 1
        cell.containerView.layer.borderColor = UIColor.white.cgColor
     
       // soonLbl.clipsToBounds = true
        
        //To apply Shadow
        cell.containerView.layer.shadowOpacity = 1
        cell.containerView.layer.shadowRadius = 3.0
        cell.containerView.layer.shadowOffset = CGSize.zero // Use any CGSize
        cell.containerView.layer.shadowColor = UIColor.darkGray.cgColor
        
     
    
        
        
        return cell
    }
    
    
   
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 150
    }
    

    
}
extension UICollectionViewFlowLayout {

    open override var flipsHorizontallyInOppositeLayoutDirection: Bool {
        return true
    }

}
