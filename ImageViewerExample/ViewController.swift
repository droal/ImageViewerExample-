//
//  ViewController.swift
//  ImageViewerExample
//
//  Created by Sergio Mesa on 17/04/18.
//  Copyright © 2018 Distribuna. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var pictures = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //activa la propiedad de titulo con texto grande
        navigationController?.navigationBar.prefersLargeTitles = true
        //agrega un titulo a la barra de navegacion
        title = "Storm pictures"
        
        //Obtener refereencia al administrador del sistema de archivos
        let fileManager = FileManager.default
        //BUNDLE es la representación de toda la aplicación empaquetada (codigo, recursos, etc)
        //Bundle es compartido por toda la aplicación
        //En este caso obtenemos la ruta a la carpeta de recursos
        let path = Bundle.main.resourcePath!
        //Obtener listado de elementos dentro de la ruta especificada
        let itemsInPath = try! fileManager.contentsOfDirectory(atPath: path)
        
        //Buscar dentro del listado de elemntos los archivos cuyo nombre comiensa con "nssl"
        for item in itemsInPath{
            if item.hasPrefix("nssl"){
                pictures.append(item)
            }
        }
    }

    
    //Este metodo establece el numero de filas que debe mostrar la tabla
    //Este metodo se activara cuando iOS quiera saber cuantas filas hay en la vista de tabla
    //El primer parametro corresponde a la vista que activo el metodo
    //El segundo parametro indica la sección (las tablas pueden dividirse en secciones, como la aplicación contactos tien una seccion por cada letra del abecedario)
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    //Este metodo especifica como se vera cada fila
    //Este metodo permite reutilizar las vistas de las filas para crear unicamente las que se pueden ver
    //El primer parametro corresponde a la vista que activo el metodo
    //El segundo parametro determina la fila que se va a mostrar (indexPath.row->indica la fila e indexPath.section->indica la seccion)
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //las filas que no se ven se ponen enuna cola de reutilización
        //cuando la tabla se desplaza se desencolan las vistas que se van a usar y se encolan las que ya no se ven
        let cellItem = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        //La propiedad textlabel de la celda es opcional por lo tanto se usa el condicional ?
        cellItem.textLabel?.text = pictures[indexPath.row]
        return cellItem
    }
    
    
    //Metodo que se ejecuta cuando se selecciona un item de la lista
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Obtener el controllador de la vista detalle, haceindo un typecasting
        //Cada ViewController tiene una propidad denominada storyboard, que corresponde al storyboard desde donde se cargo
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController{
            //Si se logra hacer el typecasting,
            //pasar el nombre del item seleccionado
            viewController.imageSelected = pictures[indexPath.row]
            //lanzar la vista detalle empleando la propiedad navigationController del ViewController si la tiene
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

