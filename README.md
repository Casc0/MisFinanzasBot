# 🤖 MisFinanzasBot: Agente de Finanzas Multimodal

**MisFinanzasBot** es un sistema inteligente de gestión de finanzas personales diseñado para procesar gastos e ingresos mediante lenguaje natural y visión artificial. El bot actúa como un asistente financiero que interpreta mensajes de texto, imágenes de tickets y archivos PDF enviados a través de Telegram, automatizando la carga de datos en Google Sheets.

## 🚀 Características Principales

* **Entrada Multimodal:** Capacidad para procesar texto directo, OCR de imágenes (facturas/tickets) y extracción de texto desde PDFs.
* **Inteligencia Artificial:** Orquestado con nodos de **Gemini 1.5 Flash**, utilizando agentes especializados para la extracción y verificación de datos.
* **Localización Argentina:** El sistema entiende modismos locales (como "lucas" o "palos") y opera exclusivamente en Pesos Argentinos (ARS).
* **Gestión de Memoria (Short-Term):** Recupera los últimos 5 mensajes del historial para mantener el contexto de la conversación sin depender de una base de datos externa.
* **Validación de Datos:** Incluye un agente "Verificador" que garantiza que el monto, el concepto y la categoría estén presentes antes de confirmar la carga.

## 🛠️ Arquitectura Técnica

El proyecto utiliza un enfoque de **micro-agentes** dentro de un flujo de trabajo de **n8n** (Self-hosted via Docker).

### Componentes del Workflow:
1. **Trigger de Telegram:** Punto de entrada para los mensajes del usuario.
2. **Nodos de Pre-procesamiento:** Clasificación de archivos (Switch) y normalización de texto crudo.
3. **Agente Extractor:** Transforma el input desestructurado en un objeto JSON.
4. **Agente Verificador:** Valida la integridad de la información y genera respuestas empáticas si faltan datos.
5. **Persistencia en Google Sheets:** Almacenamiento final de transacciones y logs de auditoría.

## 📊 Categorización de Gastos

El bot clasifica automáticamente los movimientos en 8 categorías estratégicas:
* Vivienda y Servicios
* Supermercado y Hogar
* Salud y Bienestar
* Transporte y Movilidad
* Ocio y Entretenimiento
* Compras y Tecnología
* Desarrollo Personal
* Futuro y Finanzas

## 🔧 Configuración del Entorno

### Requisitos
* n8n (instalación via Docker recomendada).
* API Key de **Google AI Studio** (Gemini).
* Credenciales de **Google Service Account** para la integración con Sheets.
* Token de **Telegram Bot API**.

### Instalación
1.  Clonar el repositorio: `git clone https://github.com/Casc0/MisFinanzasBot`
2.  Importar el archivo `My workflow.json` en n8n.
3.  Configurar las credenciales en los nodos correspondientes.
4.  Crear una un documento de Google Sheets una hoja con las columnas `Fecha`, `Concepto`, `Monto`, `Categoria` y `Tipo` para las financias y una hoja de Logs.
