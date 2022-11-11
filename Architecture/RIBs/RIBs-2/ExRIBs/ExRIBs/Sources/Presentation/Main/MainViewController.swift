//
//  MainViewController.swift
//  ExRIBs
//
//  Created by Ji-hoon Ahn on 2022/11/11.
//

import RIBs
import RxSwift
import UIKit

protocol MainPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class MainViewController: BaseViewController, MainPresentable, MainViewControllable {

    weak var listener: MainPresentableListener?

}
