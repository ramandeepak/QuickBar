//
//  QuickBar.swift
//  QuickBar
//
//  Created by Deepak Raman on 12/25/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import UIKit

public typealias QuickBarLabel = UILabel

public enum QuickBarAnimation {
    case slideTopBottom
    case none
}

public class QuickBar: QuickBarLabel {
    
    private var animation: QuickBarAnimation?
    
    private var applicationWindow: UIWindow? {
        guard let _applicationWindow = UIApplication.shared.keyWindow else {
            return nil
        }
        return _applicationWindow
    }
    
    private var yCoordinate: CGFloat {
        set {
            self.frame.origin.y = newValue
        }
        get {
            return self.frame.origin.y
        }
    }
    
    public init(quickMessage: String, animation: QuickBarAnimation = .slideTopBottom) {
        super.init(frame: CGRect.zero)
        
        guard let _window = applicationWindow else {
            print("Error: Could not initialize QuickBar.")
            return
        }
        self.frame = CGRect(x: (_window.center.x - 75.0), y: -50.0, width: 150.0, height: 35.0)
        self.backgroundColor = UIColor.blue
        
        self.text = quickMessage
        self.textColor = UIColor.white
        self.textAlignment = .center
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 10.0
        
        self.animation = animation
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func present() {
        guard let _window = self.applicationWindow else {
            print("Error: Could not present QuickBar.")
            return
        }
        _window.addSubview(self)
        
        guard let _animation = self.animation else {
            self.performAnimation(animation: .slideTopBottom)
            return
        }
        self.performAnimation(animation: _animation)
    }
    
    private func performAnimation(animation: QuickBarAnimation) {
        switch animation {
        case .slideTopBottom:
            self.slideTopBottom()
        case .none:
            self.noAnimation()
        }
    }
    
    private func slideTopBottom() {
        UIView.animate(withDuration: 0.15, delay: 0, options: [.curveEaseOut], animations: {
                self.yCoordinate += 65.0
                self.layoutIfNeeded()
        }, completion: { _ in
            
        UIView.animate(withDuration: 0.15, delay: 2.0, options: [.curveEaseOut], animations: {
                self.yCoordinate += -115.0
                self.layoutIfNeeded()
        }, completion: nil)
        })
    }
    
    private func noAnimation() { }
    
}
