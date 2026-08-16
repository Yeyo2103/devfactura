import os
import stat
from pathlib import Path


def ensure_media_directory_permissions(file_path):
    """
    Asegura que el directorio donde se guardará un archivo tenga los permisos correctos.
    
    Args:
        file_path: Ruta completa del archivo (incluyendo nombre)
    
    Returns:
        True si se aplicaron los permisos correctamente, False en caso contrario
    """
    try:
        # Obtener el directorio del archivo
        directory = os.path.dirname(file_path)
        
        # Crear el directorio si no existe
        Path(directory).mkdir(parents=True, exist_ok=True)
        
        # Establecer permisos 755 (rwxr-xr-x)
        os.chmod(directory, stat.S_IRWXU | stat.S_IRGRP | stat.S_IXGRP | stat.S_IROTH | stat.S_IXOTH)
        
        # También asegurar permisos en directorios padres
        parent = Path(directory).parent
        while str(parent) != '/':
            if parent.exists():
                try:
                    os.chmod(str(parent), stat.S_IRWXU | stat.S_IRGRP | stat.S_IXGRP | stat.S_IROTH | stat.S_IXOTH)
                except:
                    pass
            parent = parent.parent
            if 'media' in str(parent) and str(parent).endswith('media'):
                break
        
        return True
    except Exception as e:
        print(f"Error al asegurar permisos: {e}")
        return False


def ensure_media_root_permissions(media_root):
    """
    Asegura que todo el directorio media tenga los permisos correctos.
    
    Args:
        media_root: Ruta del directorio media raíz
    """
    try:
        for root, dirs, files in os.walk(media_root):
            # Permisos para directorios: 755
            os.chmod(root, stat.S_IRWXU | stat.S_IRGRP | stat.S_IXGRP | stat.S_IROTH | stat.S_IXOTH)
            
            # Permisos para archivos: 644
            for file in files:
                file_path = os.path.join(root, file)
                os.chmod(file_path, stat.S_IRUSR | stat.S_IWUSR | stat.S_IRGRP | stat.S_IROTH)
        
        return True
    except Exception as e:
        print(f"Error al asegurar permisos del media root: {e}")
        return False
