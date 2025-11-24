# Guía Rápida de Inicio - Sistema de Catequesis

## 🚀 Inicio Rápido

### 1. Activar el entorno virtual

```bash
cd /Users/mateocisneros/VisualCode/ProyectoIntegrador/BDD_Python_Practices
source .venv/bin/activate  # En macOS/Linux
# o
.venv\Scripts\activate  # En Windows
```

### 2. Ejecutar la aplicación

```bash
python app.py
```

### 3. Abrir en el navegador

Abrir: **http://localhost:5001**

## 📱 Acceso desde otros dispositivos en la red

Desde otros dispositivos en la misma red Wi-Fi:
- **http://192.168.86.196:5001**

## 🎯 Funcionalidades Disponibles

### Página Principal (/)
- Vista general del sistema
- Acceso rápido a todas las funciones
- Estadísticas resumidas

### Catequizandos (/catequizandos)
- **Listar**: Ver todos los catequizandos
- **Buscar**: Filtrado en tiempo real
- **Registrar**: /catequizandos/nuevo
- **Editar**: Click en el botón de edición
- **Eliminar**: Click en el botón de eliminar (con confirmación)

### Reportes (/reportes)
- Estadísticas generales
- Estado de pagos
- Visualización de datos

## 🔧 Comandos Útiles

### Detener el servidor
Presionar `CTRL + C` en la terminal

### Ver logs en tiempo real
Los logs aparecen automáticamente en la terminal

### Reinstalar dependencias
```bash
pip install -r requirements.txt
```

### Actualizar la base de datos
Ejecutar los scripts SQL en este orden:
1. CreateDatabase.sql
2. UserCreation.sql
3. GrantPermissions.sql
4. StoredProcedures.sql
5. InsertTestData.sql

## 📊 Datos de Prueba

El sistema incluye datos de prueba precargados:
- 5 Parroquias
- 8 Fe de Bautismo
- 8 Catequistas
- 10 Catequizandos
- 5 Grupos de Catequesis

## 🐛 Solución Rápida de Problemas

### Error: "Address already in use"
```bash
# Matar proceso en puerto 5001
lsof -ti:5001 | xargs kill -9
```

### Error: "No module named 'flask'"
```bash
# Asegurarse de estar en el entorno virtual
source .venv/bin/activate
pip install -r requirements.txt
```

### Error de conexión a la base de datos
1. Verificar que SQL Server esté corriendo
2. Revisar credenciales en `Conecction.json`
3. Verificar que la base de datos "Catequesis" exista

### Página no carga correctamente
1. Limpiar caché del navegador (CTRL + SHIFT + R)
2. Verificar que los archivos CSS/JS se carguen
3. Revisar la consola del navegador para errores

## 📝 Notas Importantes

- **Puerto**: La aplicación corre en el puerto **5001** (cambiar en app.py si es necesario)
- **Debug Mode**: Activado por defecto (desactivar en producción)
- **Secret Key**: Cambiar antes de deployment en producción
- **CORS**: No configurado (agregar si se necesita acceso desde otros dominios)

## 🔒 Seguridad

**Antes de desplegar en producción:**
1. Cambiar `app.secret_key` a un valor aleatorio seguro
2. Desactivar `debug=True`
3. Usar variables de entorno para credenciales
4. Implementar autenticación de usuarios
5. Configurar HTTPS
6. Usar un servidor WSGI (Gunicorn, uWSGI)

## 📞 Contacto

Para soporte técnico o preguntas, contactar al desarrollador del proyecto.

---

**Última actualización**: Noviembre 2024
**Versión**: 1.0.0
