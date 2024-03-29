//
//  UIDevice+Extensions.swift
//  XKExtension
//
//  Created by 杨雄凯 on 2023/3/21.
//

// MARK: - 判断方向

public extension UIDevice {
    
    /// 界面方向
    static func interfaceOrientation() -> UIInterfaceOrientation {
        guard let windowScene = firstWindowScene() else { return .unknown }
        return windowScene.interfaceOrientation
    }
    
    /// 获取scene
    static func firstWindowScene() -> UIWindowScene? {
        let scene = UIApplication.shared.connectedScenes.first
        let windowScene = scene as? UIWindowScene
        return windowScene
    }
    
    /// 获取window
    static func firstWindow() -> UIWindow? {
        guard let windowScene = firstWindowScene() else { return nil }
        guard let window = windowScene.windows.first else { return nil }
        return window
    }
}


// MARK: - 判断设备

public extension UIDevice {
    
    /// 是否为iPad
    static func isiPad() -> Bool {
        let model = UIDevice.current.model
        return model == "iPad"
    }
}

// MARK: - 判断值

public extension UIDevice {
    
    /// 是否为刘海屏
    static func isBangScreen() -> Bool {
        return safeDistanceBottom() > 0
    }
    
    /// 顶部安全区高度
    static func safeDistanceTop() -> CGFloat {
        guard let window = firstWindow() else { return 0 }
        return window.safeAreaInsets.top
    }
    
    /// 底部安全区高度
    static func safeDistanceBottom() -> CGFloat {
        guard let window = firstWindow() else { return 0 }
        return window.safeAreaInsets.bottom
    }
    
    /// 顶部状态栏高度（包括安全区）
    static func statusBarHeight() -> CGFloat {
        guard let windowScene = firstWindowScene() else { return 0 }
        guard let statusBarManager = windowScene.statusBarManager else { return 0 }
        return statusBarManager.statusBarFrame.height
    }
    
    /// 导航栏高度
    static func navigationBarHeight() -> CGFloat {
        return 44.0
    }
    
    /// 状态栏+导航栏的高度
    static func navigationFullHeight() -> CGFloat {
        return UIDevice.statusBarHeight() + UIDevice.navigationBarHeight()
    }
    
    /// 底部导航栏高度
    static func tabBarHeight() -> CGFloat {
        return 49.0
    }
    
    /// 底部导航栏高度（包括安全区）
    static func tabBarFullHeight() -> CGFloat {
        return UIDevice.tabBarHeight() + UIDevice.safeDistanceBottom()
    }
}
