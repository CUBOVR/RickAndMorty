//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Cristobal Urquides on 20/04/26.
//

import UIKit

final class RMTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabs()
    }

    private func setUpTabs(){
        let tabItems = [
            setUpTabBarItems(name: "Characters", tag: 1, image: UIImage(systemName: "person")!, view: RMCharacterViewController()),
            setUpTabBarItems(name: "Locations", tag: 2, image: UIImage(systemName: "globe")!, view: RMLocationViewController()),
            setUpTabBarItems(name: "Episodes", tag: 3, image: UIImage(systemName: "tv")!, view: RMEpisodeViewController()),
            setUpTabBarItems(name: "Settings", tag: 4, image: UIImage(systemName: "gear")!, view: RMSettingsViewController())
        ]
        
        setViewControllers(tabItems, animated: true)
    }
    
    private func setUpTabBarItems(name: String, tag: Int, image: UIImage, view: UIViewController) -> UINavigationController{
        view.navigationItem.largeTitleDisplayMode = .automatic
        view.title = name
        view.view.backgroundColor = .systemBackground

        let nav = UINavigationController(rootViewController: view)
        nav.tabBarItem = UITabBarItem(title: name, image: image, tag: tag)
        nav.navigationBar.prefersLargeTitles = true
        
        return nav
    }
}

