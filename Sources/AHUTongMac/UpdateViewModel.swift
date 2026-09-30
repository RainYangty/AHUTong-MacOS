//
//  UpdateViewModel.swift
//  AHUTongMac
//
//  Created by 天澜微雨 on 2026/9/30.
//

import Sparkle
import SwiftUI
 
// 状态管理与控制器
@MainActor
final class UpdateViewModel: ObservableObject {
    @Published var canCheckForUpdates: Bool = false
    private let updaterController: SPUStandardUpdaterController

    init() {
        // startingUpdater: true 表示 App 启动时自动启动 Sparkle 检查后台
        updaterController = SPUStandardUpdaterController(
            startingUpdater: true,
            updaterDelegate: nil,
            userDriverDelegate: nil
        )

        updaterController.updater.publisher(for: \.canCheckForUpdates)
            .assign(to: &$canCheckForUpdates)
    }

    func checkForUpdates() {
        updaterController.checkForUpdates(nil)
    }
}
