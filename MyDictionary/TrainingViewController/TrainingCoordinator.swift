import UIKit

class TrainingCoordinator: Coordinator {
  private let presenter: UINavigationController
  private var mainMenuViewController: MainMenuViewController?
  private var trainingViewController: TrainingViewController?

  init(presenter: UINavigationController) {

    self.presenter = presenter
  }

  func start() {
    let trainingViewController = TrainingViewController()

    presenter.pushViewController(trainingViewController, animated: true)
    self.trainingViewController = trainingViewController
  }
}
