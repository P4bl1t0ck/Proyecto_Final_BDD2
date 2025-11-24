"""
Módulo de configuración de base de datos para Flask
"""
import pyodbc
import json
from contextlib import contextmanager


class DatabaseConfig:
    """Clase para gestionar la configuración de la base de datos"""
    
    def __init__(self, config_file='Conecction.json'):
        """Inicializa la configuración desde archivo JSON"""
        try:
            with open(config_file, 'r', encoding='utf-8') as f:
                config = json.load(f)
            
            self.connection_string = config.get('connection_string')
            if not self.connection_string:
                # Construir connection string si no existe
                driver = config['driver']
                server = config['server']
                database = config['database']
                username = config['username']
                password = config['password']
                
                self.connection_string = (
                    f"DRIVER={{{driver}}};"
                    f"SERVER={server};"
                    f"DATABASE={database};"
                    f"UID={username};"
                    f"PWD={password};"
                    f"TrustServerCertificate=yes;"
                )
        except FileNotFoundError:
            raise Exception("Archivo de configuración no encontrado")
        except KeyError as e:
            raise Exception(f"Falta el parámetro {e} en la configuración")
    
    def get_connection(self):
        """Obtiene una nueva conexión a la base de datos"""
        try:
            return pyodbc.connect(self.connection_string)
        except pyodbc.Error as e:
            raise Exception(f"Error al conectar a la base de datos: {e}")
    
    @contextmanager
    def get_cursor(self):
        """Context manager para obtener un cursor y cerrar la conexión automáticamente"""
        conn = self.get_connection()
        cursor = conn.cursor()
        try:
            yield cursor
            conn.commit()
        except Exception as e:
            conn.rollback()
            raise e
        finally:
            cursor.close()
            conn.close()


# Instancia global de configuración
db_config = DatabaseConfig()
