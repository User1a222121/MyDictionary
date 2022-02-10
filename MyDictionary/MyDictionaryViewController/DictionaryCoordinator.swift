import UIKit

class DictionaryCoordinator: Coordinator {
    
    private let presenter: UINavigationController
    private lazy var tabBarController = UITabBarController()
    private lazy var navigationControllers = DictionaryCoordinator.makeNavigationControllers()

    init(presenter: UINavigationController) {

    self.presenter = presenter
    }

  func start() {
      
      setupDictionaryVC()
      setupCollectionsVC()
      
      let navigationControllers = NavControllerSettings.allCases.compactMap {
          self.navigationControllers[$0]
      }
      tabBarController.setViewControllers(navigationControllers, animated: true)
      tabBarController.tabBar.tintColor = .black
      presenter.pushViewController(tabBarController, animated: true)
      
  }
    private func setupDictionaryVC() {
        guard let navigationController = navigationControllers[.dictionary] else { return }
        let dictionaryVC = DictionaryViewController()
        navigationController.setViewControllers([dictionaryVC], animated: true)
    }
    
    private func setupCollectionsVC() {
        guard let navigationController = navigationControllers[.collections] else { return }
        let collectionVC = CollectionViewController()
        navigationController.setViewControllers([collectionVC], animated: true)
    }
    
    fileprivate static func makeNavigationControllers() -> [NavControllerSettings: UINavigationController] {
        var result: [NavControllerSettings: UINavigationController] = [:]
        NavControllerSettings.allCases.forEach { navControllerKey in
            let navigationController = UINavigationController()
            let tabBarItem = UITabBarItem(title: navControllerKey.title,
                                          image: navControllerKey.image,
                                          tag: navControllerKey.rawValue)
            navigationController.tabBarItem = tabBarItem
            result[navControllerKey] = navigationController
        }
        return result
    }
}

// MARK: - enum NavControllerSettings
fileprivate enum NavControllerSettings: Int, CaseIterable {
    
    case dictionary, collections
    
    var image: UIImage? {
        switch self {
        case .dictionary:
            return UIImage(systemName: "books.vertical")
        case .collections:
            return UIImage(systemName: "doc.text.image")
        }
    }
    
    var title: String {
        switch self {
        case .dictionary:
            return "Словарик"
        case .collections:
            return "Коллекции"
        }
    }
}
