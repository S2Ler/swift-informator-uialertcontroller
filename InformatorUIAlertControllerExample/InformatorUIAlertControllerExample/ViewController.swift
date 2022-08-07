//
//  ViewController.swift
//  InformatorUIAlertControllerExample
//
//  Created by Aliaksandr Bialiauski on 7.08.22.
//

import UIKit
import Informator
import Informator_UIAlertController
import WindowController

@MainActor
let informatorWindowController: WindowController = .init(windowLevel: .alert, application: { .shared })

let informator: Informator = .init(
    presentor: UIAlertControllerInformatorPresenter(windowController: informatorWindowController)
)

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        Task {
            await informator.execute(.init(message: Message(title: "Async 1", body: "Await 1"), actions: [.okAction()]))
        }

        Task {
            await informator.execute(.init(message: Message(title: "Async 2", body: "Await 2"), actions: [.init(title: "Wait 1 sec", handler: { _ in
                try! await Task.sleep(nanoseconds: 1_000_000_000)
            })]))
        }

        Task {
            await informator.execute(.init(message: Message(title: "Async 3", body: "Await 3"), actions: [.okAction()]))
        }
    }
}

