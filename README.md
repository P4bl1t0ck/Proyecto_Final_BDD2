# Sistema de Gestión de Catequesis

Sistema web desarrollado con Flask para la gestión integral de catequizandos, catequistas, parroquias y actividades de catequesis.

## 🚀 Características

- ✅ **Gestión de Catequizandos**: Registro completo, edición y eliminación
- 📊 **Reportes y Estadísticas**: Visualización de datos en tiempo real
- 🎨 **Interfaz Moderna**: Diseño responsive y amigable
- 🔒 **Validación de Datos**: Validación en cliente y servidor
- 📱 **Diseño Responsive**: Funciona en dispositivos móviles y escritorio
- 🔍 **Búsqueda en Tiempo Real**: Filtrado rápido de registros

## 📋 Requisitos Previos

- Python 3.8 o superior
- SQL Server (con la base de datos Catequesis configurada)
- ODBC Driver 17 for SQL Server

## 🛠️ Instalación

### 1. Clonar o descargar el proyecto

```bash
cd BDD_Python_Practices
```

### 2. Crear entorno virtual

```bash
python3 -m venv venv
```

### 3. Activar el entorno virtual

**macOS/Linux:**
```bash
source venv/bin/activate
```

**Windows:**
```bash
venv\Scripts\activate
```

### 4. Instalar dependencias

```bash
pip install -r requirements.txt
```

### 5. Configurar la base de datos

Asegúrese de que el archivo `Conecction.json` contenga las credenciales correctas:

```json
{
    "server": "localhost,1433",
    "database": "Catequesis",
    "username": "Catequesis",
    "password": "Udla1234",
    "driver": "ODBC Driver 17 for SQL Server"
}
```

### 6. Ejecutar los scripts SQL

Ejecute los siguientes scripts en orden:

1. `CreateDatabase.sql` - Crea la base de datos
2. `UserCreation.sql` - Crea el usuario
3. `GrantPermissions.sql` - Otorga permisos
4. `StoredProcedures.sql` - Crea los procedimientos almacenados
5. `InsertTestData.sql` - Inserta datos de prueba

## ▶️ Ejecución

### Modo de desarrollo

```bash
python app.py
```

La aplicación estará disponible en: `http://localhost:5000`

### Modo de producción

Para desplegar en producción, se recomienda usar un servidor WSGI como Gunicorn:

```bash
pip install gunicorn
gunicorn -w 4 -b 0.0.0.0:5000 app:app
```

## 📂 Estructura del Proyecto

```
BDD_Python_Practices/
├── app.py                      # Aplicación Flask principal
├── database.py                 # Configuración de base de datos
├── CRUD.py                     # Script de línea de comandos (legacy)
├── Conecction.json            # Configuración de conexión
├── requirements.txt           # Dependencias Python
├── README.md                  # Este archivo
│
├── templates/                 # Plantillas HTML
│   ├── base.html             # Plantilla base
│   ├── index.html            # Página principal
│   ├── reportes.html         # Página de reportes
│   ├── error.html            # Página de error
│   └── catequizandos/
│       ├── listar.html       # Lista de catequizandos
│       ├── nuevo.html        # Formulario de registro
│       └── editar.html       # Formulario de edición
│
├── static/                    # Archivos estáticos
│   ├── css/
│   │   └── style.css         # Estilos CSS
│   └── js/
│       └── script.js         # JavaScript
│
└── venv/                      # Entorno virtual (no incluir en git)
```

## 🎯 Funcionalidades

### Catequizandos

- **Listar**: Ver todos los catequizandos registrados con búsqueda en tiempo real
- **Registrar**: Formulario completo con validación
- **Editar**: Actualizar teléfono y observaciones
- **Eliminar**: Confirmación antes de eliminar

### Reportes

- Estadísticas generales del sistema
- Estado de pagos de inscripciones
- Gráficos visuales

## 🔧 Tecnologías Utilizadas

### Backend
- **Flask 3.1.2**: Framework web
- **pyodbc 5.3.0**: Conexión a SQL Server
- **Python 3.x**: Lenguaje de programación

### Frontend
- **HTML5**: Estructura
- **CSS3**: Estilos (diseño personalizado)
- **JavaScript**: Interactividad
- **Font Awesome 6.4.0**: Iconos

### Base de Datos
- **SQL Server**: Sistema de gestión de base de datos
- **Stored Procedures**: Lógica de negocio

## 🎨 Características del Diseño

- **Diseño Responsive**: Se adapta a móviles, tablets y desktop
- **Paleta de Colores Moderna**: Basada en tonos azules y grises
- **Animaciones Suaves**: Transiciones y efectos visuales
- **Iconos Intuitivos**: Font Awesome para mejor UX
- **Validación en Tiempo Real**: Feedback inmediato al usuario

## 📝 Notas Importantes

1. **Seguridad**: 
   - Cambiar `app.secret_key` en producción
   - Usar variables de entorno para credenciales
   - Implementar autenticación de usuarios

2. **Base de Datos**:
   - Verificar que SQL Server esté ejecutándose
   - Confirmar que los stored procedures existan
   - Revisar permisos del usuario

3. **Desarrollo**:
   - Debug mode está activado por defecto
   - Desactivar en producción

## 🐛 Solución de Problemas

### Error de conexión a la base de datos

```bash
# Verificar que SQL Server esté corriendo
# macOS/Linux con Docker:
docker ps | grep sqlserver

# Verificar el driver ODBC
odbcinst -q -d
```

### Error al importar pyodbc

```bash
# macOS: Instalar unixODBC
brew install unixodbc

# Linux: 
sudo apt-get install unixodbc unixodbc-dev
```

## 👥 Autor

Mateo Cisneros - Proyecto Integrador - Universidad de las Américas

## 📄 Licencia

Este proyecto fue desarrollado con fines educativos.

## 🔜 Mejoras Futuras

- [ ] Sistema de autenticación de usuarios
- [ ] Gestión completa de catequistas
- [ ] Gestión de parroquias
- [ ] Gestión de grupos y niveles
- [ ] Emisión de certificados en PDF
- [ ] Dashboard con gráficos interactivos
- [ ] Exportación de reportes (PDF, Excel)
- [ ] Sistema de notificaciones por correo
- [ ] API REST completa
- [ ] Backup automático de base de datos

## 📞 Soporte

Para reportar problemas o sugerencias, contactar al desarrollador.

---

**Versión**: 1.0.0  
**Fecha**: Noviembre 2024  
**Estado**: ✅ Funcional
