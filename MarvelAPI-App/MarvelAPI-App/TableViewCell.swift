//
//  TableViewCell.swift
//  MarvelAPI-App
//
//  Created by 木元健太郎 on 2022/04/10.
//


import UIKit


final class TableViewCell:UITableViewCell{
    
    @IBOutlet private weak var characterImage: UIImageView!
    @IBOutlet private weak var characterTitle: UILabel!
    @IBOutlet private weak var urlText: UILabel!
    
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        characterImage.image = nil
        characterTitle.text = nil
        urlText.text = nil
    }
    
    func configure(mavelModel: Results) {
        characterTitle.text = mavelModel.name
        urlText.text = mavelModel.resourceURI
        
        guard let image = mavelModel.thumbnail?.path,
            let cellImage = URL(string: image + ".jpg")    else {
            return
        }
        characterImage.setImageByAlamofire(with: cellImage)
      }
    
}
