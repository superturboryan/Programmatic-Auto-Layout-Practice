//
//  ViewController.swift
//  Programmatic-AutoLayout-Practice
//
//  Created by Ryan David Forsyth on 2019-02-23.
//  Copyright © 2019 Ryan F. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var redView: UIView = {
        
        let _redview = UIView()
        
        _redview.backgroundColor = UIColor.red
        
        _redview.translatesAutoresizingMaskIntoConstraints = false
        
        return _redview
        }()
    
    lazy var blueView: UIView = {
        
        let _blueview = UIView()
        
        _blueview.backgroundColor = UIColor.blue
        
        _blueview.translatesAutoresizingMaskIntoConstraints = false
        
        return _blueview
    }()
    
    var iPhonePortraitConstraints : [NSLayoutConstraint] = [NSLayoutConstraint]()
 
    var iPhoneLandscapeConstraints : [NSLayoutConstraint] = [NSLayoutConstraint]()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setupView()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        //iPhone Portrait Orientation:
        if view.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.compact && view.traitCollection.verticalSizeClass == UIUserInterfaceSizeClass.regular {
            
            //Deactivate landscape constraints
            if iPhoneLandscapeConstraints.count > 0 && iPhoneLandscapeConstraints[0].isActive {
                NSLayoutConstraint.deactivate(iPhoneLandscapeConstraints)
            }
            
            //Activate portrait constraints
            if iPhonePortraitConstraints.count > 0 && iPhonePortraitConstraints[0].isActive {
                NSLayoutConstraint.activate(iPhonePortraitConstraints)
            }
        }
        
        //iPhone Landscape Orientation:
        if view.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.regular && view.traitCollection.verticalSizeClass == UIUserInterfaceSizeClass.compact {
            
            //Deactivate portrait constraints
            if iPhonePortraitConstraints.count > 0 && iPhonePortraitConstraints[0].isActive {
                NSLayoutConstraint.deactivate(iPhonePortraitConstraints)
            }
            
            //Activate portrait constraints
            if iPhoneLandscapeConstraints.count > 0 && iPhoneLandscapeConstraints[0].isActive {
                NSLayoutConstraint.activate(iPhoneLandscapeConstraints)
            }
            
            
        }
    }
    
    func setupPortraitConstraints() {
        
        
    }
    
    
    
    
    func setupView() {
        
        view.addSubview(redView)
        view.addSubview(blueView)
        
        // Setting the cotent hugging priority
        redView.setContentHuggingPriority(UILayoutPriority(UILayoutPriority.defaultLow.rawValue + 1), for: .horizontal)
        
        //NSLayoutConstraint.activate() requires an array of [NSLayoutConstraint]
        
        var viewConstraints : [NSLayoutConstraint] = [NSLayoutConstraint]()
        
        // Vertical constraints:
        
        // Adding constraint for safe area! .safeAreaLayoutGuide
        viewConstraints.append(redView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0))
        
        viewConstraints.append(redView.heightAnchor.constraint(equalToConstant: 120))
        
        // Horizontal constraints:
        
        viewConstraints.append(redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0))
        
        viewConstraints.append(redView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0))
        
        //Old method for setting up view constraints:
        
        viewConstraints.append(NSLayoutConstraint(item: blueView, attribute: .top, relatedBy: .equal, toItem: redView, attribute: .bottom, multiplier: 1.0, constant: 20))
        
        viewConstraints.append(NSLayoutConstraint(item: blueView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0))
        
        viewConstraints.append(NSLayoutConstraint(item: blueView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0))
        
        viewConstraints.append(NSLayoutConstraint(item: blueView, attribute: .height, relatedBy: .equal, toItem: redView, attribute: .height, multiplier: 1.0, constant: 0))
        
        
        
        
        NSLayoutConstraint.activate(viewConstraints)
        
        
    }
    
    
    
}

