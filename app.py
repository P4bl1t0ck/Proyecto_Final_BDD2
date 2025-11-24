"""
Sistema de Gestión de Catequesis - Aplicación Web Flask
"""
from flask import Flask, render_template, request, redirect, url_for, flash, jsonify
from database import db_config
import pyodbc
from datetime import datetime

app = Flask(__name__)
app.secret_key = 'catequesis_secret_key_2024'  # Cambiar en producción


# =============================================
# RUTAS PRINCIPALES
# =============================================

@app.route('/')
def index():
    """Página principal"""
    return render_template('index.html')


# =============================================
# RUTAS PARA CATEQUIZANDOS
# =============================================

@app.route('/catequizandos')
def listar_catequizandos():
    """Lista todos los catequizandos"""
    try:
        with db_config.get_cursor() as cursor:
            cursor.execute("{CALL sp_ConsultarCatequizandos}")
            catequizandos = cursor.fetchall()
            
            # Convertir a lista de diccionarios
            catequizandos_list = []
            for row in catequizandos:
                catequizandos_list.append({
                    'ID_Catequizando': row.ID_Catequizando,
                    'Nombre': row.Nombre,
                    'Apellido': row.Apellido,
                    'Cedula': row.Cedula,
                    'Fecha_Nacimiento': row.Fecha_Nacimiento,
                    'Telefono': row.Telefono,
                    'Fecha_Registro': row.Fecha_Registro,
                    'Observaciones': row.Observaciones,
                    'FeBautismo_ID_Bautismo': row.FeBautismo_ID_Bautismo
                })
            
        return render_template('catequizandos/listar.html', catequizandos=catequizandos_list)
    
    except Exception as e:
        flash(f'Error al consultar catequizandos: {str(e)}', 'error')
        return redirect(url_for('index'))


@app.route('/catequizandos/nuevo', methods=['GET', 'POST'])
def nuevo_catequizando():
    """Formulario para crear nuevo catequizando"""
    if request.method == 'POST':
        try:
            # Obtener datos del formulario
            id_catequizando = request.form['id_catequizando']
            nombre = request.form['nombre']
            apellido = request.form['apellido']
            cedula = request.form['cedula']
            fecha_nac = request.form['fecha_nacimiento']
            telefono = request.form['telefono']
            observaciones = request.form['observaciones']
            id_bautismo = request.form['id_bautismo']
            
            # Insertar en la base de datos
            with db_config.get_cursor() as cursor:
                cursor.execute(
                    "{CALL sp_InsertarCatequizando(?, ?, ?, ?, ?, ?, ?, ?)}",
                    (id_catequizando, nombre, apellido, cedula, fecha_nac, 
                     telefono, observaciones, id_bautismo)
                )
            
            flash('Catequizando registrado exitosamente', 'success')
            return redirect(url_for('listar_catequizandos'))
        
        except Exception as e:
            flash(f'Error al registrar catequizando: {str(e)}', 'error')
    
    # Obtener lista de Fe de Bautismo para el formulario
    try:
        with db_config.get_cursor() as cursor:
            cursor.execute("{CALL sp_ConsultarFeBautismos}")
            febautismos = cursor.fetchall()
            
            febautismos_list = []
            for row in febautismos:
                febautismos_list.append({
                    'ID_Bautismo': row.ID_Bautismo,
                    'ParroquiaBautizo': row.ParroquiaBautizo,
                    'FechaBautismo': row.FechaBautismo
                })
    except:
        febautismos_list = []
    
    return render_template('catequizandos/nuevo.html', febautismos=febautismos_list)


@app.route('/catequizandos/editar/<id>', methods=['GET', 'POST'])
def editar_catequizando(id):
    """Editar un catequizando existente"""
    if request.method == 'POST':
        try:
            telefono = request.form['telefono']
            observaciones = request.form['observaciones']
            
            with db_config.get_cursor() as cursor:
                cursor.execute(
                    "{CALL sp_ActualizarCatequizando(?, ?, ?)}",
                    (id, telefono, observaciones)
                )
            
            flash('Catequizando actualizado exitosamente', 'success')
            return redirect(url_for('listar_catequizandos'))
        
        except Exception as e:
            flash(f'Error al actualizar catequizando: {str(e)}', 'error')
    
    # Obtener datos del catequizando
    try:
        with db_config.get_cursor() as cursor:
            cursor.execute(
                "SELECT * FROM Catequizando WHERE ID_Catequizando = ?",
                (id,)
            )
            row = cursor.fetchone()
            
            if row:
                catequizando = {
                    'ID_Catequizando': row.ID_Catequizando,
                    'Nombre': row.Nombre,
                    'Apellido': row.Apellido,
                    'Cedula': row.Cedula,
                    'Fecha_Nacimiento': row.Fecha_Nacimiento,
                    'Telefono': row.Telefono,
                    'Fecha_Registro': row.Fecha_Registro,
                    'Observaciones': row.Observaciones,
                    'FeBautismo_ID_Bautismo': row.FeBautismo_ID_Bautismo
                }
            else:
                flash('Catequizando no encontrado', 'error')
                return redirect(url_for('listar_catequizandos'))
        
        return render_template('catequizandos/editar.html', catequizando=catequizando)
    
    except Exception as e:
        flash(f'Error al cargar catequizando: {str(e)}', 'error')
        return redirect(url_for('listar_catequizandos'))


@app.route('/catequizandos/eliminar/<id>', methods=['POST'])
def eliminar_catequizando(id):
    """Eliminar un catequizando"""
    try:
        with db_config.get_cursor() as cursor:
            cursor.execute("{CALL sp_EliminarCatequizando(?)}", (id,))
        
        flash('Catequizando eliminado exitosamente', 'success')
    
    except Exception as e:
        flash(f'Error al eliminar catequizando: {str(e)}', 'error')
    
    return redirect(url_for('listar_catequizandos'))


# =============================================
# RUTAS PARA REPORTES Y ESTADÍSTICAS
# =============================================

@app.route('/parroquias')
def listar_parroquias():
    """Lista todas las parroquias"""
    try:
        with db_config.get_cursor() as cursor:
            cursor.execute("{CALL sp_ConsultarParroquias}")
            parroquias = cursor.fetchall()
            
            # Convertir a lista de diccionarios
            parroquias_list = []
            for row in parroquias:
                parroquias_list.append({
                    'ID_Parroquin': row.ID_Parroquin,
                    'Nombre': row.Nombre,
                    'Direccion': row.Direccion,
                    'Telefono': row.Telefono,
                    'Vicaria': row.Vicaria
                })
        
        return render_template('parroquias/listar.html', parroquias=parroquias_list)
    
    except Exception as e:
        flash(f'Error al consultar parroquias: {str(e)}', 'error')
        return redirect(url_for('index'))


@app.route('/catequistas')
def listar_catequistas():
    """Lista todos los catequistas"""
    try:
        with db_config.get_cursor() as cursor:
            cursor.execute("{CALL sp_ConsultarCatequistas}")
            catequistas = cursor.fetchall()
            
            # Convertir a lista de diccionarios
            catequistas_list = []
            for row in catequistas:
                catequistas_list.append({
                    'ID_Catequista': row.ID_Catequista,
                    'Nombres': row.Nombres,
                    'Apellidos': row.Apellidos,
                    'Telefono': row.Telefono,
                    'Correo': row.Correo,
                    'Rol': row.Rol,
                    'Parroquia_ID_Parroquin': row.Parroquía_ID_Parroquin
                })
        
        return render_template('catequistas/listar.html', catequistas=catequistas_list)
    
    except Exception as e:
        flash(f'Error al consultar catequistas: {str(e)}', 'error')
        return redirect(url_for('index'))


@app.route('/reportes')
def reportes():
    """Página de reportes y estadísticas"""
    try:
        with db_config.get_cursor() as cursor:
            # Total de catequizandos
            cursor.execute("SELECT COUNT(*) as total FROM Catequizando")
            total_catequizandos = cursor.fetchone().total
            
            # Total de catequistas
            cursor.execute("SELECT COUNT(*) as total FROM Catequista")
            total_catequistas = cursor.fetchone().total
            
            # Total de parroquias
            cursor.execute("SELECT COUNT(*) as total FROM Parroquía")
            total_parroquias = cursor.fetchone().total
            
            # Total de inscripciones
            cursor.execute("SELECT COUNT(*) as total FROM Incripción")
            total_inscripciones = cursor.fetchone().total
            
            # Inscripciones por estado de pago
            cursor.execute("""
                SELECT EstadoDePago, COUNT(*) as cantidad
                FROM Incripción
                GROUP BY EstadoDePago
            """)
            estados_pago = cursor.fetchall()
            
            stats = {
                'total_catequizandos': total_catequizandos,
                'total_catequistas': total_catequistas,
                'total_parroquias': total_parroquias,
                'total_inscripciones': total_inscripciones,
                'estados_pago': [{'estado': row.EstadoDePago, 'cantidad': row.cantidad} 
                               for row in estados_pago]
            }
        
        return render_template('reportes.html', stats=stats)
    
    except Exception as e:
        flash(f'Error al generar reportes: {str(e)}', 'error')
        return redirect(url_for('index'))


# =============================================
# API ENDPOINTS (opcional para JavaScript)
# =============================================

@app.route('/api/catequizandos')
def api_catequizandos():
    """API para obtener catequizandos en formato JSON"""
    try:
        with db_config.get_cursor() as cursor:
            cursor.execute("{CALL sp_ConsultarCatequizandos}")
            catequizandos = cursor.fetchall()
            
            catequizandos_list = []
            for row in catequizandos:
                catequizandos_list.append({
                    'id': row.ID_Catequizando,
                    'nombre': row.Nombre,
                    'apellido': row.Apellido,
                    'cedula': row.Cedula,
                    'telefono': row.Telefono
                })
        
        return jsonify(catequizandos_list)
    
    except Exception as e:
        return jsonify({'error': str(e)}), 500


# =============================================
# MANEJO DE ERRORES
# =============================================

@app.errorhandler(404)
def page_not_found(e):
    """Página de error 404"""
    return render_template('error.html', error='Página no encontrada'), 404


@app.errorhandler(500)
def internal_error(e):
    """Página de error 500"""
    return render_template('error.html', error='Error interno del servidor'), 500


# =============================================
# PUNTO DE ENTRADA
# =============================================

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5001)
