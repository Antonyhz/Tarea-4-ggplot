---
title: "Tarea 4 final"
author: "Kevin Huanca"
date: "23/1/2022"
output: github_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## R Markdown

data1 <-data.frame(datos::millas)
  
View(data1)

View(data1)
class(datos::millas)
```{r}
library(ggplot2)
datos::millas
data1 <-data.frame(datos::millas)
```

 ###############################################
##1.Ejecuta ggplot(data = millas). ¿Qué observas?

#Se plotea un vacio porque aun no se asignaron las funciones ni varibales a usar.

```{r}
ggplot(data = data1)
```


 ##2.¿Cuantas filas hay en millas? ¿Cuantas columnas?

```{r}
nrow(data1)
ncol(data1)
```


  ##3.¿Que describe la variable traccion? Lee la ayuda de ?millas para encontrar la respuesta.


```{r}
?millas
```

## Es una variable categorica que agrupa la variable traccion en delantera, 4x4 y trasera

  ##4.Realiza un grafico de dispersion de autopista versus cilindros.

```{r}
ggplot(data= data1) +
  geom_point(mapping = aes(x = autopista, y = cilindros))
```

##5.¿Que sucede cuando haces un grafico de dispersion de clase versus traccion? ¿Por que no es util este grafico?

```{r}
ggplot(data = data1) +
  geom_point(mapping = aes(x = clase, y = traccion))
```


#El grafico no interpreta los datos correctamennte porque se analiza variables categoricas

  ##Parte 2: Mapeos estaticos
  ##!.¿Que no va bien en este codigo? ¿Por que hay puntos que no son azules?

```{r}
ggplot(data = data1) +
  geom_point(aes(x = cilindrada, y = autopista, color = "blue"))
```


  ##No se muestra el color azul porque color esta como una variable en aes.

```{r}
ggplot(data = data1) +
  geom_point(aes(x = cilindrada, y = autopista), color = "blue")

```

  ##2.¿Que variables en millas son categoricas? ¿Que variables son continuas?
```{r}

?millas
```


  ##3.Asigna una variable continua a color, size, y shape. ¿Como se comportan estas esteticas de manera diferente para variables categoricas y variables continuas?



```{r}
ggplot(data = data1) +
  geom_point(aes(x = cilindrada, y = anio, colour = cilindrada, size = cilindrada))

```

  ##4.¿Que hace la estetica stroke? ¿Con que formas trabaja?

?geom_point

```{r}
ggplot(data1, aes(ciudad, autopista)) + 
   geom_point(shape = 21, colour = "red", fill = "blue", size = 4, stroke =2)
 

?geom_point

```


  ##5.¿Que ocurre si se asigna o mapea una estetica a algo diferente del nombre de una variable, como ser aes(color = cilindrada < 5)?

```{r}

ggplot(data1, aes(x = ciudad, y = autopista, colour = cilindrada < 5)) +
  geom_point()
```


  ##6.3.5 Separar en facetas

  ##1.¿Que ocurre si intentas separar en facetas a una variable continua?

```{r}
ggplot(data1) +
  geom_point(aes(x = ciudad, y = autopista, color = "red")) +
  facet_grid(.~cilindrada)
```

             

?millas

  ##2.¿Que significan las celdas vacias que aparecen en el grafico generado usando facet_grid(traccion ~ cilindros)? ¿Como se relacionan con este grafico?

```{r}
ggplot(data1) +
  geom_point(aes(x = ciudad, y = autopista, color = "red")) +
  facet_grid(traccion ~ cilindros)


ggplot(data =data1) +
  geom_point(mapping = aes(x = traccion, y = cilindros)) + 
  facet_grid(traccion ~ cilindros)
```

   
##Las celdas vacias son espacios donde las conmbinaciones de las varibles traccion y cilindros no son posibles

  ##3.¿Que grafica el siguiente codigo? ¿Que hace . ~?

```{r}
ggplot(data = data1) +
  geom_point(mapping = aes(x = cilindrada, y = autopista)) +
  facet_grid(traccion ~ .)


ggplot(data = data1) +
  geom_point(mapping = aes(x = cilindrada, y = autopista)) +
  facet_grid(.~ cilindros)
```



 ## lo que hace ~ . es es dividir la dispersion de puntos en los valores de traccion y cilindros respectivamente 


  ##4.Mira de nuevo el primer grafico en facetas presentado en esta seccion:
```{r}

ggplot(data = data1) +
  geom_point(mapping = aes(x = cilindrada, y = autopista)) +
  facet_wrap(~ clase, nrow = 2)

ggplot(data = data1) +
  geom_point(mapping = aes(x = cilindrada, y = autopista)) +
  facet_wrap(~ clase, ncol = 2)

```

##La ventaja de trabajar con  facetas es que nos permite presentar mejor las grafica para variables categoricas a diferencia de la funcion color que seria mas adecuada con variables continuas.
## la opcion nrow divide la dispersion en filas representativas de facetas
## la opcion ncol divie la dispersion en filas representativas de facetas

  ##Cuando usas facet_grid(), generalmente deberas poner la variable con un mayor numero de niveles en las columnas. ¿Por que?

 #usar  facet_grid() nos genera mas columnas si esta ubicado de forma horizontal


##Parte 4: Objetos geometricos

##1.¿Que geom usaras para generar un grafico de lineas? ¿Y para un diagrama de caja? ¿Y para un histograma? ¿Y para un grafico de area?
```{r}

 geom_line()
 geom_boxplot()
 geom_histogram()
 geom_area()
```

 
 ##2.Ejecuta este codigo en tu mente y predice como se vera el output. Luego, ejecuta el codigo en R y verifica tus predicciones.
 
```{r}
 
 ggplot(data = data1, mapping = aes(x = cilindrada, y = autopista, color = traccion)) +
   geom_point() +
   geom_smooth(se = FALSE)
```

 
 
 ## Muestra un grafico de dispersion respecto a la cilindrada y autopista, ademas de una linea linea de tendencia coloreado segun la variable traccion 
 
 ##3.¿Que muestra show.legend = FALSE? ¿Que pasa si lo quitas? ¿Por que crees que lo utilizamos antes en el capitulo?
 
```{r}
ggplot(data = data1, mapping = aes(x = cilindrada, y = autopista, color = traccion)) +
   geom_smooth(show.legend = FALSE)
 
 
 ggplot(data = data1, mapping = aes(x = cilindrada, y = autopista, color = traccion)) +
   geom_smooth(show.legend = TRUE)

```
 
 
 
   ##4.¿Que hace el argumento se en geom_smooth()?
 
```{r}
ggplot(data = data1, aes(x = cilindrada, y = autopista, color = traccion)) +
   geom_smooth()
```
 
## añade una capa sombreada de error de desviacion estandar  
 
 ##5.¿Se veran distintos estos graficos? ¿Por que si o por que no?
 
 
```{r}
 ggplot(data = data1, mapping = aes(x = cilindrada, y = autopista)) +
   geom_point() +
   geom_smooth()
 
 ggplot() +
   geom_point(data = data1, mapping = aes(x = cilindrada, y = autopista)) +
   geom_smooth(data = data1, mapping = aes(x = cilindrada, y = autopista))
```


 ## la grafica no se diferencia porque ambas funciones admiten los datos de ggplot
 
   ##6.Recrea el código R necesario para generar los siguientes gráficos:
   
```{r}
ggplot(data = data1, mapping = aes(x = cilindrada, y = autopista)) +
   geom_point() +
   geom_smooth(se = FALSE)
 
 
 ggplot(data = data1, mapping = aes(x = cilindrada, y = autopista)) +
   geom_point() +
   geom_smooth(aes(group = traccion), se = FALSE)
 
 
 ggplot(data = data1, mapping = aes(x = cilindrada, y = autopista)) +
   geom_smooth(se = FALSE) +
   geom_point(aes(color = traccion)) 

 
 ggplot(data = data1, mapping = aes(x = cilindrada, y = autopista)) +
   geom_smooth(aes(linetype = traccion), se = FALSE) +
 geom_point(aes(color = traccion)) 

 
   ggplot(data = data1, mapping = aes(x = cilindrada, y = autopista)) +
   geom_point(size = 4, colour = "white") +
   geom_point(aes(colour = traccion))
 
```
   
   
## Parte 5: Graficos estadisticos 
   
   
 ##1.¿Cual es el geom predeterminado asociado con stat_summary()? ¿Como podras reescribir el grafico anterior para usar esa funcion geom en lugar de la funcion stat?
   
```{r}

   diamantes <-data.frame(datos::diamantes)
   
   ggplot(data = diamantes) +
     geom_pointrange(
       mapping = aes(x = corte, y = profundidad),
       stat = "summary",
       fun.ymin = min,
       fun.ymax = max,
       fun.y = median)
```

   
   ##2.¿Que hace geom_col()? ¿como es diferente a geom_bar()?
   
   
   ## geom_col recoge los datos de una variable continua y una discreta sin transformar los datos 
   ## geom_bar realiza una transformacion interna para encontrar cada valor de "Y" a partir de un "X  
   
   
  
   
     ##3. Que variables calcula stat_smooth()? ¿Qur parametros controlan su comportamiento?
   
     ##.La funcion stat_smooth() calcula las siguientes variables:
   
   ##y: valor predicho
   
   ##ymin: menor valor del intervalo de confianza
   
   ##ymax: mayor valor del intervalo de confianza
   
   ## se: error estandar
   
   
    ##5.En nuestro grafico de barras de proporcion necesitamos establecer group = 1. ¿Por que? En otras palabras, ¿cual es el problema con estos dos graficos?
```{r}
 
   ggplot(data = diamantes) +
     geom_bar(mapping = aes(x = corte, y = ..prop..))
   
   ggplot(data = diamantes) +
     geom_bar(mapping = aes(x = corte, y = ..prop.., group = 1,))
```
  
 
   
   ##Si no se agrega el group = 1 se interpreta todas las columnas del la misma altura 
   
     ##Parte 6: Ajuste de posicion
   
     ##1.¿Cual es el problema con este grafico? ¿Como podras mejorarlo?

```{r}
   ggplot(data = data1, mapping = aes(x = ciudad, y = autopista)) +
     geom_point()
```


  ## Existe una saturacion de la grafica por lo que muchos puntos quedan sin representar 
   
```{r}
   ggplot(data = data1, mapping = aes(x = ciudad, y = autopista)) +
     geom_point(position = "jitter")
              
```

   
     ##2.¿Que parametros de geom_jitter() controlan la cantidad de ruido?
   
   ##width :controla el desplazamiento vertical
   ##height :controla el desplazamiento horizontal
   
   
    ##3.Compara y contrasta geom_jitter() con geom_count()
   
   
```{r}
ggplot(data = data1, mapping = aes(x = ciudad, y = autopista)) +
     geom_jitter()
   
   
   ggplot(data = data1, mapping = aes(x = ciudad, y = autopista)) +
     geom_count()
```
   
   ## Se difererncian en que la funcion "geom_count" realiza la dispersion en funcion al numero de observacion 
   
     
   ##4.¿Cual es el ajuste de posicion predeterminado de geom_boxplot()? Crea una visualizacion del conjunto de datos de millas que lo demuestre.

```{r}
ggplot(data = data1, aes(x = transmision, y = autopista, colour = clase)) +
     geom_boxplot()
```
   
  ##Parte 7: Sistema de coordenadas
   
   
  ##1.Convierte un gráfico de barras apiladas en un gráfico circular usando coord_polar().
   
```{r}
ggplot(data1, aes(x = factor(1), fill = traccion)) +
     geom_bar()

   ggplot(data1, aes(x = factor(1), fill = traccion)) +
     geom_bar(width = 1) +
     coord_polar(theta = "y")
```
   
   
  ##2.¿Qué hace labs()? Lee la documentación.
   
   
   ##labs() es una función para agregar títulos. xlab(), ylab() y ggtitle() realizan la misma función.
   
   
  ##3.¿Cuál es la diferencia entre coord_quickmap() y coord_map()?
   
   
```{r}
   ggplot(data = data1, mapping = aes(x = ciudad, y = autopista)) +
     geom_point() +
     geom_abline() +
     coord_fixed()
```


   ##  La función coord_fixed() agrega una linea de 45° donde se compara el redimiento vs ciudad
   

