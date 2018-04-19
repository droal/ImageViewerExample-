Aplicación que muestra un listado de archivos imagen ubicados en el paquete de la aplicación, seleccionando un elemento de la lista se muestra la imagen correspondiente en una pantalla independiente


- Acceso a archivos locales
- Implementación de UITableViewController para mostrar listado
- La vista de cada item de la tabla es tiene un estilo básico con una sola etiqueta de texto
- Implementa interfaz de usuario del tipo lista->detalle
- Implementa ImageView y configura Content Mode a Aspect Fit en el Attributes inspector, para que la imagen conserve su relación de aspecto original
- Permite ocultar la barra de navegación para la vista de detalle
- Implementa el indicador de divulgación en cada fila del listado, para indicar al usuario que cada uno de los ítems del listado contiene más información
- El indicador de divulgación se activa en el Attribute inspector del Table View Cell y configurando la propiedad "Accesory" a Detail Disclosure
- Implementa la visualización de titulo en la barra de navegación y la propiedad de títulos grandes para algunas vistas
- En el iPhoneX, por las características de la pantalla, cuando la imagen tiene el "Content Mode" configurado a "Scale To Fill", la imagen en realidad no ocupa toda la pantalla debido al espacio seguro (el cual evita que las imágenes se recorten para ajustarlas a los bordes redondeados) que deja un borde inferior blanco (home indicator)
- Para eliminar este borde inferior blanco (home indicator) se selecciona la vista y en el "Size Inspector" se desmarca la opción "Safe Area Layout Guide"

- Implementa botón para compartir imagen 
- Implementa UIActivityViewController para determinar la mejor forma de compartir una imagen, esto se asemeja a un Inten implicito en android
- Edita el archivo Info.plist para agregar “Privacy - Photo Library Additions Usage Description” que permite pedir permiso al usuario para almacenar una imagen el dispositivo
