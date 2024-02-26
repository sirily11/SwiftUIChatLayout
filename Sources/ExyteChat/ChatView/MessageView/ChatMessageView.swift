//
//  ChatMessageView.swift
//
//
//  Created by Alisa Mylnikova on 20.03.2023.
//

import SwiftUI

struct ChatMessageView<MessageContent: View>: View {
    typealias MessageBuilderClosure = ChatView<MessageContent, EmptyView>.MessageBuilderClosure

    @ObservedObject var viewModel: ChatViewModel

    var messageBuilder: MessageBuilderClosure?

    let row: MessageRow
    let chatType: ChatType
    let avatarSize: CGFloat
    let tapAvatarClosure: ChatView.TapAvatarClosure?
    let messageUseMarkdown: Bool
    let isDisplayingMessageMenu: Bool

    public var body: some View {
        let view = MessageView(
            viewModel: viewModel,
            message: row.message,
            positionInGroup: row.positionInGroup,
            chatType: chatType,
            avatarSize: avatarSize,
            tapAvatarClosure: tapAvatarClosure,
            messageUseMarkdown: messageUseMarkdown,
            isDisplayingMessageMenu: isDisplayingMessageMenu)
        Group {
            if let messageBuilder = messageBuilder {
                messageBuilder(row.message, row.positionInGroup, view) { attachment in
                    self.viewModel.presentAttachmentFullScreen(attachment)
                }
            } else {
                view
            }
        }
        .id(row.message.id)
    }
}
