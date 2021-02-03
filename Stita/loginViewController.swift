//
//  loginViewController.swift
//  Stita
//
//  Created by Mohammed Gamal on 7/1/20.
//  Copyright © 2020 codelabs. All rights reserved.
//

import UIKit

class loginViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var upView: UIView!
    @IBOutlet weak var helloLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        upView.roundCorners(corners: [ .bottomRight, .bottomLeft], radius: 40)
        //set the label font style to TF
             //  instagramLabel.font = UIFont(name: "Pacifico", size: 50)
               
               let iconWidth = 20;
               let iconHeight = 20;
               
               //Define the imageView
               let imageView = UIImageView();
               let imageEmail = UIImage(named: "call.png");
               imageView.image = imageEmail;
        imageView.frame = CGRect(x: 240, y: 12, width: iconWidth, height: iconHeight)
        phoneTF.rightViewMode = UITextField.ViewMode.always
        phoneTF.addSubview(imageView)
      phoneTF.layer.cornerRadius = phoneTF.frame.size.height / 2
        loginBtn.layer.cornerRadius = loginBtn.frame.size.height / 2
        loginBtn.backgroundColor = UIColor(red: 0.10, green: 0.58, blue: 0.73, alpha: 1.00)
        helloLabel.textColor = UIColor(red: 0.10, green: 0.58, blue: 0.73, alpha: 1.00)
        
        
        phoneTF.clipsToBounds = true
        phoneTF.layer.masksToBounds = true
        phoneTF.layer.borderWidth = 0.25
        phoneTF.layer.borderColor = UIColor.white.cgColor
        upView.backgroundColor = UIColor(red: 0.10, green: 0.58, blue: 0.73, alpha: 1.00)
        //To apply Shadow
        phoneTF.layer.shadowOpacity = 1
        phoneTF.layer.shadowRadius = 3.0
        phoneTF.layer.shadowOffset = CGSize.zero // Use any CGSize
        phoneTF.layer.shadowColor = UIColor.gray.cgColor
      // Textfield placeholde color
        phoneTF.attributedPlaceholder = NSAttributedString(string: "رقم الجوال",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.10, green: 0.58, blue: 0.73, alpha: 1.00)])
        // Do any additional setup after loading the view.
        // move up
        phoneTF.delegate = self
        phoneTF.tag = 0
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
               view.addGestureRecognizer(tap)
               self.hideKeyboardWhenTappedAround()
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
    
    @IBAction func loginTapped(_ sender: Any) {
          let phone = phoneTF.text!;
        if (phone.isEmpty )
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
        API.firstLogin(phone: phone){(error :Error? , success : Bool) in
                          if success==true {
                           let alert = UIAlertController(title: "تم ", message: "تم آرسال كود التفعيل ", preferredStyle: .alert)
                               alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                                   let def = UserDefaults.standard
                                             def.setValue(phone, forKey: "phone")
                                            def.setValue(true, forKey: "isLoggedIn")
                                            
                                             def.synchronize()
                       self.performSegue(withIdentifier: "sms2", sender: self)
                                               }))
                           
                           self.present(alert, animated: true)
                                          
                                                                          
                                                                                                                                   
                                                                            
                                                                            
                           
               
           }
                          else {
                           let alert = UIAlertController(title: "لم يتم التسجيل", message: "رقم الجوال قد يكون غير صحيح", preferredStyle: .alert)
                                                                                                                                                                           alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                                                                                                                                                                           }))
                                                                                                                                                                           self.present(alert, animated: true)
                           
                   }
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
extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
