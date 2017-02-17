import UIKit
import Informator
import SystemWindowController

public final class UIAlertControllerInformatorPresenter: InformatorPresenter {
  private let windowController: SystemWindowController

  public init(windowController: SystemWindowController) {
    self.windowController = windowController
  }
  public func execute(_ request: InformatorRequest, completion: @escaping () -> Void) {
    DispatchQueue.main.async {
      let alertController = UIAlertController(title: request.message.messageTitle,
                                              message: request.message.messageBody,
                                              preferredStyle: .alert)

      for action in request.actions {
        let alertAction = UIAlertAction(title: action.title, style: action.style.alertActionStyle, handler: { alertAction in
          action.invoke()
          completion()
        })
        alertController.addAction(alertAction)
      }

      self.windowController.show(alertController, at: 0)
    }
  }
}

fileprivate extension InformatorAction.Style {
  var alertActionStyle: UIAlertAction.Style {
    switch self {
    case .cancel:
      return .cancel
    case .default:
      return .default
    case .destructive:
      return .destructive
    }
  }
}
