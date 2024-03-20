//
//  Extension.swift
//  Find Job
//
//  Created by Олег Ковалев on 13.03.2024.
//

import UIKit

extension BaseCoordinator {
    func addTabBarItem(image: UIImage?, title: String, tag: Int) -> UITabBarItem {
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(title: title, image: image, tag: tag)
        tabBarItem.title = title
        return tabBarItem
    }
}

extension UITextField {
    func setLeftImage(image: UIImage) {
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 8, y: 0, width: 20, height: 20)
        
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 34, height: 20))
        containerView.addSubview(imageView)
        
        leftView = containerView
        leftViewMode = .always
    }
}

extension UIViewController {
     func moveViewUpAndDown() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { (nc) in
            self.view.frame.origin.y = -100
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { (nc) in
            self.view.frame.origin.y = 0
        }
    }
    
    func setupNavBarAndItem() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.hidesBackButton = true
    }
}


extension UILabel {
    convenience init(title: String) {
        self.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        self.text = title
    }
}


extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(boundingBox.height)
    }
}

private var associatedValues = [UIImageView: Bool]()

extension UIImageView {
    var isFavorite: Bool {
        get {
            return associatedValues[self] ?? false
        }
        set {
            associatedValues[self] = newValue
        }
    }
}



