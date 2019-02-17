# iOS-Test-Solution

El siguiente documento detallará la funcionalidad, diseño, patrón y configuración del aplicativo desarrollado para la prueba técnica enviada por Deviget.

## Elaborado por
Ing. Christian Anthony Quicaño Zavaleta

## Repositorio GitHub
https://github.com/anthonyqz/deviget

## Patrón utilizado ( MVP)
Para el desarrollo del aplicativo se utilizó el patrón MVP (Model, View, Presenter), para la comunicación se utilizó el patrón de Protocolos y para los manager se utilizó el patrón Singletón.

## Creación framework (encapsula lógica de negocio)
Para encapsular la lógica de negocio y así poder reutilizarlo en distintos proyectos se creo un framework llamado devigetModule, el cual contiene los presenters, repositories y modelos del patrón MVP

## Targets del proyecto
El proyecto presenta los siguientes targets

    - deviget .- Aplicativo principal, contiene todas las UI
    - devigetModule .- Framework que contiene la lógica de negocio
    - devigetModuleTests .- Framework que contiene los UnitTest del target devigetModule, obteniendo un coverage de 84.7% 
    - devigetMock .- Aplicativo que reemplaza el datamanager para poder enviar data mock y así utilizarlo para los UITest.
    - devigetMockUITests .- Target que contiene los UITest, obteniendo un coverage de 48.8%. Solo se creo un test para la demostración que con el patrón MVP es sencillo de implementarlo.

## Buenas prácticas
Se utilizó buenas prácticas como:

    - Niveles de acceso
    - Encapsulación
    - Limpieza de memoria
    - Reutilización
    
## Cumplimiento de la prueba
El aplicativo cumple con las siguientes funcionalidades

    1. Pull to Refresh
    La vista de la lista de posts se puede deslizar hacia abajo y realiza un reload a toda la data.
    2. Pagination support
    Cuando llega al final de la tabla realiza una llamada con los siguientes posts
    3. Saving pictures in the picture gallery
    Al momento de dar un tap a la imagen en el detalle puede guardar la imagen en la galería (se utilizo el objeto nativo Activity Controller)
    4. App state-preservation/restoration
    Se implemento para la vista del detalle
    5. Indicator of unread/read post (updated status, after post it’s selected)
    Cada celda tiene un indicador de leído
    6. Dismiss Post Button (remove the cell from list. Animations required)
    Cada celda tiene un botón para poder ocultarla, la animación que se utilizo es la nativa de la tabla
    7. Dismiss All Button (remove all posts. Animations required)
    Existe un botón principal al lato superior derecho que permite remover toda la lista
    8. Support split layout (left side: all posts / right side: detail post)
    El aplicativo esta preparado para cualquier dispositivo en cualquier posición y cuenta con el splitView para cuando el dispositivo es un ipad

## Clausula de identidad intelectual
Este documento y aplicativo contiene material, ideas y conceptos para el uso exclusivo de Deviget con el propósito de realizar una prueba técnica, este contenido no debe ser reproducido total o parcialmente por ningún medio, ni distribuido a nadie ajeno al proceso de evaluación.
