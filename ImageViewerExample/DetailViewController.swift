//
//  DetailViewController.swift
//  ImageViewerExample
//
//  Created by Sergio Mesa on 17/04/18.
//  Copyright © 2018 Distribuna. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailPictureIV: UIImageView!
    var imageSelected: String?
    

    //Este metodo debe retornar true para que el indicador de home desaparezca luego de unos minutos
    //Por seguridad se valida si existe un controlador de navegacion: navigationController?.hidesBarsOnTap deveria ser true
    override func prefersHomeIndicatorAutoHidden() -> Bool {
        //return true
        return navigationController?.hidesBarsOnTap ?? false
    }
 

    //Ocultar la barra de navegación en este controlador
    //Cuando el usuario hace click en cualquier punto de la pantalla la bara se oculta y aparece cuando el usuario toca de nuevo
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //deshabilitarr l apropiedad de titulos grandes
        navigationItem.largeTitleDisplayMode = .never
        //Agregar titulo a la barra de navegacion
        title = imageSelected
        
        //Verificar que el parametro tenga un valor 
        if let imageToLoad = imageSelected{
            detailPictureIV.image = UIImage(named: imageToLoad)
        }
    }

    
    //Se activa la barra de navegación antes de salir de este controlador
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = false
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
