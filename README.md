# IMPULSA MVP

Prototipo funcional inicial de la plataforma de satisfacción y reputación IMPULSA.

## Qué incluye
- Dashboard de indicadores.
- Alta/edición de comercios.
- Inventario de habladores QR/NFC.
- Generación de lotes de IDs.
- Asignación y reasignación de habladores.
- Generación de QR dinámico por hablador.
- Vista pública simulada desde QR/NFC.
- Captura de 1 a 4 estrellas con nombre, teléfono y comentario.
- Flujo de 5 estrellas con botón de compartir en Google.
- Exportación CSV.
- Esquema inicial para Supabase/PostgreSQL.

## Ejecutar
Abrir `index.html` en un navegador moderno. Para probar el flujo QR, abrir un hablador desde el módulo Habladores y escanear el QR con el teléfono, o copiar la URL dinámica.

> El prototipo usa localStorage. No es todavía una aplicación multiusuario ni debe utilizarse en producción para datos reales.

## Siguiente etapa
1. Crear proyecto Supabase.
2. Aplicar `supabase_schema.sql`.
3. Implementar autenticación y RLS.
4. Migrar el frontend a Next.js/React.
5. Generar PDF de impresión por lotes.
6. Integrar almacenamiento de logos y datos de comercios.
7. Añadir auditoría, consentimiento y política de privacidad.
8. Validar el flujo de reseñas de Google y cumplimiento de sus políticas antes del lanzamiento.
