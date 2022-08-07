import UIKit
import Informator
import WindowController

public final class UIAlertControllerInformatorPresenter: InformatorPresenter {
  private let windowController: WindowController

  public init(windowController: WindowController) {
    self.windowController = windowController
  }

  public func execute(_ request: InformatorRequest) async {
    await Task { @MainActor in
      await withCheckedContinuation { continuation in
        let alertController = UIAlertController(title: request.message.messageTitle,
                                                message: request.message.messageBody,
                                                preferredStyle: .alert)

        for action in request.actions {
          let alertAction = UIAlertAction(title: action.title, style: action.style.alertActionStyle, handler: { alertAction in
              Task {
                  await action.invoke()
                  continuation.resume()
              }
          })
          alertController.addAction(alertAction)
        }

        self.windowController.show(alertController, at: .init(raw: 0))
      }
    }.value
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
