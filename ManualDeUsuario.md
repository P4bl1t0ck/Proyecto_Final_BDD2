# 📖 Manual de Usuario - Sistema de Gestión de Catequesis

## Índice
1. [Introducción](#introducción)
2. [Acceso al Sistema](#acceso-al-sistema)
3. [Interfaz Principal](#interfaz-principal)
4. [Navegación](#navegación)
5. [Gestión de Catequizandos](#gestión-de-catequizandos)
6. [Gestión de Catequistas](#gestión-de-catequistas)
7. [Gestión de Parroquias](#gestión-de-parroquias)
8. [Reportes y Estadísticas](#reportes-y-estadísticas)
9. [Mensajes del Sistema](#mensajes-del-sistema)
10. [Consejos de Uso](#consejos-de-uso)

---

## Introducción

El Sistema de Gestión de Catequesis es una aplicación web diseñada para facilitar la administración de catequizandos, catequistas y parroquias. Este manual le guiará paso a paso en el uso de todas las funcionalidades del sistema.

### Requisitos para usar el sistema
- Navegador web moderno (Chrome, Firefox, Safari, Edge)
- Conexión a internet o red local
- Credenciales de acceso (si aplica)

---

## Acceso al Sistema

### Cómo ingresar

1. **Abra su navegador web**
2. **Escriba la dirección del sistema** en la barra de direcciones:
   - Acceso local: `http://localhost:5001`
   - Acceso en red: `http://[dirección-ip]:5001`
3. **Presione Enter**

La página principal se cargará automáticamente.

---

## Interfaz Principal

### Página de Inicio

Al acceder al sistema, verá la pantalla principal con los siguientes elementos:

#### 1. Barra de Navegación Superior
Ubicada en la parte superior de todas las páginas, contiene:

- **🏠 Inicio**: Regresa a la página principal
- **👥 Catequizandos**: Acceso a la gestión de catequizandos
- **👨‍🏫 Catequistas**: Acceso al listado de catequistas
- **⛪ Parroquias**: Acceso al listado de parroquias
- **📊 Reportes**: Acceso a estadísticas y reportes

**Cómo usar la navegación:**
- Haga clic en cualquier opción del menú para acceder a esa sección
- El sistema siempre mantiene visible esta barra para facilitar la navegación

#### 2. Banner de Bienvenida
Sección central con el título y descripción del sistema:
- **Título**: "Bienvenido al Sistema de Catequesis"
- **Subtítulo**: Descripción breve de las funcionalidades

#### 3. Tarjetas de Acceso Rápido
Cuatro tarjetas interactivas que dan acceso a las funciones principales:

##### Tarjeta de Catequizandos
- **Icono**: 👥
- **Título**: "Catequizandos"
- **Descripción**: "Registra y gestiona la información de los catequizandos"
- **Botones**:
  - **"Ver Lista"**: Muestra todos los catequizandos registrados
  - **"Registrar Nuevo"**: Abre el formulario para registrar un nuevo catequizando

##### Tarjeta de Parroquias
- **Icono**: ⛪
- **Título**: "Parroquias"
- **Descripción**: "Administra las parroquias y sus datos de contacto"
- **Botón**:
  - **"Ver Parroquias"**: Muestra el listado de todas las parroquias

##### Tarjeta de Catequistas
- **Icono**: 👨‍🏫
- **Título**: "Catequistas"
- **Descripción**: "Gestiona los catequistas y sus asignaciones"
- **Botón**:
  - **"Ver Catequistas"**: Muestra el listado de todos los catequistas

##### Tarjeta de Reportes
- **Icono**: 📊
- **Título**: "Reportes"
- **Descripción**: "Visualiza estadísticas y genera reportes"
- **Botón**:
  - **"Ver Reportes"**: Accede a la página de estadísticas

#### 4. Sección Informativa
Información sobre las características del sistema:
- Lista de funcionalidades principales
- Beneficios del sistema
- Capacidades de gestión

**Cómo interactuar:**
- Pase el cursor sobre las tarjetas para ver el efecto visual
- Haga clic en cualquier botón para acceder a la función deseada

---

## Navegación

### Cómo moverse por el sistema

#### Uso del Menú Principal
1. **Localice la barra azul** en la parte superior
2. **Haga clic** en cualquier opción
3. El sistema lo llevará a la sección seleccionada

#### Botón "Volver"
- Presente en la mayoría de páginas secundarias
- **Función**: Regresa a la página anterior
- **Ubicación**: Esquina superior derecha junto al título

#### Navegación con el Navegador
- **Botón Atrás del navegador**: Funciona normalmente
- **Botón Adelante del navegador**: Funciona normalmente
- **F5 o Ctrl+R**: Recarga la página actual

---

## Gestión de Catequizandos

### Vista de Lista de Catequizandos

#### Cómo acceder
1. Haga clic en **"Catequizandos"** en el menú superior, o
2. Haga clic en **"Ver Lista"** en la tarjeta de Catequizandos

#### Elementos de la pantalla

##### 1. Título de la Página
- **Ubicación**: Parte superior izquierda
- **Texto**: "Catequizandos Registrados"
- **Icono**: 👥

##### 2. Botón "Registrar Nuevo"
- **Ubicación**: Parte superior derecha
- **Color**: Verde
- **Icono**: ➕
- **Función**: Abre el formulario para registrar un nuevo catequizando
- **Cómo usar**: Haga clic para abrir el formulario de registro

##### 3. Barra de Búsqueda
- **Ubicación**: Debajo del título
- **Placeholder**: "Buscar catequizando por nombre, apellido o cédula..."
- **Icono**: 🔍

**Cómo buscar:**
1. Haga clic en el campo de búsqueda
2. Escriba cualquier texto (nombre, apellido, cédula, etc.)
3. Los resultados se filtran automáticamente mientras escribe
4. No necesita presionar Enter
5. Para ver todos los registros nuevamente, borre el texto

##### 4. Tabla de Catequizandos
Muestra todos los registros con las siguientes columnas:

| Columna | Descripción |
|---------|-------------|
| **ID** | Identificador único del catequizando |
| **Nombre Completo** | Nombre y apellido |
| **Cédula** | Número de identificación |
| **Fecha Nacimiento** | Fecha en formato DD/MM/AAAA |
| **Teléfono** | Número de contacto |
| **Fe de Bautismo** | ID de la fe de bautismo |
| **Acciones** | Botones de editar y eliminar |

##### 5. Botones de Acción por Registro

###### Botón Editar (✏️)
- **Color**: Azul
- **Icono**: Lápiz
- **Función**: Abre el formulario de edición para ese catequizando
- **Cómo usar**: 
  1. Localice el catequizando en la tabla
  2. Haga clic en el botón azul con el ícono de lápiz
  3. Se abrirá el formulario de edición

###### Botón Eliminar (🗑️)
- **Color**: Rojo
- **Icono**: Papelera
- **Función**: Elimina el catequizando (con confirmación)
- **Cómo usar**:
  1. Localice el catequizando en la tabla
  2. Haga clic en el botón rojo con el ícono de papelera
  3. Aparecerá una ventana de confirmación
  4. Lea el mensaje cuidadosamente
  5. Haga clic en **"Eliminar"** para confirmar, o **"Cancelar"** para abortar

##### 6. Contador de Registros
- **Ubicación**: Parte inferior de la tabla
- **Texto**: "Total de catequizandos registrados: X"
- **Función**: Muestra el número total de registros

#### Interacciones de la Tabla

**Al pasar el cursor sobre una fila:**
- La fila cambia de color (efecto hover)
- Facilita identificar el registro que está viendo

**Al hacer clic en una fila:**
- Puede seleccionar el texto para copiarlo
- Los botones de acción se mantienen visibles

---

### Registrar Nuevo Catequizando

#### Cómo acceder
1. Desde la lista de catequizandos, haga clic en **"Registrar Nuevo"**, o
2. Desde la página principal, haga clic en **"Registrar Nuevo"** en la tarjeta

#### Formulario de Registro

##### Sección 1: Información Personal

###### Campo "ID Catequizando" *
- **Tipo**: Texto
- **Obligatorio**: Sí (marcado con *)
- **Máximo**: 15 caracteres
- **Ejemplo**: CZO011
- **Instrucción**: "Máximo 15 caracteres"
- **Validación**: Debe ser único
- **Cómo llenar**: Ingrese un código único que identifique al catequizando

###### Campo "Cédula" *
- **Tipo**: Numérico
- **Obligatorio**: Sí
- **Formato**: 10 dígitos
- **Ejemplo**: 1750123456
- **Instrucción**: "10 dígitos numéricos"
- **Validación**: 
  - Solo acepta números
  - Debe tener exactamente 10 dígitos
  - El sistema elimina automáticamente cualquier letra
- **Cómo llenar**: Ingrese la cédula sin guiones ni espacios

###### Campo "Nombre" *
- **Tipo**: Texto
- **Obligatorio**: Sí
- **Cómo llenar**: Ingrese el nombre o nombres del catequizando

###### Campo "Apellido" *
- **Tipo**: Texto
- **Obligatorio**: Sí
- **Cómo llenar**: Ingrese el apellido o apellidos del catequizando

###### Campo "Fecha de Nacimiento" *
- **Tipo**: Fecha
- **Obligatorio**: Sí
- **Formato**: AAAA-MM-DD (selector visual)
- **Restricción**: No puede ser una fecha futura
- **Cómo llenar**:
  1. Haga clic en el campo
  2. Se abrirá un calendario
  3. Seleccione la fecha de nacimiento
  4. O escriba la fecha manualmente

###### Campo "Teléfono" *
- **Tipo**: Numérico
- **Obligatorio**: Sí
- **Formato**: 10 dígitos
- **Ejemplo**: 0987654321
- **Instrucción**: "10 dígitos numéricos"
- **Validación**:
  - Solo acepta números
  - Debe tener exactamente 10 dígitos
- **Cómo llenar**: Ingrese el número de teléfono sin espacios ni guiones

##### Sección 2: Información de Bautismo

###### Campo "Fe de Bautismo" *
- **Tipo**: Selector desplegable
- **Obligatorio**: Sí
- **Opciones**: Lista de todas las fe de bautismo disponibles
- **Formato de opciones**: ID - Parroquia (Fecha)
- **Cómo seleccionar**:
  1. Haga clic en el campo
  2. Se desplegará una lista
  3. Seleccione la fe de bautismo correspondiente
  4. Si no encuentra la correcta, verifique los registros previos

###### Campo "Observaciones"
- **Tipo**: Área de texto
- **Obligatorio**: No
- **Líneas**: 4
- **Cómo llenar**: Ingrese cualquier información adicional relevante

##### Botones del Formulario

###### Botón "Registrar Catequizando"
- **Color**: Verde
- **Icono**: 💾
- **Ubicación**: Parte inferior del formulario
- **Función**: Guarda el nuevo catequizando
- **Proceso**:
  1. Valida que todos los campos obligatorios estén completos
  2. Verifica el formato de los datos
  3. Si todo es correcto, guarda en la base de datos
  4. Muestra mensaje de éxito
  5. Redirige a la lista de catequizandos

###### Botón "Cancelar"
- **Color**: Gris
- **Icono**: ❌
- **Ubicación**: Junto al botón de registrar
- **Función**: Cancela el registro y regresa a la lista
- **Advertencia**: Los datos no guardados se perderán

##### Sección de Ayuda
- **Ubicación**: Parte inferior del formulario
- **Título**: "Ayuda"
- **Contenido**: Instrucciones adicionales y recordatorios

#### Validaciones en Tiempo Real

El formulario valida los datos mientras los escribe:

**Validación de Cédula:**
- Si escribe letras, el sistema las elimina automáticamente
- Si escribe más de 10 dígitos, no permite continuar
- Al intentar enviar con menos de 10 dígitos, muestra alerta

**Validación de Teléfono:**
- Misma lógica que la cédula
- Solo acepta números
- Exactamente 10 dígitos

**Validación de Campos Vacíos:**
- Los campos obligatorios tienen borde rojo si están vacíos al enviar
- El borde vuelve a la normalidad al empezar a escribir

---

### Editar Catequizando

#### Cómo acceder
1. Vaya a la lista de catequizandos
2. Localice el registro que desea editar
3. Haga clic en el botón azul de editar (✏️)

#### Formulario de Edición

##### Sección 1: Información Básica (No Editable)
Estos campos se muestran pero **no pueden modificarse**:
- ID Catequizando
- Cédula
- Nombre Completo
- Fecha de Nacimiento
- Fe de Bautismo

**Nota**: Estos campos aparecen con fondo gris para indicar que están deshabilitados.

##### Sección 2: Información Editable

###### Campo "Teléfono" *
- **Tipo**: Numérico
- **Obligatorio**: Sí
- **Formato**: 10 dígitos
- **Valor actual**: Muestra el teléfono registrado
- **Cómo editar**:
  1. Haga clic en el campo
  2. Modifique el número
  3. Validación automática como en el registro

###### Campo "Observaciones"
- **Tipo**: Área de texto
- **Obligatorio**: No
- **Valor actual**: Muestra las observaciones actuales
- **Cómo editar**:
  1. Haga clic en el campo
  2. Modifique o agregue texto
  3. Puede borrar todo el contenido si desea

##### Botones

###### Botón "Guardar Cambios"
- **Color**: Azul
- **Icono**: 💾
- **Función**: Guarda las modificaciones
- **Proceso**:
  1. Valida los datos
  2. Actualiza la base de datos
  3. Muestra mensaje de éxito
  4. Regresa a la lista

###### Botón "Cancelar"
- **Color**: Gris
- **Icono**: ❌
- **Función**: Cancela la edición sin guardar
- **Efecto**: Regresa a la lista sin aplicar cambios

##### Cuadro Informativo
- **Ubicación**: Parte inferior
- **Mensaje**: "Solo se puede editar el teléfono y las observaciones. Los datos personales básicos no pueden ser modificados."

---

### Eliminar Catequizando

#### Proceso de Eliminación

##### Paso 1: Iniciar Eliminación
1. En la lista de catequizandos
2. Localice el registro a eliminar
3. Haga clic en el botón rojo de eliminar (🗑️)

##### Paso 2: Ventana de Confirmación
Aparecerá una ventana emergente con:

**Encabezado:**
- Icono de advertencia: ⚠️
- Título: "Confirmar Eliminación"

**Contenido:**
- Pregunta: "¿Está seguro de eliminar al catequizando [NOMBRE]?"
- Advertencia en rojo: "Esta acción no se puede deshacer"

**Botones:**

###### Botón "Cancelar"
- **Color**: Gris
- **Ubicación**: Izquierda
- **Función**: Cierra la ventana sin eliminar
- **Efecto**: El registro permanece intacto

###### Botón "Eliminar"
- **Color**: Rojo
- **Icono**: 🗑️
- **Ubicación**: Derecha
- **Función**: Confirma y ejecuta la eliminación
- **Proceso**:
  1. Elimina el registro de la base de datos
  2. Cierra la ventana
  3. Actualiza la lista
  4. Muestra mensaje de confirmación

##### Paso 3: Confirmación
- Mensaje verde: "Catequizando eliminado exitosamente"
- El registro desaparece de la lista
- El contador de registros se actualiza

#### Cerrar Ventana sin Eliminar
Puede cerrar la ventana de tres formas:
1. Clic en el botón "Cancelar"
2. Clic fuera de la ventana
3. Tecla Escape (Esc)

---

## Gestión de Catequistas

### Lista de Catequistas

#### Cómo acceder
1. Haga clic en **"Catequistas"** en el menú superior, o
2. Haga clic en **"Ver Catequistas"** en la tarjeta de la página principal

#### Elementos de la Pantalla

##### 1. Título
- **Texto**: "Catequistas Registrados"
- **Icono**: 👨‍🏫

##### 2. Barra de Búsqueda
- **Placeholder**: "Buscar catequista por nombre, apellido o rol..."
- **Icono**: 🔍
- **Función**: Filtra la tabla en tiempo real
- **Cómo usar**:
  1. Escriba el texto a buscar
  2. La tabla se filtra automáticamente
  3. Busca en todas las columnas visibles

##### 3. Tabla de Catequistas

**Columnas:**

| Columna | Descripción |
|---------|-------------|
| **ID** | Identificador del catequista |
| **Nombre Completo** | Nombres y apellidos |
| **Teléfono** | Número de contacto |
| **Correo** | Dirección de correo electrónico |
| **Rol** | Rol del catequista (con etiqueta de color) |
| **Parroquia** | ID de la parroquia asignada |

##### 4. Etiquetas de Rol
Los roles se muestran con etiquetas de colores:

- **Coordinador/Coordinadora**: Etiqueta verde
- **Catequista**: Etiqueta azul

##### 5. Contador de Registros
- **Ubicación**: Parte inferior
- **Texto**: "Total de catequistas registrados: X"

#### Funcionalidades de la Tabla

**Búsqueda:**
- Filtra por cualquier campo visible
- Funciona con nombres parciales
- No distingue mayúsculas/minúsculas

**Visualización:**
- Todas las columnas son visibles en escritorio
- En móviles, algunas columnas pueden ajustarse
- Scroll horizontal disponible si es necesario

---

## Gestión de Parroquias

### Lista de Parroquias

#### Cómo acceder
1. Haga clic en **"Parroquias"** en el menú superior, o
2. Haga clic en **"Ver Parroquias"** en la tarjeta de la página principal

#### Elementos de la Pantalla

##### 1. Título
- **Texto**: "Parroquias Registradas"
- **Icono**: ⛪

##### 2. Barra de Búsqueda
- **Placeholder**: "Buscar parroquia por nombre, dirección o vicaría..."
- **Icono**: 🔍
- **Función**: Filtra la tabla en tiempo real
- **Cómo usar**:
  1. Escriba el texto a buscar
  2. La tabla se filtra automáticamente
  3. Busca en nombre, dirección, teléfono y vicaría

##### 3. Tabla de Parroquias

**Columnas:**

| Columna | Descripción |
|---------|-------------|
| **ID** | Identificador de la parroquia |
| **Nombre** | Nombre de la parroquia |
| **Dirección** | Ubicación física |
| **Teléfono** | Número de contacto |
| **Vicaría** | Vicaría a la que pertenece |

##### 4. Contador de Registros
- **Ubicación**: Parte inferior
- **Texto**: "Total de parroquias registradas: X"

#### Funcionalidades de la Tabla

**Búsqueda:**
- Filtra por todos los campos mostrados
- Útil para encontrar parroquias por ubicación o vicaría
- Resultados instantáneos mientras escribe

**Información Mostrada:**
- Todos los datos de contacto visibles
- Fácil de copiar información
- Organización clara por columnas

---

## Reportes y Estadísticas

### Página de Reportes

#### Cómo acceder
1. Haga clic en **"Reportes"** en el menú superior, o
2. Haga clic en **"Ver Reportes"** en la tarjeta de la página principal

#### Elementos de la Pantalla

##### 1. Título
- **Texto**: "Reportes y Estadísticas"
- **Icono**: 📊

##### 2. Tarjetas de Estadísticas

Cuatro tarjetas con información resumida:

###### Tarjeta de Catequizandos
- **Color de icono**: Verde
- **Icono**: 👥
- **Número grande**: Total de catequizandos
- **Texto**: "Catequizandos"

###### Tarjeta de Catequistas
- **Color de icono**: Azul
- **Icono**: 👨‍🏫
- **Número grande**: Total de catequistas
- **Texto**: "Catequistas"

###### Tarjeta de Parroquias
- **Color de icono**: Naranja
- **Icono**: ⛪
- **Número grande**: Total de parroquias
- **Texto**: "Parroquias"

###### Tarjeta de Inscripciones
- **Color de icono**: Morado
- **Icono**: 📋
- **Número grande**: Total de inscripciones
- **Texto**: "Inscripciones"

##### 3. Sección "Estado de Pagos"

**Tabla de Estados:**
Muestra el estado de los pagos de las inscripciones:

| Columna | Descripción |
|---------|-------------|
| **Estado** | Pagado o Pendiente (con etiqueta de color) |
| **Cantidad** | Número de inscripciones en ese estado |
| **Porcentaje** | Barra visual con el porcentaje |

**Etiquetas de Estado:**
- **Pagado**: Etiqueta verde
- **Pendiente**: Etiqueta amarilla

**Barra de Progreso:**
- Muestra visualmente el porcentaje
- Color degradado de azul a verde
- Porcentaje exacto dentro de la barra

##### 4. Sección de Acciones

**Botón "Imprimir Reporte"**
- **Color**: Azul
- **Icono**: 🖨️
- **Función**: Abre el diálogo de impresión del navegador
- **Cómo usar**:
  1. Haga clic en el botón
  2. Se abre la ventana de impresión
  3. Configure las opciones de impresión
  4. Imprima o guarde como PDF

**Botón "Volver al Inicio"**
- **Color**: Gris
- **Icono**: 🏠
- **Función**: Regresa a la página principal

#### Interpretación de los Datos

**Estadísticas Generales:**
- Números grandes y claros
- Fáciles de leer de un vistazo
- Actualizados en tiempo real

**Estado de Pagos:**
- Verde = Pagos completados
- Amarillo = Pagos pendientes
- Porcentaje sobre el total de inscripciones

---

## Mensajes del Sistema

El sistema muestra mensajes para informar sobre el resultado de las acciones.

### Tipos de Mensajes

#### Mensajes de Éxito (Verde)
- **Color de fondo**: Verde claro
- **Icono**: ✅
- **Ubicación**: Parte superior de la página
- **Duración**: 5 segundos (se cierra automáticamente)

**Ejemplos:**
- "Catequizando registrado exitosamente"
- "Catequizando actualizado exitosamente"
- "Catequizando eliminado exitosamente"

#### Mensajes de Error (Rojo)
- **Color de fondo**: Rojo claro
- **Icono**: ❌
- **Ubicación**: Parte superior de la página
- **Duración**: 5 segundos o hasta que se cierre manualmente

**Ejemplos:**
- "Error al registrar catequizando: [detalles]"
- "Error al consultar catequizandos: [detalles]"
- "Error de conexión a la base de datos"

### Cómo Cerrar Mensajes

**Cierre Automático:**
- Los mensajes se cierran solos después de 5 segundos

**Cierre Manual:**
1. Localice el botón "×" en el mensaje
2. Haga clic en él
3. El mensaje desaparece inmediatamente

**Cierre con Animación:**
- Los mensajes se desvanecen suavemente al cerrarse

---

## Consejos de Uso

### Mejores Prácticas

#### Al Registrar Datos

1. **Verifique la información antes de guardar**
   - Revise que la cédula sea correcta
   - Confirme el teléfono
   - Verifique la fecha de nacimiento

2. **Use IDs consistentes**
   - Ejemplo: CZO001, CZO002, CZO003
   - Facilita la búsqueda posterior

3. **Complete las observaciones**
   - Información útil para futura referencia
   - Puede incluir datos adicionales relevantes

#### Al Buscar Información

1. **Use palabras clave específicas**
   - Apellido funciona mejor que nombre
   - Cédula es el identificador más preciso

2. **Aproveche el filtrado en tiempo real**
   - No necesita escribir todo el texto
   - Los resultados aparecen mientras escribe

3. **Borre el texto de búsqueda**
   - Para ver todos los registros nuevamente
   - Simplemente borre el contenido del campo

#### Al Editar Información

1. **Verifique el registro correcto**
   - Confirme el nombre antes de editar
   - Revise que sea el catequizando correcto

2. **Guarde los cambios**
   - No olvide hacer clic en "Guardar Cambios"
   - Los cambios no se aplican hasta guardar

3. **Use el botón Cancelar si se equivoca**
   - Los cambios no guardados se descartan

#### Al Eliminar Registros

1. **Doble verificación**
   - Lea cuidadosamente el nombre en la confirmación
   - Recuerde que la eliminación es permanente

2. **No elimine si tiene dudas**
   - Use Cancelar si no está seguro
   - Consulte con un superior si es necesario

3. **Verifique dependencias**
   - Algunos registros pueden tener relaciones
   - El sistema alertará si hay problemas

### Atajos de Teclado

#### Navegación
- **Tab**: Moverse entre campos del formulario
- **Shift + Tab**: Moverse hacia atrás entre campos
- **Enter**: En búsqueda, no hace nada (búsqueda automática)
- **Esc**: Cerrar ventanas modales

#### Edición
- **Ctrl + A** (Cmd + A en Mac): Seleccionar todo el texto
- **Ctrl + C** (Cmd + C): Copiar texto seleccionado
- **Ctrl + V** (Cmd + V): Pegar texto
- **Ctrl + Z** (Cmd + Z): Deshacer en campos de texto

#### Navegador
- **F5 o Ctrl + R**: Recargar página
- **Ctrl + +**: Hacer zoom (aumentar)
- **Ctrl + -**: Hacer zoom (reducir)
- **Ctrl + 0**: Restablecer zoom

### Solución Rápida de Problemas

#### "No puedo ver la información"
- Refresque la página (F5)
- Verifique su conexión a internet
- Borre la búsqueda si tiene texto

#### "El formulario no se envía"
- Verifique que todos los campos obligatorios (*) estén completos
- Revise que la cédula tenga 10 dígitos
- Confirme que el teléfono tenga 10 dígitos
- Revise que la fecha de nacimiento no sea futura

#### "No puedo editar algunos campos"
- Los campos con fondo gris no son editables por diseño
- Solo teléfono y observaciones pueden editarse

#### "El mensaje de error no desaparece"
- Haga clic en la "×" para cerrarlo manualmente
- Si persiste, refresque la página

#### "La búsqueda no funciona"
- Verifique que esté escribiendo en el campo correcto
- Intente con diferentes términos de búsqueda
- Refresque la página si el problema persiste

### Recomendaciones Generales

1. **Use navegadores actualizados**
   - Chrome, Firefox, Safari o Edge en sus últimas versiones
   - Evite navegadores obsoletos

2. **Mantenga una conexión estable**
   - Preferible conexión por cable
   - WiFi con buena señal

3. **No cierre el navegador durante operaciones**
   - Espere a ver el mensaje de confirmación
   - No interrumpa mientras guarda o elimina

4. **Guarde cambios regularmente**
   - En formularios largos, considere guardar parcialmente
   - No confíe solo en la memoria del navegador

5. **Haga respaldos periódicos**
   - Los reportes pueden imprimirse
   - Use la función de impresión para guardar PDF

---

## Páginas de Error

### Página 404 - No Encontrado
Si accede a una URL que no existe:
- **Título**: "¡Oops! Algo salió mal"
- **Mensaje**: "Página no encontrada"
- **Botones**:
  - "Volver al Inicio": Regresa a la página principal
  - "Volver Atrás": Usa el historial del navegador

### Página 500 - Error del Servidor
Si hay un error en el servidor:
- **Título**: "¡Oops! Algo salió mal"
- **Mensaje**: "Error interno del servidor"
- **Acción recomendada**: 
  1. Espere unos momentos
  2. Refresque la página
  3. Si persiste, contacte al administrador

---

## Consideraciones Finales

### Seguridad
- No comparta sus credenciales de acceso
- Cierre sesión al terminar (si aplica)
- No deje la sesión abierta en computadoras públicas

### Privacidad
- Los datos ingresados son confidenciales
- Manténgase dentro de los límites de su autorización
- Respete la privacidad de los catequizandos

### Soporte Técnico
Si encuentra problemas no cubiertos en este manual:
1. Documente el error (captura de pantalla)
2. Anote los pasos que siguió
3. Contacte al administrador del sistema

---

## Glosario

- **CRUD**: Crear, Leer, Actualizar, Eliminar
- **Catequizando**: Persona que recibe instrucción en catequesis
- **Catequista**: Persona que imparte la catequesis
- **Fe de Bautismo**: Certificado que acredita el bautismo
- **Vicaría**: División administrativa de una diócesis
- **Modal**: Ventana emergente que requiere interacción
- **Hover**: Efecto visual al pasar el cursor sobre un elemento
- **Placeholder**: Texto de ejemplo en un campo de formulario
- **Responsivo**: Diseño que se adapta a diferentes tamaños de pantalla

---

**Fin del Manual de Usuario**

Para más información técnica, consulte el archivo README.md  
Para inicio rápido, consulte el archivo QUICK_START.md

**Versión del Manual**: 1.0  
**Última Actualización**: Noviembre 2024
