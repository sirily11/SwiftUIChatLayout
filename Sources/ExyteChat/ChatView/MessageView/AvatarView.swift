//
//  Created by Alex.M on 07.07.2022.
//

import SwiftUI

public struct AvatarView: View {
    let url: URL?
    let avatarSize: CGFloat

    public init(url: URL?, avatarSize: CGFloat) {
        self.url = url
        self.avatarSize = avatarSize
    }

    public var body: some View {
        CachedAsyncImage(url: url, urlCache: .imageCache) { image in
            image
                .resizable()
                .scaledToFill()
        } placeholder: {
            Rectangle().fill(Color.gray)
        }
        .viewSize(avatarSize)
        .clipShape(Circle())
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(
            url: URL(string: "https://placeimg.com/640/480/sepia"),
            avatarSize: 32
        )
    }
}
