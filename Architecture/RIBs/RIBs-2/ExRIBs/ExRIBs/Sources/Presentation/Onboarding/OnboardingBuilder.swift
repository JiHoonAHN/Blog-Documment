//
//  OnboardingBuilder.swift
//  ExRIBs
//
//  Created by Ji-hoon Ahn on 2022/11/11.
//

import RIBs

protocol OnboardingDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class OnboardingComponent: Component<OnboardingDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol OnboardingBuildable: Buildable {
    func build(withListener listener: OnboardingListener) -> OnboardingRouting
}

final class OnboardingBuilder: Builder<OnboardingDependency>, OnboardingBuildable {

    override init(dependency: OnboardingDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: OnboardingListener) -> OnboardingRouting {
        let component = OnboardingComponent(dependency: dependency)
        let viewController = OnboardingViewController()
        let interactor = OnboardingInteractor(presenter: viewController)
        interactor.listener = listener
        return OnboardingRouter(interactor: interactor, viewController: viewController)
    }
}
