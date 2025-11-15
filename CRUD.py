# 1. Importar Bibliotecas necesarias
import pyodbc
import json


class GestorCatequesis:
    """
    Clase para gestionar las operaciones CRUD de la Base de Datos Catequesis
    utilizando Stored Procedures en SQL Server
    """
    
    def __init__(self):
        """
        Inicializa la conexión a la base de datos desde el archivo JSON
        """
        try:
            # Cargar configuración desde archivo JSON
            with open('Conecction.json', 'r', encoding='utf-8') as archivo_config:
                config = json.load(archivo_config)
            
            # Extraer parámetros de conexión
            server = config['server']
            database = config['database']
            username = config['username']
            password = config['password']
            driver = config['driver']
            
            # Construir cadena de conexión
            self.connection_string = f'DRIVER={{{driver}}};SERVER={server};DATABASE={database};UID={username};PWD={password};TrustServerCertificate=yes;'
            
            # Establecer conexión
            print("Estableciendo conexión con la base de datos...")
            self.conexion = pyodbc.connect(self.connection_string)
            print(f"Conexión establecida exitosamente a la base de datos '{database}'\n")
            
        except FileNotFoundError:
            print("\nError: No se encontró el archivo 'Conecction.json'")
            raise
        except KeyError as ke:
            print(f"\nError: Falta el parámetro {ke} en el archivo de configuración")
            raise
        except pyodbc.Error as db_error:
            print(f"\nError al conectar a la base de datos: {db_error}")
            raise
    
    # =============================================
    # MÉTODOS CRUD PARA CATEQUIZANDO
    # =============================================
    
    def consultar_catequizandos(self):
        """Consulta todos los catequizandos"""
        cursor = None
        try:
            cursor = self.conexion.cursor()
            cursor.execute("{CALL sp_ConsultarCatequizandos}")
            
            rows = cursor.fetchall()
            
            if rows:
                print("\n" + "="*120)
                print("CATEQUIZANDOS REGISTRADOS")
                print("="*120)
                print(f"{'ID':<15} {'Nombre':<15} {'Apellido':<15} {'Cédula':<12} {'F.Nac':<12} {'Teléfono':<13} {'F.Bautismo':<15}")
                print("-"*120)
                for row in rows:
                    print(f"{row.ID_Catequizando:<15} {row.Nombre or '':<15} {row.Apellido or '':<15} {row.Cedula or '':<12} {str(row.Fecha_Nacimiento) if row.Fecha_Nacimiento else '':<12} {row.Telefono or '':<13} {row.FeBautismo_ID_Bautismo:<15}")
                print(f"\nTotal de registros: {len(rows)}")
            else:
                print("No se encontraron registros")
            
        except pyodbc.Error as db_error:
            print(f"\nError de base de datos: {db_error}")
        finally:
            if cursor:
                cursor.close()
    
    def insertar_catequizando(self):
        """Inserta un nuevo catequizando"""
        cursor = None
        try:
            cursor = self.conexion.cursor()
            
            print("\n\t*** INSERTAR NUEVO CATEQUIZANDO ***\n")
            id_catequizando = input("ID Catequizando (15 car): ")
            nombre = input("Nombre: ")
            apellido = input("Apellido: ")
            cedula = input("Cédula: ")
            fecha_nac = input("Fecha Nacimiento (YYYY-MM-DD): ")
            telefono = input("Teléfono: ")
            observaciones = input("Observaciones: ")
            id_bautismo = input("ID Fe de Bautismo: ")
            
            cursor.execute(
                "{CALL sp_InsertarCatequizando(?, ?, ?, ?, ?, ?, ?, ?)}",
                (id_catequizando, nombre, apellido, cedula, fecha_nac, telefono, observaciones, id_bautismo)
            )
            
            self.conexion.commit()
            print("\n✓ Catequizando insertado exitosamente")
            
        except pyodbc.Error as db_error:
            print(f"\nError de base de datos: {db_error}")
            self.conexion.rollback()
        finally:
            if cursor:
                cursor.close()
    
    def actualizar_catequizando(self):
        """Actualiza información de un catequizando"""
        cursor = None
        try:
            cursor = self.conexion.cursor()
            
            print("\n\t*** ACTUALIZAR CATEQUIZANDO ***\n")
            id_catequizando = input("ID del Catequizando: ")
            telefono = input("Nuevo Teléfono: ")
            observaciones = input("Nuevas Observaciones: ")
            
            cursor.execute(
                "{CALL sp_ActualizarCatequizando(?, ?, ?)}",
                (id_catequizando, telefono, observaciones)
            )
            
            self.conexion.commit()
            print("\n✓ Catequizando actualizado exitosamente")
            
        except pyodbc.Error as db_error:
            print(f"\nError de base de datos: {db_error}")
            self.conexion.rollback()
        finally:
            if cursor:
                cursor.close()
    
    def eliminar_catequizando(self):
        """Elimina un catequizando"""
        cursor = None
        try:
            cursor = self.conexion.cursor()
            
            print("\n\t*** ELIMINAR CATEQUIZANDO ***\n")
            id_catequizando = input("ID del Catequizando a eliminar: ")
            
            confirmacion = input(f"¿Está seguro de eliminar el catequizando {id_catequizando}? (S/N): ")
            if confirmacion.upper() != 'S':
                print("Operación cancelada")
                return
            
            cursor.execute("{CALL sp_EliminarCatequizando(?)}", (id_catequizando,))
            
            self.conexion.commit()
            print("\n✓ Catequizando eliminado exitosamente")
            
        except pyodbc.Error as db_error:
            print(f"\nError de base de datos: {db_error}")
            self.conexion.rollback()
        finally:
            if cursor:
                cursor.close()
    
    # =============================================
    # MÉTODOS CRUD PARA CATEQUISTA
    # =============================================
    
    def consultar_catequistas(self):
        """Consulta todos los catequistas"""
        cursor = None
        try:
            cursor = self.conexion.cursor()
            cursor.execute("{CALL sp_ConsultarCatequistas}")
            
            rows = cursor.fetchall()
            
            if rows:
                print("\n" + "="*120)
                print("CATEQUISTAS REGISTRADOS")
                print("="*120)
                print(f"{'ID':<15} {'Nombres':<20} {'Apellidos':<20} {'Teléfono':<13} {'Correo':<30} {'Rol':<15}")
                print("-"*120)
                for row in rows:
                    print(f"{row.ID_Catequista:<15} {row.Nombres or '':<20} {row.Apellidos or '':<20} {row.Telefono or '':<13} {row.Correo or '':<30} {row.Rol or '':<15}")
                print(f"\nTotal de registros: {len(rows)}")
            else:
                print("No se encontraron registros")
            
        except pyodbc.Error as db_error:
            print(f"\nError de base de datos: {db_error}")
        finally:
            if cursor:
                cursor.close()
    
    def insertar_catequista(self):
        """Inserta un nuevo catequista"""
        cursor = None
        try:
            cursor = self.conexion.cursor()
            
            print("\n\t*** INSERTAR NUEVO CATEQUISTA ***\n")
            id_catequista = input("ID Catequista (15 car): ")
            nombres = input("Nombres: ")
            apellidos = input("Apellidos: ")
            telefono = input("Teléfono: ")
            correo = input("Correo: ")
            rol = input("Rol: ")
            id_parroquia = input("ID Parroquia: ")
            
            cursor.execute(
                "{CALL sp_InsertarCatequista(?, ?, ?, ?, ?, ?, ?)}",
                (id_catequista, nombres, apellidos, telefono, correo, rol, id_parroquia)
            )
            
            self.conexion.commit()
            print("\n✓ Catequista insertado exitosamente")
            
        except pyodbc.Error as db_error:
            print(f"\nError de base de datos: {db_error}")
            self.conexion.rollback()
        finally:
            if cursor:
                cursor.close()
    
    def actualizar_catequista(self):
        """Actualiza información de un catequista"""
        cursor = None
        try:
            cursor = self.conexion.cursor()
            
            print("\n\t*** ACTUALIZAR CATEQUISTA ***\n")
            id_catequista = input("ID del Catequista: ")
            correo = input("Nuevo Correo: ")
            telefono = input("Nuevo Teléfono: ")
            
            cursor.execute(
                "{CALL sp_ActualizarCatequista(?, ?, ?)}",
                (id_catequista, correo, telefono)
            )
            
            self.conexion.commit()
            print("\n✓ Catequista actualizado exitosamente")
            
        except pyodbc.Error as db_error:
            print(f"\nError de base de datos: {db_error}")
            self.conexion.rollback()
        finally:
            if cursor:
                cursor.close()
    
    def eliminar_catequista(self):
        """Elimina un catequista"""
        cursor = None
        try:
            cursor = self.conexion.cursor()
            
            print("\n\t*** ELIMINAR CATEQUISTA ***\n")
            id_catequista = input("ID del Catequista a eliminar: ")
            
            confirmacion = input(f"¿Está seguro de eliminar el catequista {id_catequista}? (S/N): ")
            if confirmacion.upper() != 'S':
                print("Operación cancelada")
                return
            
            cursor.execute("{CALL sp_EliminarCatequista(?)}", (id_catequista,))
            
            self.conexion.commit()
            print("\n✓ Catequista eliminado exitosamente")
            
        except pyodbc.Error as db_error:
            print(f"\nError de base de datos: {db_error}")
            self.conexion.rollback()
        finally:
            if cursor:
                cursor.close()
    
    # =============================================
    # MÉTODOS CRUD PARA PARROQUIA
    # =============================================
    
    def consultar_parroquias(self):
        """Consulta todas las parroquias"""
        cursor = None
        try:
            cursor = self.conexion.cursor()
            cursor.execute("{CALL sp_ConsultarParroquias}")
            
            rows = cursor.fetchall()
            
            if rows:
                print("\n" + "="*100)
                print("PARROQUIAS REGISTRADAS")
                print("="*100)
                print(f"{'ID':<15} {'Nombre':<20} {'Dirección':<25} {'Teléfono':<13} {'Vicaría':<20}")
                print("-"*100)
                for row in rows:
                    print(f"{row.ID_Parroquin:<15} {row.Nombre or '':<20} {row.Direccion or '':<25} {row.Telefono or '':<13} {row.Vicaria or '':<20}")
                print(f"\nTotal de registros: {len(rows)}")
            else:
                print("No se encontraron registros")
            
        except pyodbc.Error as db_error:
            print(f"\nError de base de datos: {db_error}")
        finally:
            if cursor:
                cursor.close()
    
    def insertar_parroquia(self):
        """Inserta una nueva parroquia"""
        cursor = None
        try:
            cursor = self.conexion.cursor()
            
            print("\n\t*** INSERTAR NUEVA PARROQUIA ***\n")
            id_parroquia = input("ID Parroquia (15 car): ")
            nombre = input("Nombre: ")
            direccion = input("Dirección: ")
            telefono = input("Teléfono: ")
            vicaria = input("Vicaría: ")
            
            cursor.execute(
                "{CALL sp_InsertarParroquia(?, ?, ?, ?, ?)}",
                (id_parroquia, nombre, direccion, telefono, vicaria)
            )
            
            self.conexion.commit()
            print("\n✓ Parroquia insertada exitosamente")
            
        except pyodbc.Error as db_error:
            print(f"\nError de base de datos: {db_error}")
            self.conexion.rollback()
        finally:
            if cursor:
                cursor.close()
    
    def actualizar_parroquia(self):
        """Actualiza información de una parroquia"""
        cursor = None
        try:
            cursor = self.conexion.cursor()
            
            print("\n\t*** ACTUALIZAR PARROQUIA ***\n")
            id_parroquia = input("ID de la Parroquia: ")
            telefono = input("Nuevo Teléfono: ")
            direccion = input("Nueva Dirección: ")
            
            cursor.execute(
                "{CALL sp_ActualizarParroquia(?, ?, ?)}",
                (id_parroquia, telefono, direccion)
            )
            
            self.conexion.commit()
            print("\n✓ Parroquia actualizada exitosamente")
            
        except pyodbc.Error as db_error:
            print(f"\nError de base de datos: {db_error}")
            self.conexion.rollback()
        finally:
            if cursor:
                cursor.close()
    
    def eliminar_parroquia(self):
        """Elimina una parroquia"""
        cursor = None
        try:
            cursor = self.conexion.cursor()
            
            print("\n\t*** ELIMINAR PARROQUIA ***\n")
            id_parroquia = input("ID de la Parroquia a eliminar: ")
            
            confirmacion = input(f"¿Está seguro de eliminar la parroquia {id_parroquia}? (S/N): ")
            if confirmacion.upper() != 'S':
                print("Operación cancelada")
                return
            
            cursor.execute("{CALL sp_EliminarParroquia(?)}", (id_parroquia,))
            
            self.conexion.commit()
            print("\n✓ Parroquia eliminada exitosamente")
            
        except pyodbc.Error as db_error:
            print(f"\nError de base de datos: {db_error}")
            self.conexion.rollback()
        finally:
            if cursor:
                cursor.close()
    
    # =============================================
    # MÉTODOS CRUD PARA NIVEL CATEQUESIS
    # =============================================
    
    def consultar_niveles(self):
        """Consulta todos los niveles de catequesis"""
        cursor = None
        try:
            cursor = self.conexion.cursor()
            cursor.execute("{CALL sp_ConsultarNiveles}")
            
            rows = cursor.fetchall()
            
            if rows:
                print("\n" + "="*70)
                print("NIVELES DE CATEQUESIS")
                print("="*70)
                print(f"{'ID Nivel':<15} {'Nombre del Nivel':<50}")
                print("-"*70)
                for row in rows:
                    print(f"{row.ID_Nivel:<15} {row.NombreNivel or '':<50}")
                print(f"\nTotal de registros: {len(rows)}")
            else:
                print("No se encontraron registros")
            
        except pyodbc.Error as db_error:
            print(f"\nError de base de datos: {db_error}")
        finally:
            if cursor:
                cursor.close()
    
    def insertar_nivel(self):
        """Inserta un nuevo nivel de catequesis"""
        cursor = None
        try:
            cursor = self.conexion.cursor()
            
            print("\n\t*** INSERTAR NUEVO NIVEL ***\n")
            id_nivel = input("ID Nivel (15 car): ")
            nombre_nivel = input("Nombre del Nivel: ")
            
            cursor.execute(
                "{CALL sp_InsertarNivel(?, ?)}",
                (id_nivel, nombre_nivel)
            )
            
            self.conexion.commit()
            print("\n✓ Nivel insertado exitosamente")
            
        except pyodbc.Error as db_error:
            print(f"\nError de base de datos: {db_error}")
            self.conexion.rollback()
        finally:
            if cursor:
                cursor.close()
    
    def actualizar_nivel(self):
        """Actualiza un nivel de catequesis"""
        cursor = None
        try:
            cursor = self.conexion.cursor()
            
            print("\n\t*** ACTUALIZAR NIVEL ***\n")
            id_nivel = input("ID del Nivel: ")
            nombre_nivel = input("Nuevo Nombre del Nivel: ")
            
            cursor.execute(
                "{CALL sp_ActualizarNivel(?, ?)}",
                (id_nivel, nombre_nivel)
            )
            
            self.conexion.commit()
            print("\n✓ Nivel actualizado exitosamente")
            
        except pyodbc.Error as db_error:
            print(f"\nError de base de datos: {db_error}")
            self.conexion.rollback()
        finally:
            if cursor:
                cursor.close()
    
    def eliminar_nivel(self):
        """Elimina un nivel de catequesis"""
        cursor = None
        try:
            cursor = self.conexion.cursor()
            
            print("\n\t*** ELIMINAR NIVEL ***\n")
            id_nivel = input("ID del Nivel a eliminar: ")
            
            confirmacion = input(f"¿Está seguro de eliminar el nivel {id_nivel}? (S/N): ")
            if confirmacion.upper() != 'S':
                print("Operación cancelada")
                return
            
            cursor.execute("{CALL sp_EliminarNivel(?)}", (id_nivel,))
            
            self.conexion.commit()
            print("\n✓ Nivel eliminado exitosamente")
            
        except pyodbc.Error as db_error:
            print(f"\nError de base de datos: {db_error}")
            self.conexion.rollback()
        finally:
            if cursor:
                cursor.close()
    
    # =============================================
    # MÉTODOS CRUD PARA FE DE BAUTISMO
    # =============================================
    
    def consultar_febautismos(self):
        """Consulta todas las fe de bautismo"""
        cursor = None
        try:
            cursor = self.conexion.cursor()
            cursor.execute("{CALL sp_ConsultarFeBautismos}")
            
            rows = cursor.fetchall()
            
            if rows:
                print("\n" + "="*100)
                print("FE DE BAUTISMO REGISTRADAS")
                print("="*100)
                print(f"{'ID Bautismo':<15} {'Fecha Bautismo':<15} {'Parroquia':<25} {'Padrino':<20} {'Madrina':<20}")
                print("-"*100)
                for row in rows:
                    print(f"{row.ID_Bautismo:<15} {str(row.FechaBautismo) if row.FechaBautismo else '':<15} {row.ParroquiaBautizo or '':<25} {row.Padrino or '':<20} {row.Madrina or '':<20}")
                print(f"\nTotal de registros: {len(rows)}")
            else:
                print("No se encontraron registros")
            
        except pyodbc.Error as db_error:
            print(f"\nError de base de datos: {db_error}")
        finally:
            if cursor:
                cursor.close()
    
    def insertar_febautismo(self):
        """Inserta una nueva fe de bautismo"""
        cursor = None
        try:
            cursor = self.conexion.cursor()
            
            print("\n\t*** INSERTAR NUEVA FE DE BAUTISMO ***\n")
            id_bautismo = input("ID Bautismo (15 car): ")
            fecha_bautismo = input("Fecha Bautismo (YYYY-MM-DD): ")
            parroquia_bautizo = input("Parroquia de Bautizo: ")
            padrino = input("Padrino: ")
            madrina = input("Madrina: ")
            
            cursor.execute(
                "{CALL sp_InsertarFeBautismo(?, ?, ?, ?, ?)}",
                (id_bautismo, fecha_bautismo, parroquia_bautizo, padrino, madrina)
            )
            
            self.conexion.commit()
            print("\n✓ Fe de Bautismo insertada exitosamente")
            
        except pyodbc.Error as db_error:
            print(f"\nError de base de datos: {db_error}")
            self.conexion.rollback()
        finally:
            if cursor:
                cursor.close()
    
    def actualizar_febautismo(self):
        """Actualiza una fe de bautismo"""
        cursor = None
        try:
            cursor = self.conexion.cursor()
            
            print("\n\t*** ACTUALIZAR FE DE BAUTISMO ***\n")
            id_bautismo = input("ID del Bautismo: ")
            parroquia_bautizo = input("Nueva Parroquia de Bautizo: ")
            
            cursor.execute(
                "{CALL sp_ActualizarFeBautismo(?, ?)}",
                (id_bautismo, parroquia_bautizo)
            )
            
            self.conexion.commit()
            print("\n✓ Fe de Bautismo actualizada exitosamente")
            
        except pyodbc.Error as db_error:
            print(f"\nError de base de datos: {db_error}")
            self.conexion.rollback()
        finally:
            if cursor:
                cursor.close()
    
    def eliminar_febautismo(self):
        """Elimina una fe de bautismo"""
        cursor = None
        try:
            cursor = self.conexion.cursor()
            
            print("\n\t*** ELIMINAR FE DE BAUTISMO ***\n")
            id_bautismo = input("ID del Bautismo a eliminar: ")
            
            confirmacion = input(f"¿Está seguro de eliminar la fe de bautismo {id_bautismo}? (S/N): ")
            if confirmacion.upper() != 'S':
                print("Operación cancelada")
                return
            
            cursor.execute("{CALL sp_EliminarFeBautismo(?)}", (id_bautismo,))
            
            self.conexion.commit()
            print("\n✓ Fe de Bautismo eliminada exitosamente")
            
        except pyodbc.Error as db_error:
            print(f"\nError de base de datos: {db_error}")
            self.conexion.rollback()
        finally:
            if cursor:
                cursor.close()
    
    # =============================================
    # MENÚ DE SELECCIÓN DE TABLA
    # =============================================
    
    def menu_tablas(self):
        """Menú para seleccionar la tabla a gestionar"""
        while True:
            print("\n" + "="*50)
            print("   SISTEMA DE GESTIÓN - BASE DE DATOS CATEQUESIS")
            print("="*50)
            print("\nSeleccione la tabla a gestionar:\n")
            print("  1. Catequizandos")
            print("  2. Catequistas")
            print("  3. Parroquias")
            print("  4. Niveles de Catequesis")
            print("  5. Fe de Bautismo")
            print("  6. Salir")
            print("\n" + "="*50)
            
            opcion = input("\nSeleccione una opción (1-6): ")
            
            if opcion == '1':
                self.ejecutar_menu_crud('Catequizando')
            elif opcion == '2':
                self.ejecutar_menu_crud('Catequista')
            elif opcion == '3':
                self.ejecutar_menu_crud('Parroquia')
            elif opcion == '4':
                self.ejecutar_menu_crud('Nivel')
            elif opcion == '5':
                self.ejecutar_menu_crud('FeBautismo')
            elif opcion == '6':
                print("\nSaliendo del sistema...\n")
                break
            else:
                print("\n⚠ Opción no válida. Por favor seleccione una opción del 1 al 6.")
            
            if opcion in ['1', '2', '3', '4', '5']:
                input("\nPresione Enter para continuar...")
    
    # =============================================
    # MENÚ CRUD DINÁMICO
    # =============================================
    
    def ejecutar_menu_crud(self, entidad):
        """
        Ejecuta el menú CRUD para una entidad específica
        """
        while True:
            print("\n" + "="*50)
            print(f"   GESTIÓN DE {entidad.upper()}")
            print("="*50)
            print("\nOpciones CRUD:\n")
            print("  1. Crear registro")
            print("  2. Consultar registros")
            print("  3. Actualizar registro")
            print("  4. Eliminar registro")
            print("  5. Volver al menú principal")
            print("\n" + "="*50)
            
            opcion = input("\nSeleccione una opción (1-5): ")
            
            # Mapeo de operaciones según la entidad
            if entidad == 'Catequizando':
                if opcion == '1':
                    self.insertar_catequizando()
                elif opcion == '2':
                    self.consultar_catequizandos()
                elif opcion == '3':
                    self.actualizar_catequizando()
                elif opcion == '4':
                    self.eliminar_catequizando()
                elif opcion == '5':
                    break
                    
            elif entidad == 'Catequista':
                if opcion == '1':
                    self.insertar_catequista()
                elif opcion == '2':
                    self.consultar_catequistas()
                elif opcion == '3':
                    self.actualizar_catequista()
                elif opcion == '4':
                    self.eliminar_catequista()
                elif opcion == '5':
                    break
                    
            elif entidad == 'Parroquia':
                if opcion == '1':
                    self.insertar_parroquia()
                elif opcion == '2':
                    self.consultar_parroquias()
                elif opcion == '3':
                    self.actualizar_parroquia()
                elif opcion == '4':
                    self.eliminar_parroquia()
                elif opcion == '5':
                    break
                    
            elif entidad == 'Nivel':
                if opcion == '1':
                    self.insertar_nivel()
                elif opcion == '2':
                    self.consultar_niveles()
                elif opcion == '3':
                    self.actualizar_nivel()
                elif opcion == '4':
                    self.eliminar_nivel()
                elif opcion == '5':
                    break
                    
            elif entidad == 'FeBautismo':
                if opcion == '1':
                    self.insertar_febautismo()
                elif opcion == '2':
                    self.consultar_febautismos()
                elif opcion == '3':
                    self.actualizar_febautismo()
                elif opcion == '4':
                    self.eliminar_febautismo()
                elif opcion == '5':
                    break
            
            if opcion not in ['1', '2', '3', '4', '5']:
                print("\n⚠ Opción no válida. Por favor seleccione una opción del 1 al 5.")
            
            if opcion in ['1', '2', '3', '4']:
                input("\nPresione Enter para continuar...")
    
    def cerrar_conexion(self):
        """
        Cierra la conexión a la base de datos
        """
        if self.conexion:
            self.conexion.close()
            print("Conexión cerrada exitosamente")


def main():
    """
    Función principal del programa
    """
    gestor = None
    try:
        # Crear instancia del gestor de catequesis
        gestor = GestorCatequesis()
        
        # Ejecutar el menú principal
        gestor.menu_tablas()
        
    except KeyboardInterrupt:
        print("\n\nPrograma interrumpido por el usuario")
    except Exception as e:
        print(f"\nError al ejecutar el programa: {e}")
    finally:
        # Cerrar conexión
        if gestor:
            gestor.cerrar_conexion()


if __name__ == "__main__":
    main()
