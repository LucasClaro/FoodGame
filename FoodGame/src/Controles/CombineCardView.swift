//
//  CombineCardView.swift
//  testStoryboard
//
//  Created by Glauber Moreira on 08/04/20.
//  Copyright © 2020 Glauber Moreira. All rights reserved.
//

import UIKit

class CombineCardView: UIView {
    
    
    var alimento:Alimento?{
          
          didSet {
              if let alimento = alimento {
                  
                  fotoImageView.image = UIImage(named: alimento.foto)
                  fraseLabelp.text = alimento.nome
                  let porcao = String(alimento.porcao)
                  let tipo = alimento.tipo
                  fraseLabels.text = "Este alimento é um(a) " + tipo + " e contêm uma porção de " + porcao + "g"
             }
          }
      }
    
    

    let fotoImageView: UIImageView = .fotoImageView()

    let fraseLabelp:UILabel = .textLabelBold(32, textColor: .white, numberOfLines: 2)
    let fraseLabels:UILabel = .textLabel(24, textColor: .white, textAlignment: .center ,numberOfLines: 3)
    
    
  
  
    let aceitaImageView : UIImageView = .iconCard(named: "aceita")
    
    let rejeitaImageView : UIImageView = .iconCard(named: "rejeita")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.borderWidth = 0.3
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = 8
        clipsToBounds = true
        
        fraseLabels.addShadow()
        fraseLabelp.addShadow()

        addSubview(fotoImageView)
        
        addSubview(aceitaImageView)
        
        aceitaImageView.preencher(top: topAnchor,
                                  leading: leadingAnchor,
                                  trailing: nil,
                                  bottom: nil,
                                  padding: .init(top: 20, left: 20, bottom: 0, right: 0))

        addSubview(rejeitaImageView)
        
        rejeitaImageView.preencher(top: topAnchor,
                                  leading: nil,
                                  trailing: trailingAnchor,
                                  bottom: nil,
                                  padding: .init(top: 20, left: 0, bottom: 0, right: 20))

        fotoImageView.preencherSuperview()

        let stackView = UIStackView (arrangedSubviews: [fraseLabelp,fraseLabels])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 400

        addSubview(stackView)

        stackView.preencher(top: topAnchor,
                            leading: leadingAnchor,
                            trailing: trailingAnchor,
                            bottom: nil,
                            padding: .init(top: 50, left: 16, bottom: 0, right: 16))

    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
