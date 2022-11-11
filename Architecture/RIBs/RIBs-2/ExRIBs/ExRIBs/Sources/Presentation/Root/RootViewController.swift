import RIBs
import RxSwift
import UIKit

protocol RootPresentableListener: AnyObject {}

final class RootViewController: BaseViewController, RootPresentable, RootViewControllable {
    
    weak var listener: RootPresentableListener?
    
}
