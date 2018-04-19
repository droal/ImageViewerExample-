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
        
        //Agregar boton al navigation bar
        //El parametro .action es un elemnto del sistema, muestra una flecha saliendo de un recuadro, para indicar al usuario que con este elemento se ejecuta un acción (en lugar de usar un elemento del sistem puede usarse uno personalizado)
        //El segundo parametro indica que el metodo que se va a ejecutar al seleccionar este elemnto pertenece al ViewController actual
        //El tercer parametro indica el metodo que se debe ejecutar cuando se selecciona el boton
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareIsSelected))
        
        //Verificar que el parametro tenga un valor 
        if let imageToLoad = imageSelected{
            detailPictureIV.image = UIImage(named: imageToLoad)
        }
    }

    
    //Este metodo se ejecuta cuando se selecciona el boton compartir
    //Pide al sistema operativo que encuentre los metodos mas apropiados de compartir la imagen
    @objc func shareIsSelected(){
        //Se implementa el metodo del sistema operativo para compartir contenido con otras apliaciones y servicios
        //el primer parametro "activityItems" corresponde al conjunto de elemntos que se desea compartir
        //El segundo parametro "applicationActivities" corresponde al conjunto de servicios de lapropia aplicación que se desea esten en el listado, en este caso no tenemos ninguno por lo que se deja vacio
        let viewController = UIActivityViewController(activityItems: [detailPictureIV.image!], applicationActivities: [])
        //Este metodo solo tine efecto en iPads, en los iPhone lapantalla emergente se toma toda la pantalla pero en los iPad se indica con el siguiente metodo que el mensaje emergente quede anclado al boton de compartir
        viewController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(viewController, animated: true)
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
