import SwiftUI
import UIKit

// MARK: - SwiftUI Launch Screen

struct LaunchFlowView: View {
    @State private var opacity: Double = 0

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 20) {
                Image("AppIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 22))

                Text("CARDMAP JP")
                    .font(.title2.bold())
                    .foregroundColor(Color(hex: "#CC0000"))
                    .tracking(4)
            }
        }
        .opacity(opacity)
        .onAppear {
            withAnimation(.easeIn(duration: 0.6)) {
                opacity = 1.0
            }
        }
    }
}

// MARK: - Color hex extension

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let r, g, b, a: UInt64
        switch hex.count {
        case 6:
            (r, g, b, a) = (int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF, 255)
        case 8:
            (r, g, b, a) = (int >> 24 & 0xFF, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (r, g, b, a) = (0, 0, 0, 255)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

// MARK: - UIKit helper to overlay splash on Capacitor window

class LaunchFlowOverlay {
    static func show(on window: UIWindow) {
        let hostingController = UIHostingController(rootView: LaunchFlowView())
        hostingController.view.frame = window.bounds
        hostingController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        hostingController.view.tag = 9999
        window.addSubview(hostingController.view)

        // Fade out after 1.8 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
            UIView.animate(withDuration: 0.4, animations: {
                hostingController.view.alpha = 0
            }, completion: { _ in
                hostingController.view.removeFromSuperview()
            })
        }
    }
}
