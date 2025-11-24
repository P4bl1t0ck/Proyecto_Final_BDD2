# 📚 Guía de Uso del Sistema de Catequesis

## 🎯 Descripción General

Sistema web para la gestión integral de catequizandos, desarrollado con Flask y SQL Server.

---

## 🏠 Página Principal

### Funcionalidades Disponibles

1. **Tarjeta de Catequizandos**
   - Ver lista completa
   - Registrar nuevo catequizando
   
2. **Tarjeta de Parroquias**
   - Gestión de parroquias (próximamente)

3. **Tarjeta de Catequistas**
   - Gestión de catequistas (próximamente)

4. **Tarjeta de Reportes**
   - Estadísticas del sistema
   - Estado de pagos

---

## 👥 Gestión de Catequizandos

### Lista de Catequizandos

**Ruta**: `/catequizandos`

#### Características:
- ✅ Tabla con todos los catequizandos registrados
- 🔍 Búsqueda en tiempo real
- ✏️ Botón de edición por registro
- 🗑️ Botón de eliminación con confirmación
- ➕ Botón para registrar nuevo

#### Columnas mostradas:
- ID Catequizando
- Nombre Completo
- Cédula
- Fecha de Nacimiento
- Teléfono
- Fe de Bautismo
- Acciones (Editar/Eliminar)

#### Búsqueda:
Escribe en el campo de búsqueda para filtrar por:
- Nombre
- Apellido
- Cédula
- Cualquier campo visible

---

### Registrar Nuevo Catequizando

**Ruta**: `/catequizandos/nuevo`

#### Campos Obligatorios (*):

**Sección: Información Personal**
- **ID Catequizando**: Código único (15 caracteres)
  - Ejemplo: `CZO011`
  
- **Cédula**: 10 dígitos numéricos
  - Ejemplo: `1750123456`
  - Validación automática
  
- **Nombre**: Nombre del catequizando
  
- **Apellido**: Apellido del catequizando
  
- **Fecha de Nacimiento**: 
  - Formato: YYYY-MM-DD
  - No puede ser fecha futura
  
- **Teléfono**: 10 dígitos numéricos
  - Ejemplo: `0987654321`
  - Validación automática

**Sección: Información de Bautismo**
- **Fe de Bautismo**: Seleccionar de lista desplegable
  - Muestra: ID - Parroquia - Fecha
  
- **Observaciones**: Campo opcional
  - Para notas adicionales

#### Validaciones:
- ✅ Todos los campos obligatorios deben estar completos
- ✅ Cédula debe tener exactamente 10 dígitos
- ✅ Teléfono debe tener exactamente 10 dígitos
- ✅ Fecha de nacimiento no puede ser futura
- ✅ ID Catequizando debe ser único

#### Botones:
- **Registrar Catequizando**: Guarda el registro
- **Cancelar**: Vuelve a la lista sin guardar

---

### Editar Catequizando

**Ruta**: `/catequizandos/editar/<id>`

#### Información No Editable (Gris):
- ID Catequizando
- Cédula
- Nombre Completo
- Fecha de Nacimiento
- Fe de Bautismo

#### Campos Editables:
- **Teléfono**: Puede actualizarse
- **Observaciones**: Puede actualizarse

#### Botones:
- **Guardar Cambios**: Actualiza el registro
- **Cancelar**: Vuelve sin guardar

---

### Eliminar Catequizando

#### Proceso:
1. Click en botón 🗑️ en la lista
2. Aparece ventana de confirmación
3. Muestra nombre del catequizando a eliminar
4. Advertencia: "Esta acción no se puede deshacer"
5. Opciones:
   - **Cancelar**: Cierra sin eliminar
   - **Eliminar**: Confirma y elimina

---

## 📊 Reportes y Estadísticas

**Ruta**: `/reportes`

### Tarjetas de Estadísticas

1. **Catequizandos**
   - Total de catequizandos registrados
   - Icono: 👥 (verde)

2. **Catequistas**
   - Total de catequistas
   - Icono: 👨‍🏫 (azul)

3. **Parroquias**
   - Total de parroquias
   - Icono: ⛪ (naranja)

4. **Inscripciones**
   - Total de inscripciones
   - Icono: 📋 (morado)

### Estado de Pagos

**Tabla con información:**
- Estado (Pagado/Pendiente)
- Cantidad
- Porcentaje visual con barra de progreso

#### Badges de Estado:
- 🟢 **Pagado**: Verde
- 🟡 **Pendiente**: Amarillo

### Acciones Disponibles:
- **Imprimir Reporte**: Versión para impresión
- **Volver al Inicio**: Regresa a la página principal

---

## 💡 Consejos y Mejores Prácticas

### Para Registro de Catequizandos:

1. **IDs Únicos**
   - Use formato consistente: `CZO` + número
   - Ejemplo: CZO001, CZO002, etc.

2. **Datos Completos**
   - Verifique cédula antes de ingresar
   - Use teléfonos actualizados
   - Agregue observaciones relevantes

3. **Fe de Bautismo**
   - Verifique que exista antes de registrar
   - Si no existe, créela primero

### Para Búsqueda:

1. **Búsqueda Rápida**
   - Escriba nombre, apellido o cédula
   - Resultados en tiempo real
   - No necesita presionar Enter

2. **Limpiar Búsqueda**
   - Borre el texto del campo
   - Todos los registros reaparecen

### Para Edición:

1. **Campos Bloqueados**
   - Información básica no se puede cambiar
   - Garantiza integridad de datos

2. **Actualización de Contacto**
   - Solo teléfono y observaciones
   - Útil para mantener datos actualizados

---

## ⚠️ Mensajes del Sistema

### Mensajes de Éxito (Verde):
- ✅ "Catequizando registrado exitosamente"
- ✅ "Catequizando actualizado exitosamente"
- ✅ "Catequizando eliminado exitosamente"

### Mensajes de Error (Rojo):
- ❌ "Error al registrar catequizando: [detalle]"
- ❌ "Error al actualizar catequizando: [detalle]"
- ❌ "Error al eliminar catequizando: [detalle]"

Los mensajes se cierran automáticamente después de 5 segundos o haciendo click en la X.

---

## 🎨 Elementos de la Interfaz

### Colores del Sistema:
- **Primario**: Azul (#3498db) - Botones principales
- **Éxito**: Verde (#27ae60) - Acciones exitosas
- **Peligro**: Rojo (#e74c3c) - Eliminaciones
- **Advertencia**: Amarillo (#f39c12) - Alertas
- **Secundario**: Gris (#95a5a6) - Acciones secundarias

### Iconos:
- 🏠 Inicio
- 👥 Catequizandos
- 📊 Reportes
- ➕ Agregar
- ✏️ Editar
- 🗑️ Eliminar
- 🔍 Buscar
- ✅ Éxito
- ❌ Error

---

## 📱 Diseño Responsive

El sistema se adapta a diferentes tamaños de pantalla:

- **Desktop** (> 768px): Vista completa con menú horizontal
- **Tablet** (768px - 480px): Diseño adaptado
- **Móvil** (< 480px): Menú vertical, tarjetas apiladas

---

## 🔒 Consideraciones de Seguridad

1. **Confirmación de Eliminación**
   - Siempre pide confirmación antes de eliminar
   - Muestra qué registro será eliminado

2. **Validación de Datos**
   - Cliente: Validación en tiempo real
   - Servidor: Validación adicional

3. **Mensajes de Error**
   - Informativos pero no exponen detalles técnicos
   - Ayudan a resolver problemas

---

## 📞 Soporte

Si encuentra algún problema:
1. Revisar esta guía
2. Consultar QUICK_START.md
3. Revisar README.md
4. Contactar al administrador del sistema

---

**Versión del Sistema**: 1.0.0  
**Última Actualización**: Noviembre 2024  
**Desarrollado por**: Mateo Cisneros
