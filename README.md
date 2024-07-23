
# Movie App

Movie App es una aplicación móvil para explorar y descubrir películas. Proporciona detalles sobre películas populares, mejor calificadas y próximas a estrenarse, utilizando la API de [The Movie Database (TMDb)](https://www.themoviedb.org/).

## Características

- Navegar por las películas más populares, mejor calificadas y próximas a estrenarse.
- Ver detalles de películas individuales, incluidos el reparto, la sinopsis y las reseñas.
- Buscar películas por nombre.
- Guardar películas en tu lista de favoritos.

## Instalación

Sigue estos pasos para configurar y ejecutar el proyecto localmente.

### Prerrequisitos

- [Flutter](https://flutter.dev/) instalado en tu máquina.
- Una cuenta en [The Movie Database (TMDb)](https://www.themoviedb.org/) para obtener una API Key.

### Paso a paso

1. Clona el repositorio:
   ```bash
   git clone https://github.com/marselo-4/Movie-App.git
   cd Movie-App

2. Instala las dependencias:
   ```bash
   flutter pub get
   ```

3. Configura tu API Key:
   - Abre el archivo `movie_app/common/constants.dart`.
   - Añade tu API Key en la variable `API_KEY` con la siguiente sintaxis:
     ```dart
     final API_KEY = "api_goes_here";
     ```

4. Ejecuta la aplicación:
   ```bash
   flutter run
   ```

## Uso

Una vez que la aplicación esté funcionando, puedes navegar por las diferentes secciones de películas, buscar títulos específicos y agregar películas a tu lista de favoritos.

## Estructura del Proyecto

- `lib/`: Contiene el código fuente de la aplicación.
  - `common/`: Incluye archivos comunes utilizados en toda la aplicación.
    - `constants.dart`: Archivo donde se debe configurar la API Key.
  - `models/`: Modelos de datos utilizados en la aplicación.
  - `screens/`: Diferentes pantallas de la aplicación.
  - `widgets/`: Componentes reutilizables.

## Contribuciones

¡Las contribuciones son bienvenidas! Si deseas contribuir, por favor sigue estos pasos:

1. Haz un fork del proyecto.
2. Crea una nueva rama (`git checkout -b feature/nueva-feature`).
3. Realiza los cambios necesarios y haz commits (`git commit -m 'Añadir nueva feature'`).
4. Haz push a la rama (`git push origin feature/nueva-feature`).
5. Abre un Pull Request.

## Licencia

Este proyecto está bajo la Licencia MIT. Consulta el archivo [LICENSE](LICENSE) para obtener más detalles.

## Contacto

Carlos Martínez - [Portfolio](https://carlosmg.es)

---

¡Gracias por usar Movie App! Esperamos que disfrutes descubriendo nuevas películas.
