import RIBs
import UIKit

protocol RootInteractable: Interactable, OnboardingListener, MainListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {
    // MARK: - Onboarding
    private let onboardingBuilder: OnboardingBuildable
    private var onboardingRouting: OnboardingRouting?
    // MARK: - Main
    private let mainBuilder: MainBuildable
    private var mainRouting: MainRouting?
    
    init(
        onboardingBuilder: OnboardingBuildable,
        mainBuilder: MainBuildable,
        interactor: RootInteractable,
        viewController: RootViewControllable
    ) {
        self.mainBuilder = mainBuilder
        self.onboardingBuilder = onboardingBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}

extension RootRouter {
    // MARK: - Attach
    func attachOnboarding() {
        guard onboardingRouting == nil else { return }
        let router = onboardingBuilder.build(withListener: interactor)
        let vc = router.viewControllable.uiviewController
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overFullScreen
        viewControllable.uiviewController.present(vc, animated: true)
        attachChild(router)
        self.onboardingRouting = router
    }
    func attachMain() {
        guard mainRouting == nil else { return }
        let router = mainBuilder.build(withListener: interactor)
        let vc = router.viewControllable.uiviewController
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overFullScreen
        viewControllable.uiviewController.present(vc, animated: true)
        attachChild(router)
        self.mainRouting = router
    }
    // MARK: - Detach
    func detachOnboarding() {
        guard let router = onboardingRouting else { return }
        viewController.uiviewController.dismiss(animated: true)
        self.onboardingRouting = nil
        detachChild(router)
    }
    func detachMain() {
        guard let router = mainRouting else { return }
        viewController.uiviewController.dismiss(animated: true)
        self.onboardingRouting = nil
        detachChild(router)
    }
}
