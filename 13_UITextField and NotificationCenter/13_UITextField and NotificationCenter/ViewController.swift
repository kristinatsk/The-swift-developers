//
//  ViewController.swift
//  13_UITextField and NotificationCenter
//
//  Created by Kristina Kostenko on 02.08.2024.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{

    var myTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createTextField()
        myTextField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(textFieldDidChange), name: UITextField.textDidChangeNotification, object: nil) //first param can be another viewcontroller
        
        //show keyboard and upper
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { (nc) in
            self.view.frame.origin.y = -200
        }
        //hide keyboard when tap return
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { (nc) in
            self.view.frame.origin.y = 0.0
        }
    }

    //MARK: createUI
    
    func createTextField() {
        let textFieldFrame = CGRect(x: 0, y: 0, width: 200, height: 31)
        
        myTextField = UITextField(frame: textFieldFrame)
        myTextField.borderStyle = UITextField.BorderStyle.roundedRect
        myTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        myTextField.textAlignment = .center
        myTextField.placeholder = "I'm the swift developer"
        myTextField.center = self.view.center
        view.addSubview(self.myTextField)
    }
    
    
    //MARK: UITextFieldDelegate
   
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldBeginEditing - I'm responding for editing")
        return true
    }


    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing - editing was began")
    }
    
     func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
         print("textFieldShouldEndEditing - editing was ended")
         return true
     }

    

    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        print("textFieldDidEndEditing")
    }

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        //here can realise validation email or smth
        print("textField you did input \(string)")
        return true
    }

    
    func textFieldDidChangeSelection(_ textField: UITextField){
        print("textFieldDidChangeSelection")
    }

    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("textFieldShouldClear - you cleared smth")
        return true
        
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn - Do you want to hide keyboard?")
        
            self.myTextField.resignFirstResponder()
            //self.myTextField.becomeFirstResponder()
        
        return true
    }

    
    /**
     * @abstract Asks the delegate for the menu to be shown for the specified text range.
     *
     * @param textField                   The text field requesting the menu.
     * @param range                            The characters range for which the menu is presented for.
     * @param suggestedActions   The actions and commands that the system suggests.
     *
     * @return Return a UIMenu describing the desired menu hierarchy. Return @c nil to present the default system menu.
     */
   
    func textField(_ textField: UITextField, editMenuForCharactersIn range: NSRange, suggestedActions: [UIMenuElement]) -> UIMenu? {
        
        return nil
    }

    
    /**
     * @abstract Called when the text field is about to present the edit menu.
     *
     * @param textField    The text field displaying the menu.
     * @param animator      Appearance animator. Add animations to this object to run them alongside the appearance transition.
     */
    func textField(_ textField: UITextField, willPresentEditMenuWith animator: any UIEditMenuInteractionAnimating) {
        
    }

    
    /**
     * @abstract Called when the text field is about to dismiss the edit menu.
     *
     * @param textField    The text field displaying the menu.
     * @param animator      Dismissal animator. Add animations to this object to run them alongside the dismissal transition.
     */
    func textField(_ textField: UITextField, willDismissEditMenuWith animator: any UIEditMenuInteractionAnimating) {
        
    }

    //MARK: Notification
    @objc func textFieldDidChange(ncParam: NSNotification) {
        print("UITextFieldDidChange = \(ncParam)")
    }

}

