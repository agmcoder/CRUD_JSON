//
// Created by agmcoder on 26/9/22.
//

import SwiftUI

// MARK: Custom View which will return the properties of the view
struct ResponsiveView<Content: View>: View {
    var content: (Properties)->Content
    var body: some View {
        GeometryReader{ proxy in
            let size = proxy.size
            let isLandScape = (size.width > size.height)
            let isiPad = UIDevice.current.userInterfaceIdiom == .pad

            content(Properties(isLandscape: isLandScape, isiPad: isiPad, size: size))
                .frame(width: size.width, height: size.height, alignment: .center)
            
        }

    }

}
struct Properties{
    var isLandscape: Bool
    var isiPad: Bool
    var size: CGSize
}
