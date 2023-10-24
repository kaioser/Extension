//
//  UIViewController+Extensions.swift
//  XKExtension
//
//  Created by 杨雄凯 on 2023/3/21.
//

public extension UIViewController {
    
    static func current() -> UIViewController? {
        let scene = UIApplication.shared.connectedScenes.first
        guard let windowScene = scene as? UIWindowScene else { return nil }
        guard let window = windowScene.windows.first else { return nil }
        return current(window.rootViewController)
    }
    
    func popAlert(_ title: String? = nil, message: String? = nil, style: UIAlertController.Style, actions: [UIAlertAction], needCancelAction: Bool = true) {
        let controller = UIAlertController(title: title, message: message, preferredStyle: style)
        for action in actions {
            controller.addAction(action)
        }
        if needCancelAction {
            controller.addAction(.init(title: "取消", style: .cancel))
        }
        present(controller, animated: true)
    }
}

extension UIViewController {
    
    static private func current(_ vc: UIViewController?) -> UIViewController? {
        
        if vc == nil { return nil }
        
        if let presentVC = vc?.presentedViewController {
            return current(presentVC)
        }
        
        else if let tabVC = vc as? UITabBarController {
            if let selectVC = tabVC.selectedViewController {
                return current(selectVC)
            }
            return nil
        }
        
        else if let nav = vc as? UINavigationController {
            return current(nav.visibleViewController)
        }
        
        else {
            return vc
        }
    }
}
