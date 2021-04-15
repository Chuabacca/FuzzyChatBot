//
//  ViewController.swift
//  FuzzyChatBot
//
//  Created by Jon on 4/15/21.
//  Copyright © 2021 Jonathan Chua. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    var messages = [[String : String]]() {
        didSet {
            tableView.reloadData()
            guard messages.count > 1 else { return }
            let lastIndex = messages.count - 1
            tableView.scrollToRow(at: IndexPath(row: lastIndex, section: 0), at: .bottom, animated: true)
        }
    }

    let tableView = UITableView()
    let receivedCell = "ReceivedCell"
    let sentCell = "SentCell"

    override func loadView() {
        super.loadView()
        setupView()
        displayMessages()
    }

    func setupView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.separatorStyle = .none
        view.addSubview(tableView)

        tableView.register(ReceivedCell.self, forCellReuseIdentifier: receivedCell)
        tableView.register(SentCell.self, forCellReuseIdentifier: sentCell)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }

    // Add messages on a timer and reload the table to simulate a chat API
    func displayMessages() {
        var interval: Double = 0
        for message in chatData {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + interval) { [weak self] in
                self?.messages.append(message)
            }
            interval += 2
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if messages[indexPath.row]["type"] == "received" {
            let cell = tableView.dequeueReusableCell(withIdentifier: receivedCell, for: indexPath) as! ReceivedCell
            cell.chatLabel.text = messages[indexPath.row]["message"]
            if indexPath.row == 0 {
                cell.avatar.image = UIImage(named: "suzy")
            } else if messages[indexPath.row - 1]["type"] == "sent" {
                cell.avatar.image = UIImage(named: "suzy")
            } else {
                cell.avatar.image = nil
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: sentCell, for: indexPath) as! SentCell
            cell.chatLabel.text = messages[indexPath.row]["message"]
            return cell
        }
    }

}

class ReceivedCell: UITableViewCell {
    let avatar = UIImageView()
    let chatBubble = UIView()
    let chatLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {
        avatar.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(avatar)

        chatBubble.translatesAutoresizingMaskIntoConstraints = false
        chatBubble.backgroundColor = .systemGray6
        chatBubble.layer.cornerRadius = 25
        chatBubble.clipsToBounds = true
        chatBubble.contentHuggingPriority(for: .horizontal)
        contentView.addSubview(chatBubble)

        chatLabel.translatesAutoresizingMaskIntoConstraints = false
        chatLabel.textColor = .darkGray
        chatLabel.font = .systemFont(ofSize: 16)
        chatLabel.numberOfLines = 0
        chatBubble.addSubview(chatLabel)


        NSLayoutConstraint.activate([
            avatar.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            avatar.heightAnchor.constraint(equalToConstant: 50),
            avatar.widthAnchor.constraint(equalToConstant: 50),
            avatar.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 20),

            chatBubble.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 5),
            chatBubble.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            chatBubble.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 10),
            chatBubble.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -30),
            chatBubble.heightAnchor.constraint(greaterThanOrEqualToConstant: 50),
            chatBubble.widthAnchor.constraint(greaterThanOrEqualToConstant: 0),

            chatLabel.topAnchor.constraint(equalTo: chatBubble.topAnchor, constant: 10),
            chatLabel.bottomAnchor.constraint(equalTo: chatBubble.bottomAnchor, constant: -10),
            chatLabel.leadingAnchor.constraint(equalTo: chatBubble.leadingAnchor, constant: 15),
            chatLabel.trailingAnchor.constraint(equalTo: chatBubble.trailingAnchor, constant: -15)
        ])
    }
}


class SentCell: UITableViewCell {
    let chatBubble = UIView()
    let chatLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {
        chatBubble.translatesAutoresizingMaskIntoConstraints = false
        chatBubble.backgroundColor = .systemGray
        chatBubble.layer.cornerRadius = 25
        chatBubble.clipsToBounds = true
        chatBubble.contentHuggingPriority(for: .horizontal)
        contentView.addSubview(chatBubble)

        chatLabel.translatesAutoresizingMaskIntoConstraints = false
        chatLabel.textColor = .white
        chatLabel.font = .systemFont(ofSize: 16)
        chatLabel.numberOfLines = 0
        chatBubble.addSubview(chatLabel)


        NSLayoutConstraint.activate([
            chatBubble.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 5),
            chatBubble.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            chatBubble.leadingAnchor.constraint(greaterThanOrEqualTo: contentView.leadingAnchor, constant: 20),
            chatBubble.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            chatBubble.heightAnchor.constraint(greaterThanOrEqualToConstant: 50),
            chatBubble.widthAnchor.constraint(greaterThanOrEqualToConstant: 0),

            chatLabel.topAnchor.constraint(equalTo: chatBubble.topAnchor, constant: 10),
            chatLabel.bottomAnchor.constraint(equalTo: chatBubble.bottomAnchor, constant: -10),
            chatLabel.leadingAnchor.constraint(equalTo: chatBubble.leadingAnchor, constant: 15),
            chatLabel.trailingAnchor.constraint(equalTo: chatBubble.trailingAnchor, constant: -15)
        ])
    }
}
