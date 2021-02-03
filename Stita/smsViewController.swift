//
//  smsViewController.swift
//  Stita
//
//  Created by Mohammed Gamal on 7/11/20.
//  Copyright © 2020 codelabs. All rights reserved.
//

import UIKit

class smsViewController: UIViewController , UITextFieldDelegate {
    @IBOutlet weak var viewTF: UIView!
    @IBOutlet weak var oneTF: UITextField!
    @IBOutlet weak var twoTF: UITextField!
    @IBOutlet weak var threeTF: UITextField!
    @IBOutlet weak var fourTF: UITextField!
    @IBOutlet weak var downView: UIView!
    @IBOutlet weak var confirmBtn: UIButton!
    @IBOutlet weak var timerLbl: UILabel!
    @IBOutlet weak var upView: UIView!
    // var user_list = [userData]()
        var refresher : UIRefreshControl!
     var user_list = userData()
    
    //      var timer: CountdownTimer!
    var timer: Timer?
     var timeCounter: Double = 0
    var index: Int = -1
    
     var expiryTimeInterval: TimeInterval? {
           didSet {

               if timer == nil
               {
                   startTimer()
                   RunLoop.current.add(timer!, forMode: .common)
               }

           }
           
       }
    func resetTimer(){

        self.timer?.invalidate()
               self.timer = nil
        let finalResult = 299
        
        self.expiryTimeInterval = Double(finalResult)
        
    }
    
   private func startTimer() {
        if let interval = expiryTimeInterval {
            timeCounter = interval
            if #available(iOS 10.0, *) {
                timer = Timer(timeInterval: 1.0,
                              repeats: true,
                              block: { [weak self] _ in
                                guard let strongSelf = self else {
                                    return
                                }
                                strongSelf.onComplete()
                })
            } else {
                timer = Timer(timeInterval: 1.0,
                              target: self,
                              selector: #selector(onComplete),
                              userInfo: nil,
                              repeats: true)
            }
        }
    }
   @objc func onComplete() {
    guard timeCounter > 0 else {
        
        if isRegister() {
    
     //   btnGoForTest.isUserInteractionEnabled = false
      //  myLabel.text = "Time ended."
      //  stateImage.image = UIImage(named: "close")
        self.timer?.invalidate()
        self.timer = nil
        guard let email = helper.getEmail() else {return}
        guard let name = helper.getName() else {return}
        guard let birthdate = helper.getBirthDate() else {return}
        guard let phone = helper.getPhone() else {return}
                      
        API.firstRegister(phone: phone , email: email, name: name,birthdate:birthdate ){(error :Error? , success : Bool) in
           if success==true {
              
//                self.timer?.invalidate()
//                self.timer = nil
//                self.startTimer()
            
                 DispatchQueue.main.async {
                 let alert = UIAlertController(title:  "تم ", message: "تم آرسال كود التفعيل مرة أخرى ", preferredStyle: .alert)
                                                       alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                                                        self.resetTimer()
                                                       }))
                                                       self.present(alert, animated: true)
                 }
                print("ok")

            }
                
            else
                
            {
                self.resetTimer()
                
             print("NO Thing")
            }


        }
        }
        if isLoggedIn(){
            self.timer?.invalidate()
                 self.timer = nil
             guard let phone = helper.getPhone() else {return}
            API.firstLogin(phone: phone){(error :Error? , success : Bool) in
                              if success==true {
                               let alert = UIAlertController(title: "تم ", message: "تم آرسال كود التفعيل ", preferredStyle: .alert)
                                   alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                                    self.resetTimer()
                                       let def = UserDefaults.standard
                                                 def.setValue(phone, forKey: "phone")
                                                
                                                
                                                 def.synchronize()
                          
                                                   }))
                               
                               self.present(alert, animated: true)
                                              
                                                                              
                                                                                                                                       
                   
               }
                              else {
                                self.resetTimer()
                               let alert = UIAlertController(title: "لم يتم التسجيل", message: "رقم الجوال قد يكون غير صحيح", preferredStyle: .alert)
                                                                                                                                                                               alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                                                                                                                                                                               }))
                                                                                                                                                                               self.present(alert, animated: true)
                               
                       }
                       }
            
            
        }
        return
    }
    // btnGoForTest.isUserInteractionEnabled = true
   //  let hours = Int(timeCounter) / 3600
     let minutes = Int(timeCounter) / 60 % 60
     let seconds = Int(timeCounter) % 60

     timerLbl.text = String(format:"%02i:%02i",  minutes, seconds)

     timeCounter -= 1
     print("\(timeCounter)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        upView.roundCorners(corners: [ .bottomRight, .bottomLeft], radius: 40)
        upView.backgroundColor = UIColor(red: 0.10, green: 0.58, blue: 0.73, alpha: 1.00)
        confirmBtn.backgroundColor = UIColor(red: 0.10, green: 0.58, blue: 0.73, alpha: 1.00)
        // keyBoard Setting
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
              view.addGestureRecognizer(tap)
              self.hideKeyboardWhenTappedAround()
        //timer intio
        
        timer?.invalidate()

        timer = nil
        let finalResult = 299
        
        self.expiryTimeInterval = Double(finalResult)
        
        //text delegate
        oneTF.delegate = self
        twoTF.delegate = self
        threeTF.delegate = self
               fourTF.delegate = self
        //text cursor
        oneTF.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        twoTF.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        threeTF.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        fourTF.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
     
        
         confirmBtn.layer.cornerRadius = confirmBtn.frame.size.height / 2
        
        oneTF.clipsToBounds = true
        oneTF.layer.masksToBounds = true
        oneTF.layer.borderWidth = 0.25
        oneTF.layer.borderColor = UIColor.white.cgColor
        oneTF.layer.cornerRadius = 12

        //To apply Shadow
        oneTF.layer.shadowOpacity = 1
        oneTF.layer.shadowRadius = 3.0
        oneTF.layer.shadowOffset = CGSize.zero // Use any CGSize
        oneTF.layer.shadowColor = UIColor.gray.cgColor

        // Do any additional setup after loading the view.
        twoTF.clipsToBounds = true
        twoTF.layer.masksToBounds = true
        twoTF.layer.borderWidth = 0.25
        twoTF.layer.borderColor = UIColor.white.cgColor
        twoTF.layer.cornerRadius = 12

        //To apply Shadow
        twoTF.layer.shadowOpacity = 1
        twoTF.layer.shadowRadius = 3.0
        twoTF.layer.shadowOffset = CGSize.zero // Use any CGSize
        twoTF.layer.shadowColor = UIColor.gray.cgColor

        // Do any additional setup after loading the view.
        
        // Do any additional setup after loading the view.
        threeTF.clipsToBounds = true
        threeTF.layer.masksToBounds = true
        threeTF.layer.borderWidth = 0.25
        threeTF.layer.borderColor = UIColor.white.cgColor
        threeTF.layer.cornerRadius = 12

        //To apply Shadow
        threeTF.layer.shadowOpacity = 1
        threeTF.layer.shadowRadius = 3.0
        threeTF.layer.shadowOffset = CGSize.zero // Use any CGSize
        threeTF.layer.shadowColor = UIColor.gray.cgColor
        // Do any additional setup after loading the view.
        fourTF.clipsToBounds = true
        fourTF.layer.masksToBounds = true
        fourTF.layer.borderWidth = 0.25
        fourTF.layer.borderColor = UIColor.white.cgColor
        fourTF.layer.cornerRadius = 12

        //To apply Shadow
        fourTF.layer.shadowOpacity = 1
        fourTF.layer.shadowRadius = 3.0
        fourTF.layer.shadowOffset = CGSize.zero // Use any CGSize
        fourTF.layer.shadowColor = UIColor.gray.cgColor

        
    }
    fileprivate func isLoggedIn() -> Bool {
           return UserDefaults.standard.bool(forKey: "isLoggedIn")
       }
    fileprivate func isRegister() -> Bool {
           return UserDefaults.standard.bool(forKey: "isRegister")
       }
    override func viewWillAppear(_ animated: Bool) {
        if #available(iOS 13.0, *) {
            let app = UIApplication.shared
            let statusBarHeight: CGFloat = app.statusBarFrame.size.height
            
            let statusbarView = UIView()
            statusbarView.backgroundColor = UIColor(red: 0.10, green: 0.58, blue: 0.73, alpha: 1.00)
            view.addSubview(statusbarView)
          
            statusbarView.translatesAutoresizingMaskIntoConstraints = false
            statusbarView.heightAnchor.constraint(equalToConstant: statusBarHeight).isActive = true
            statusbarView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
            statusbarView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            statusbarView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
          
        } else {
            let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
            statusBar?.backgroundColor = UIColor(red: 0.10, green: 0.58, blue: 0.73, alpha: 1.00)
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 1
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
     //text cursor
    
  @objc func textFieldDidChange(textField: UITextField){
        let text = textField.text
        if  text?.count == 1 {
            switch textField{
            case oneTF:
                twoTF.becomeFirstResponder()
            case twoTF:
                threeTF.becomeFirstResponder()
            case threeTF:
                fourTF.becomeFirstResponder()
            case fourTF:
                fourTF.resignFirstResponder()
            default:
                break
            }
        }
    
        if  text?.count == 0 {
            switch textField{
            case oneTF:
                oneTF.becomeFirstResponder()
            case twoTF:
                oneTF.becomeFirstResponder()
            case threeTF:
                twoTF.becomeFirstResponder()
            case fourTF:
                threeTF.becomeFirstResponder()
            default:
                break
            }
        }
        else{

        }
    }
    //when user start editing clear textField
    func textFieldDidBeginEditing(_ textField: UITextField) {
           textField.text = ""
       }
    @IBAction func resendCodeTapped(_ sender: Any) {
        if isRegister() {
        guard let email = helper.getEmail() else {return}
               guard let name = helper.getName() else {return}
               guard let birthdate = helper.getBirthDate() else {return}
               guard let phone = helper.getPhone() else {return}
        API.firstRegister(phone: phone , email: email, name: name,birthdate:birthdate ){(error :Error? , success : Bool) in
                   if success {
                     
                    self.expiryTimeInterval = Double(299)
                        DispatchQueue.main.async {
                        let alert = UIAlertController(title:  "تم ", message: "تم آرسال كود التفعيل مرة أخرى ", preferredStyle: .alert)
                                                              alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                                                                self.resetTimer()
                                                              }))
                                                              self.present(alert, animated: true)
                        }
                       print("ok")
}
                   else
                       
                   {
                     self.resetTimer()
                    print("NO Thing")
                   }


               }
        
    }
    
        if isLoggedIn(){
            guard let phone = helper.getPhone() else {return}
            API.firstLogin(phone: phone){(error :Error? , success : Bool) in
                              if success==true {
                               let alert = UIAlertController(title: "تم ", message: "تم آرسال كود التفعيل ", preferredStyle: .alert)
                                
                                   alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                                    
                                       let def = UserDefaults.standard
                                                 self.resetTimer()
                         
                                                   }))
                               
                               self.present(alert, animated: true)
            
               }
                              else {
                                  self.resetTimer()
                               let alert = UIAlertController(title: "لم يتم التسجيل", message: "رقم الجوال قد يكون غير صحيح", preferredStyle: .alert)
                                                                                                                                                                               alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                                                                                                                                                                               }))
                                                                                                                                                                               self.present(alert, animated: true)
                               
                       }
                       }
            
            
        }
    }
    @IBAction func confirmTapped(_ sender: Any) {
        if isRegister(){
        let one = oneTF.text!;
                    let two = twoTF.text!;
                    let three = threeTF.text!;
                    let four = fourTF.text!;
                   if (one.isEmpty || (two.isEmpty) || (three.isEmpty) || (four.isEmpty))
                          {
                                DispatchQueue.main.async {
                                                         let alert = UIAlertController(title: "خطآ ", message: "يجب ادخال رقم التفعيل اولا المكون من ٤ ارقام", preferredStyle: .alert)
                                                                                               alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                                                                                               }))
                                                                                               self.present(alert, animated: true)
                                                         }
                                        // displayMyAlertMessage( userMessage: "All Field are required")
                                        
                              return;
                          }
        
        let code = String("\(oneTF.text!)\(twoTF.text!)\(threeTF.text!)\(fourTF.text!)")
        print(code)
        API.confirmRegister(code: code ){(error :Error? , success : Bool) in
            if success==true  {
                      
                       
                         DispatchQueue.main.async {
                         let alert = UIAlertController(title:  "تم ", message: "تم التسجيل بنجاح سيتم الانتقال الى الصفحة الرئيسية ", preferredStyle: .alert)
                                                               alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                                                                let Ok = "ok"
                                                                let def = UserDefaults.standard
                                                                def.setValue(true, forKey: "isRegister")
                                                                 def.setValue(Ok, forKey: "isActive")
                                                                
                                                                def.synchronize()
                                                                self.performSegue(withIdentifier: "goToHome", sender: self)
                                                               }))
                                                               self.present(alert, animated: true)
                         }
                        print("ok")

                    }
                        
           
                        
            else   {
                        DispatchQueue.main.async {
                        let alert = UIAlertController(title:  "خطأ ", message: "رقم التفعيل الذي ادخلته غير صحيح ", preferredStyle: .alert)
                                                              alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                                                              }))
                                                              self.present(alert, animated: true)
                        }
                     print("NO Thing")
                    }


                }
        
    }
        if isLoggedIn(){
            let one = oneTF.text!;
                               let two = twoTF.text!;
                               let three = threeTF.text!;
                               let four = fourTF.text!;
                              if (one.isEmpty || (two.isEmpty) || (three.isEmpty) || (four.isEmpty))
                                     {
                                           DispatchQueue.main.async {
                                                                    let alert = UIAlertController(title: "خطآ ", message: "يجب ادخال رقم التفعيل اولا المكون من ٤ ارقام", preferredStyle: .alert)
                                                                                                          alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                                                                                                          }))
                                                                                                          self.present(alert, animated: true)
                                                                    }
                                                   // displayMyAlertMessage( userMessage: "All Field are required")
                                                   
                                         return;
                                     }
                   
                   let code = String("\(oneTF.text!)\(twoTF.text!)\(threeTF.text!)\(fourTF.text!)")
                   print(code)
            API.getUserData(code: code){ (error: Error?, user_list:userData?) in

                       self.user_list = user_list!
                if user_list == nil {
                         DispatchQueue.main.async {
                                                                                              let alert = UIAlertController(title: "خطآ ", message: " رقم التفعيل غير صحيح", preferredStyle: .alert)
                                                                                                                                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                                                                                                                                    }))
                                                                                                                                    self.present(alert, animated: true)
                                                                                              }
                       }
                       else{
                           // self.offerName.text = offer_list.first!.o_name
                        DispatchQueue.main.async {
                                                let alert = UIAlertController(title:  "تم ", message: "تم التسجيل بنجاح سيتم الانتقال الى الصفحة الرئيسية ", preferredStyle: .alert)
                                                                                      alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                                                                                        let name = user_list!.name
                                                                                        let email = user_list!.email
                                                                                        let birthdate = user_list!.birthdate
                                                                                        let phone = user_list!.phone
                                                                                         let Ok = "ok"
                                                                                        
                                                                                                                  let def = UserDefaults.standard
                                                                                                                  def.setValue(name, forKey: "name")
                                                                                                                  def.setValue(email, forKey: "email")
                                                                                                                  def.setValue(phone, forKey: "phone")
                                                                                                               def.setValue(birthdate, forKey: "birthdate")
                                                                                        
                                                                                        def.setValue(Ok , forKey: "isActive")
                                                                                        def.setValue(birthdate, forKey: "birthdate")
                                                                                         def.setValue(true, forKey: "isLoggedIn")
                                                                                                                  def.synchronize()
                                                                                        self.performSegue(withIdentifier: "goToHome", sender: self)
                                                                                      }))
                                                                                      self.present(alert, animated: true)
                                                }
                      


                         //  self.goToHomePage()
                       }
                   }
            
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


