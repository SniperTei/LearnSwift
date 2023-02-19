//
//  TabbarViewController.swift
//  LearningSwift
//
//  Created by Sniper on 2023/1/19.
//

import UIKit

class TabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.tabBar.tintColor = ConstColor.mainColor
        self.tabBar.barTintColor = UIColor.white
        
        let homeVC = HomeViewController()
        let homeNav = UINavigationController(rootViewController: homeVC)
        homeNav.tabBarItem.title = "首页"
        homeNav.tabBarItem.image = UIImage(named: "tabbar_home")
        homeNav.tabBarItem.selectedImage = UIImage(named: "tabbar_home_selected")
        
        let movieNewsVC = MovieNewsViewController()
        movieNewsVC.title = "影视"
        let movieNewsNav = UINavigationController(rootViewController: movieNewsVC)
        movieNewsNav.tabBarItem.title = "影视"
        movieNewsNav.tabBarItem.image = UIImage(named: "tabbar_play")
        movieNewsNav.tabBarItem.selectedImage = UIImage(named: "tabbar_play_selected")
        
        let foodVC = FoodViewController()
        foodVC.title = "美食"
        let foodNav = UINavigationController(rootViewController: foodVC)
        foodNav.tabBarItem.title = "美食"
        foodNav.tabBarItem.image = UIImage(named: "tabbar_food")
        foodNav.tabBarItem.selectedImage = UIImage(named: "tabbar_food_selected")
        
        let mineVC = ViewController()
        mineVC.title = "我的"
        let mineNav = UINavigationController(rootViewController: mineVC)
        mineNav.tabBarItem.title = "我的"
        mineNav.tabBarItem.image = UIImage(named: "tabbar_mine")
        mineNav.tabBarItem.selectedImage = UIImage(named: "tabbar_mine_selected")
        
        self.viewControllers = [homeNav, movieNewsNav, foodNav, mineNav]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
