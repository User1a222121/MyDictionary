import UIKit

class TrainingCoordinator: Coordinator {
  private let presenter: UINavigationController
  private var mainMenuViewController: MainMenuViewController?
  private var trainingViewController: TrainingViewController?
  private let dataManager: DataManager

  init(presenter: UINavigationController, dataManager: DataManager) {

    self.presenter = presenter
    self.dataManager = dataManager
  }

  func start() {
    let trainingViewController = TrainingViewController()

    presenter.pushViewController(trainingViewController, animated: true)
    self.trainingViewController = trainingViewController
  }
}
