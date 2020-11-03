//
//  ViewController.swift
//  AlinaAssignment
//
//  Created by madhur on 02/11/20.
//  Copyright © 2020 Madhur. All rights reserved.
//

import UIKit
import TinyConstraints
class ViewController: UIViewController {
    
    private let button: UIButton = {
      let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 52))
        button.setTitle("Log in", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBlue
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.center = view.center
    }
    
    @objc func didTapButton(){
        let tabBarVC = UITabBarController()
        let vc1 = UINavigationController(rootViewController: FirstViewController())
        let vc2 = UINavigationController(rootViewController: ExploreViewController())
        let vc3 = UINavigationController(rootViewController: ThirdViewController())
        let vc4 = UINavigationController(rootViewController: ForthViewController())
        let vc5 = UINavigationController(rootViewController: FifthViewController())
        
        let tabIcons = ["house" , "bell" , "person.circle" , "star" , "gear"]
        
        vc1.title = "Home"
        vc2.title = "Explore"
        vc3.title = "Graph"
        vc4.title = "Profile"
        vc5.title = "Tips"
        
        tabBarVC.setViewControllers([vc1,vc2,vc3,vc4,vc5], animated:false)
        
        guard let items = tabBarVC.tabBar.items else {
            return
        }
        
        for x in 0..<items.count{
            items[x].image = UIImage(systemName: tabIcons[x])
        }
        
        
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC,animated: true)
    }
   
 
}











