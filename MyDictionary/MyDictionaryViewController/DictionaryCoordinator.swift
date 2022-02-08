import UIKit

class DictionaryCoordinator: Coordinator {
  private let presenter: UINavigationController
  private var mainMenuViewController: MainMenuViewController?
  private var dictionaryViewController: DictionaryViewController?
  private let dataManager: DataManager

  init(presenter: UINavigationController, dataManager: DataManager) {

    self.presenter = presenter
    self.dataManager = dataManager
  }

  func start() {
    let dictionaryViewController = DictionaryViewController()

    presenter.pushViewController(dictionaryViewController, animated: true)
    self.dictionaryViewController = dictionaryViewController
  }
}
