{-
Lamada con parámetro una Función
Curso: MCA 1 2026-1 FCiencias
Tema: Paso de una función como parámetro
 Thread
Referencia:
https://hackage.haskell.org/package/base-4.19.0.0/docs/Numeric.html#v:showIntAtBase
http://learnyouahaskell.com/higher-order-functions
http://learnyouahaskell.com/input-and-output
https://wiki.haskell.org/Functional_programming

Software: Haskell (GHC)
Autora: Regina Soto Álvarez
Fecha: 5 Nov 25
-}
import Numeric
import Data.Char     (intToDigit, toUpper) -- Para mayusculas en hexadecimal
import System.IO     (hFlush, stdout) -- Para que el prompt se muestre correctamente
import Text.Printf   (printf)

-- | Esta es la función que recibe la función como parámetro.
-- | Es decir, toma: Un Int y devuelve un String.
intToStr :: (Int -> String) -> Int -> String
intToStr conver v = conver v  -- Se aplica la función 'conver' al valor 'v'

-- | Convierte un entero a su representación binaria.
decToBin :: Int -> String
decToBin n = showIntAtBase 2 intToDigit n ""

-- | Convierte un entero a su representación hexadecimal.
decToHex :: Int -> String
decToHex n = showIntAtBase 16 intToDigit n ""

-- | Método principal.
main :: IO ()
main = do
    putStr "Numero decimal que se desea convertir: \n> "
    hFlush stdout -- Asegura que el prompt aparezca antes de leer

    -- Lee la línea (String) y la convierte (read) a Int
    linea <- getLine
    let num = read linea :: Int

    -- Pasa la función decToBin como parámetro
    let b = intToStr decToBin num
    printf "El numero decimal: %d tiene como representacion binaria: %s\n" num b

    -- Pasa la función decToHex como parámetro
    let h = intToStr decToHex num
    printf "El numero decimal: %d tiene como representacion hexadecimal: %s\n" num (map toUpper h)
{-
DEFINICIÓN: ¿Qué es la Programación Funcional?
Es un paradigma de programación (una forma de construir programas) que
trata la computación como la evaluación de funciones matemáticas.
A diferencia de la programación imperativa (que se basa en cambiar el "estado" o datos mutables), 
la programación funcional se enfoca en:
1.  Funciones "puras": Siempre devuelven el mismo resultado para los mismos argumentos, sin efectos secundarios.
2.  Inmutabilidad: Los datos no se modifican después de crearse.
3.  Funciones como "Ciudadanos de Primera Clase": Este es el concepto clave de esta tarea.
"Ciudadanos de Primera Clase" significa que una función no es diferente a un número o un texto: 
puede ser asignada a una variable, ser devuelta por otra función y, lo más importante, 
ser pasada como parámetro o argumento a otra función.

Justificación:
En la clase de matemáticas (MCA 1), vimos que los espacios C^k son espacios de funciones, y que operadores como 
la Derivada (d/dx) o la Integral (∫) son, en sí mismos, funciones que reciben OTRAS funciones como parámetros 
y devuelven una nueva función.
Este programa crea una analogía de ese concepto en programación.

¿Por qué es tan natural en Haskell y no en otros lenguajes?
En lenguajes imperativos u orientado a objetos (c, java, ...) pasar una función es un proceso complejo
A menudo requiere "punteros a función" o "envolturas" de objetos, lo cual es una sintaxis especial y no 
se siente natural. Es una característica añadida o avanzada sobre un paradigma centrado en objetos o estados.
En lenguajes como Haskell (funcional puro) EL lenguj¿aje esta construido desde cero sobre la idea de que las
funciones son datos, igual que un número o un texto.
Por eso en nuestro código simplemente pasamos de decToBin como argumentos a iNToString con la misma naturlaidad con la que pasamos
el número num. No se requiere d ealguna sintaxis especial. Pasar 'decToBin' como parámetro es tan natural como pasar un número.

-}