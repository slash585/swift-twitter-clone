//
//  Utilities.swift
//  SwiftTwitterClone
//
//  Created by Mehmet Ali Özdemir on 13.06.2023.
//

import UIKit

class Utilities {
    func inputContainerView(withImage image: UIImage, textField: UITextField) -> UIView {
        
        let view = UIView()
        let iv = UIImageView()
        let divider = UIView()
        
        view.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        iv.image = image
        
        view.addSubview(iv)
        iv.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, paddingLeft: 8, paddingBottom: 8)
        iv.setDimensions(width: 24, height: 24)
        
        
        view.addSubview(textField)
        textField.anchor(left: iv.rightAnchor, bottom: iv.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, paddingBottom: 0)
        
        view.addSubview(divider)
        divider.backgroundColor = .white
        divider.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, height: 0.75)
        
        return view
    }
    
    func textField(withPlaceholder placeholder: String) -> UITextField{
        let tf = UITextField()
        tf.textColor = .white
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        return tf
    }
    
    func loginAndRegisterButton(withButtonTitle title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.twitterBlue, for: .normal)
        button.backgroundColor = .white
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }
}
