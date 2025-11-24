/**
 * Sistema de Gestión de Catequesis - JavaScript
 */

// Cerrar alertas automáticamente después de 5 segundos
document.addEventListener('DOMContentLoaded', function() {
    const alerts = document.querySelectorAll('.alert');
    alerts.forEach(alert => {
        setTimeout(() => {
            alert.style.animation = 'fadeOut 0.5s';
            setTimeout(() => {
                alert.remove();
            }, 500);
        }, 5000);
    });
});

// Animación de fadeOut para alertas
const style = document.createElement('style');
style.textContent = `
    @keyframes fadeOut {
        from {
            opacity: 1;
            transform: translateY(0);
        }
        to {
            opacity: 0;
            transform: translateY(-20px);
        }
    }
`;
document.head.appendChild(style);

// Confirmación antes de salir de formularios con cambios
let formChanged = false;

document.addEventListener('DOMContentLoaded', function() {
    const forms = document.querySelectorAll('form');
    
    forms.forEach(form => {
        const inputs = form.querySelectorAll('input, select, textarea');
        
        inputs.forEach(input => {
            input.addEventListener('change', function() {
                formChanged = true;
            });
        });
        
        form.addEventListener('submit', function() {
            formChanged = false;
        });
    });
});

window.addEventListener('beforeunload', function(e) {
    if (formChanged) {
        e.preventDefault();
        e.returnValue = '¿Estás seguro de que quieres salir? Los cambios no guardados se perderán.';
        return e.returnValue;
    }
});

// Validación de formularios en tiempo real
function validarCedula(input) {
    const valor = input.value;
    const soloNumeros = /^[0-9]*$/;
    
    if (!soloNumeros.test(valor)) {
        input.value = valor.replace(/[^0-9]/g, '');
    }
    
    if (valor.length > 10) {
        input.value = valor.substring(0, 10);
    }
}

function validarTelefono(input) {
    const valor = input.value;
    const soloNumeros = /^[0-9]*$/;
    
    if (!soloNumeros.test(valor)) {
        input.value = valor.replace(/[^0-9]/g, '');
    }
    
    if (valor.length > 10) {
        input.value = valor.substring(0, 10);
    }
}

// Formatear fechas
function formatearFecha(fecha) {
    if (!fecha) return 'N/A';
    
    const date = new Date(fecha);
    const dia = String(date.getDate()).padStart(2, '0');
    const mes = String(date.getMonth() + 1).padStart(2, '0');
    const anio = date.getFullYear();
    
    return `${dia}/${mes}/${anio}`;
}

// Animación suave al hacer scroll
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function(e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    });
});

// Highlight de fila en tablas al pasar el mouse
document.addEventListener('DOMContentLoaded', function() {
    const tableRows = document.querySelectorAll('.data-table tbody tr');
    
    tableRows.forEach(row => {
        row.addEventListener('mouseenter', function() {
            this.style.backgroundColor = '#f0f7ff';
        });
        
        row.addEventListener('mouseleave', function() {
            this.style.backgroundColor = '';
        });
    });
});

// Loader para operaciones asíncronas
function mostrarLoader() {
    const loader = document.createElement('div');
    loader.id = 'loader';
    loader.innerHTML = `
        <div style="
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.5);
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 9999;
        ">
            <div style="
                background: white;
                padding: 2rem;
                border-radius: 10px;
                text-align: center;
            ">
                <i class="fas fa-spinner fa-spin" style="font-size: 3rem; color: #3498db;"></i>
                <p style="margin-top: 1rem;">Cargando...</p>
            </div>
        </div>
    `;
    document.body.appendChild(loader);
}

function ocultarLoader() {
    const loader = document.getElementById('loader');
    if (loader) {
        loader.remove();
    }
}

// Validación de formularios antes de enviar
function validarFormulario(formId) {
    const form = document.getElementById(formId);
    if (!form) return true;
    
    const requiredInputs = form.querySelectorAll('[required]');
    let valido = true;
    
    requiredInputs.forEach(input => {
        if (!input.value.trim()) {
            valido = false;
            input.style.borderColor = '#e74c3c';
            
            // Quitar el borde rojo cuando el usuario empiece a escribir
            input.addEventListener('input', function() {
                this.style.borderColor = '';
            }, { once: true });
        }
    });
    
    if (!valido) {
        alert('Por favor complete todos los campos obligatorios');
    }
    
    return valido;
}

// Exportar tabla a CSV
function exportarTablaCSV(tableId, filename = 'datos.csv') {
    const table = document.getElementById(tableId);
    if (!table) return;
    
    let csv = [];
    const rows = table.querySelectorAll('tr');
    
    rows.forEach(row => {
        const cols = row.querySelectorAll('td, th');
        const csvRow = [];
        
        cols.forEach((col, index) => {
            // Ignorar la columna de acciones (última columna)
            if (index < cols.length - 1) {
                csvRow.push('"' + col.textContent.trim() + '"');
            }
        });
        
        csv.push(csvRow.join(','));
    });
    
    // Crear y descargar el archivo
    const csvContent = csv.join('\n');
    const blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' });
    const link = document.createElement('a');
    
    if (link.download !== undefined) {
        const url = URL.createObjectURL(blob);
        link.setAttribute('href', url);
        link.setAttribute('download', filename);
        link.style.visibility = 'hidden';
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
    }
}

// Imprimir tabla específica
function imprimirTabla(tableId) {
    const table = document.getElementById(tableId);
    if (!table) return;
    
    const printWindow = window.open('', '', 'height=600,width=800');
    printWindow.document.write('<html><head><title>Imprimir</title>');
    printWindow.document.write('<style>');
    printWindow.document.write('body { font-family: Arial, sans-serif; }');
    printWindow.document.write('table { width: 100%; border-collapse: collapse; }');
    printWindow.document.write('th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }');
    printWindow.document.write('th { background-color: #2c3e50; color: white; }');
    printWindow.document.write('.action-buttons { display: none; }');
    printWindow.document.write('</style>');
    printWindow.document.write('</head><body>');
    printWindow.document.write('<h2>Sistema de Catequesis - Reporte</h2>');
    printWindow.document.write(table.outerHTML);
    printWindow.document.write('</body></html>');
    printWindow.document.close();
    printWindow.print();
}

// Contar caracteres en textarea
function contarCaracteres(textareaId, counterId, maxLength) {
    const textarea = document.getElementById(textareaId);
    const counter = document.getElementById(counterId);
    
    if (textarea && counter) {
        textarea.addEventListener('input', function() {
            const remaining = maxLength - this.value.length;
            counter.textContent = `${remaining} caracteres restantes`;
            
            if (remaining < 0) {
                counter.style.color = '#e74c3c';
            } else {
                counter.style.color = '#7f8c8d';
            }
        });
    }
}

console.log('Sistema de Catequesis v1.0 - JavaScript cargado correctamente');
