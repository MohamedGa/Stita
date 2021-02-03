//
//  registerViewController.swift
//  Stita
//
//  Created by Mohammed Gamal on 7/11/20.
//  Copyright © 2020 codelabs. All rights reserved.
//

import UIKit
import KGRadioButton

class registerViewController: UIViewController,UITextFieldDelegate  {
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var birthdayTF: UITextField!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var manBtn: KGRadioButton!
    @IBOutlet weak var womanBtn: KGRadioButton!
    @IBOutlet weak var upView: UIView!
    @IBOutlet weak var womanLabel: UILabel!
    @IBOutlet weak var manLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        upView.roundCorners(corners: [ .bottomRight, .bottomLeft], radius: 40)
        upView.backgroundColor = UIColor(red: 0.10, green: 0.58, blue: 0.73, alpha: 1.00)
        registerBtn.backgroundColor = UIColor(red: 0.10, green: 0.58, blue: 0.73, alpha: 1.00)
        nameTF.clipsToBounds = true
               nameTF.layer.masksToBounds = true
               nameTF.layer.borderWidth = 0.25
               nameTF.layer.borderColor = UIColor.white.cgColor
        nameTF.layer.cornerRadius = nameTF.frame.size.height / 2
        womanLabel.textColor = UIColor(red: 0.10, green: 0.58, blue: 0.73, alpha: 1.00)
        manLabel.textColor = UIColor(red: 0.10, green: 0.58, blue: 0.73, alpha: 1.00)
               //To apply Shadow
               nameTF.layer.shadowOpacity = 1
               nameTF.layer.shadowRadius = 3.0
               nameTF.layer.shadowOffset = CGSize.zero // Use any CGSize
               nameTF.layer.shadowColor = UIColor.gray.cgColor
             // Textfield placeholde color
               nameTF.attributedPlaceholder = NSAttributedString(string: "الأسم",
               attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.10, green: 0.58, blue: 0.73, alpha: 1.00)])
        // Do any additional setup after loading the view.
        phoneTF.clipsToBounds = true
               phoneTF.layer.masksToBounds = true
               phoneTF.layer.borderWidth = 0.25
               phoneTF.layer.borderColor = UIColor.white.cgColor
        phoneTF.layer.cornerRadius = phoneTF.frame.size.height / 2

               //To apply Shadow
               phoneTF.layer.shadowOpacity = 1
               phoneTF.layer.shadowRadius = 3.0
               phoneTF.layer.shadowOffset = CGSize.zero // Use any CGSize
               phoneTF.layer.shadowColor = UIColor.gray.cgColor
             // Textfield placeholde color
               phoneTF.attributedPlaceholder = NSAttributedString(string: "رقم الجوال",
               attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.10, green: 0.58, blue: 0.73, alpha: 1.00)])
        // Do any additional setup after loading the view.
        emailTF.clipsToBounds = true
                     emailTF.layer.masksToBounds = true
                     emailTF.layer.borderWidth = 0.25
                     emailTF.layer.borderColor = UIColor.white.cgColor
        emailTF.layer.cornerRadius = emailTF.frame.size.height / 2

                     //To apply Shadow
                     emailTF.layer.shadowOpacity = 1
                     emailTF.layer.shadowRadius = 3.0
                     emailTF.layer.shadowOffset = CGSize.zero // Use any CGSize
                     emailTF.layer.shadowColor = UIColor.gray.cgColor
                   // Textfield placeholde color
                     emailTF.attributedPlaceholder = NSAttributedString(string: "البريد الالكتروني",
                     attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.10, green: 0.58, blue: 0.73, alpha: 1.00)])
              // Do any additional setup after loading the view.
        birthdayTF.clipsToBounds = true
               birthdayTF.layer.masksToBounds = true
               birthdayTF.layer.borderWidth = 0.25
               birthdayTF.layer.borderColor = UIColor.white.cgColor
        birthdayTF.layer.cornerRadius = birthdayTF.frame.size.height / 2

               //To apply Shadow
               birthdayTF.layer.shadowOpacity = 1
               birthdayTF.layer.shadowRadius = 3.0
               birthdayTF.layer.shadowOffset = CGSize.zero // Use any CGSize
               birthdayTF.layer.shadowColor = UIColor.gray.cgColor
             // Textfield placeholde color
               birthdayTF.attributedPlaceholder = NSAttributedString(string: "تاريخ الميلاد",
               attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.10, green: 0.58, blue: 0.73, alpha: 1.00)])
        // Do any additional setup after loading the view.
        registerBtn.layer.cornerRadius = registerBtn.frame.size.height / 2
        manBtn.layer.cornerRadius = manBtn.frame.size.height / 2
        womanBtn.layer.cornerRadius = womanBtn.frame.size.height / 2
        
        //set the Tf icon
        //set the label font style to TF
                    //  instagramLabel.font = UIFont(name: "Pacifico", size: 50
                      
                      let iconWidth = 20;
                      let iconHeight = 20;
                      
                      //Define the imageView
                      let imageView = UIImageView();
                      let imageEmail = UIImage(named: "phone33.png");
                      imageView.image = imageEmail;
               imageView.frame = CGRect(x: 240, y: 12, width: iconWidth, height: iconHeight)
               phoneTF.rightViewMode = UITextField.ViewMode.always
               phoneTF.addSubview(imageView)
        //Define the imageView 2
               let imageView2 = UIImageView();
               let imageEmail2 = UIImage(named: "name.png");
               imageView2.image = imageEmail2;
        imageView2.frame = CGRect(x: 240, y: 12, width: iconWidth, height: iconHeight)
        nameTF.rightViewMode = UITextField.ViewMode.always
        nameTF.addSubview(imageView2)
        //Define the imageView 2
               let imageView3 = UIImageView();
               let imageEmail3 = UIImage(named: "email.png");
               imageView3.image = imageEmail3;
        imageView3.frame = CGRect(x: 240, y: 12, width: iconWidth, height: iconHeight)
        emailTF.rightViewMode = UITextField.ViewMode.always
        emailTF.addSubview(imageView3)
        //Define the imageView 2
                      let imageView4 = UIImageView();
                      let imageEmail4 = UIImage(named: "birthday.png");
                      imageView4.image = imageEmail4;
               imageView4.frame = CGRect(x: 240, y: 12, width: iconWidth, height: iconHeight)
               birthdayTF.rightViewMode = UITextField.ViewMode.always
               birthdayTF.addSubview(imageView4)
        
        
        // tool bar of date piker
               let toolBar = UIToolbar(frame: CGRect(x: 0, y: 40, width: self.view.frame.size.width, height: self.view.frame.size.height/10))

               toolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)

               toolBar.barStyle = UIBarStyle.blackTranslucent

               toolBar.tintColor = UIColor.white

               toolBar.backgroundColor = UIColor.black


              
               let okBarBtn = UIBarButtonItem(title: "تم", style: UIBarButtonItem.Style.plain, target: self, action: #selector(registerViewController.donePressed))

               let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)

               let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width / 3, height: self.view.frame.size.height))

               label.font = UIFont(name: "Helvetica", size: 12)

               label.backgroundColor = UIColor.clear

               label.textColor = UIColor.white

               label.text = "اختار اليوم"

               label.textAlignment = NSTextAlignment.center

               let textBtn = UIBarButtonItem(customView: label)

               toolBar.setItems([flexSpace,textBtn,flexSpace,okBarBtn], animated: true)

               birthdayTF.inputAccessoryView = toolBar
        
        // move up
        nameTF.delegate = self
        phoneTF.delegate = self
         emailTF.delegate = self
        birthdayTF.delegate = self
        nameTF.tag = 0
        phoneTF.tag = 0
        emailTF.tag = 0
        birthdayTF.tag = 0
        
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        self.hideKeyboardWhenTappedAround()

        
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
          animateViewMoving(up: true, moveValue: 150)
      }
      
      func textFieldDidEndEditing(_ textField: UITextField) {
          animateViewMoving(up: false, moveValue: 150)
      }
      
      func animateViewMoving (up:Bool, moveValue :CGFloat){
          let movementDuration:TimeInterval = 0.3
          let movement:CGFloat = ( up ? -moveValue : moveValue)
          UIView.beginAnimations( "animateView", context: nil)
          UIView.setAnimationBeginsFromCurrentState(true)
          UIView.setAnimationDuration(movementDuration )
          self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
          UIView.commitAnimations()
      }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        // Try to find next responder
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
            self.hideKeyboardWhenTappedAround()
        }
        // Do not add a line break
        return false
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
    @IBAction func textFieldEditing(_ sender: UITextField) {
        
            let datePickerView:UIDatePicker = UIDatePicker()
        
                datePickerView.datePickerMode = UIDatePicker.Mode.date
                datePickerView.calendar = Calendar(identifier: .gregorian)
                datePickerView.autoresizingMask = UIView.AutoresizingMask.flexibleRightMargin
                datePickerView.locale = Locale.init(identifier: "en")
                sender.inputView = datePickerView
        
        
                datePickerView.addTarget(self, action: #selector(registerViewController.datePickerValueChanged), for: UIControl.Event.valueChanged)
        
        
    }
    @objc func datePickerValueChanged(sender:UIDatePicker) {
           
           let dateFormatter = DateFormatter()
           
           
           dateFormatter.dateFormat = "dd-MM-yyyy"
           dateFormatter.calendar = Calendar(identifier: .gregorian)
           dateFormatter.locale = Locale.init(identifier: "en")
           //  dateFormatter.timeStyle = DateFormatter.Style.none
           
           birthdayTF.text = dateFormatter.string(from: sender.date)

       }
    @objc func donePressed(sender: UIBarButtonItem) {
      
       
           birthdayTF.resignFirstResponder()
           let dateFormatter = DateFormatter()
           dateFormatter.calendar = Calendar(identifier: .gregorian)
           dateFormatter.locale = Locale.init(identifier: "en")
           // set the dateFormatter's dateFormat to the dateString's format
           dateFormatter.dateFormat = "dd-MM-yyyy"

           // create date object
//           guard let tempDate = dateFormatter.date(from: birthdayTF.text!) else {
//               fatalError("wrong dateFormat")
//           }
//
//           // set the dateFormatter's dateFormat to the output format you wish to receive
//           dateFormatter.dateFormat = "dd" // LL is the stand-alone month
//           dateFormatter.locale = Locale.init(identifier: "en")
//
//           // set the dateFormatter's dateFormat to the output format you wish to receive
//           dateFormatter.dateFormat = "MM" // LL is the stand-alone month
//           dateFormatter.locale = Locale.init(identifier: "en")
//
//           // set the dateFormatter's dateFormat to the output format you wish to receive
//           dateFormatter.dateFormat = "yyyy" // LL is the stand-alone month
//           dateFormatter.locale = Locale.init(identifier: "en")
//
//       }
//           else
//       {
//           AlertManager.showAlert("الرجاء ادخال التاريخ ", inViewController: self)
//           }

       }
    
    
    @IBAction func manSelect(_ sender: KGRadioButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            manBtn.innerCircleCircleColor = UIColor(red: 0.10, green: 0.58, blue: 0.73, alpha: 1.00)
                womanBtn.innerCircleCircleColor = UIColor.white
        } else{
       manBtn.innerCircleCircleColor = UIColor.white
            womanBtn.innerCircleCircleColor = UIColor(red: 0.10, green: 0.58, blue: 0.73, alpha: 1.00)
         }
//        manBtn.innerCircleCircleColor = UIColor(red: 0.10, green: 0.58, blue: 0.73, alpha: 1.00)
//        womanBtn.innerCircleCircleColor = UIColor.white
    }
    
    @IBAction func womanSelect(_ sender: KGRadioButton) {
        sender.isSelected = !sender.isSelected
               if sender.isSelected {
                           manBtn.innerCircleCircleColor = UIColor.white
                                     womanBtn.innerCircleCircleColor = UIColor(red: 0.10, green: 0.58, blue: 0.73, alpha: 1.00)
               } else{
                     manBtn.innerCircleCircleColor = UIColor(red: 0.10, green: 0.58, blue: 0.73, alpha: 1.00)
                     womanBtn.innerCircleCircleColor = UIColor.white
                }
//        womanBtn.innerCircleCircleColor = UIColor(red: 0.10, green: 0.58, blue: 0.73, alpha: 1.00)
//        manBtn.innerCircleCircleColor = UIColor.white
    }
    
    @IBAction func registerTapped(_ sender: Any) {
        let phone = phoneTF.text!;
              let email = emailTF.text!;
              let name = nameTF.text!;
              let birthday = birthdayTF.text!;
             if (name.isEmpty || (email.isEmpty) || (birthday.isEmpty) || (phone.isEmpty))
                    {
                          DispatchQueue.main.async {
                                                   let alert = UIAlertController(title: "خطآ ", message: "يجب أدخال كل البيانات", preferredStyle: .alert)
                                                                                         alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                                                                                         }))
                                                                                         self.present(alert, animated: true)
                                                   }
                                  // displayMyAlertMessage( userMessage: "All Field are required")
                                  
                        return;
                    }
        API.firstRegister(phone: phone , email: email, name: name,birthdate:birthday ){(error :Error? , success : Bool) in
                   if success==true {
                    let alert = UIAlertController(title: "تم ", message: "تم آرسال كود التفعيل ", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                            let def = UserDefaults.standard
                                      def.setValue(phone, forKey: "phone")
                                      def.setValue(email, forKey: "email")
                                      def.setValue(name, forKey: "name")
                                      def.setValue(birthday, forKey: "birthdate")
                                     def.setValue(true, forKey: "isRegister")
                                      def.synchronize()
                self.performSegue(withIdentifier: "sms", sender: self)
                                        }))
                    
                    self.present(alert, animated: true)
                                   
                                                                   
                                                                                                                            
                                                                     
                                                                     
                    
        
    }
                   else {
                    let alert = UIAlertController(title: "لم يتم التسجيل", message: "يرجى تغيير البيانات", preferredStyle: .alert)
                                                                                                                                                                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                                                                                                                                                                    }))
                                                                                                                                                                    self.present(alert, animated: true)
                    
            }
            }
    

  
//self.performSegue(withIdentifier: "sms", sender: self)
}
    }
    

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

