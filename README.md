# Ninja Creami · Mi negocio

App Android personal para llevar el control de un pequeño negocio de helados Ninja Creami: recetas, costos, ventas, gastos, inventario y respaldos. Funciona **sin cuentas, sin internet y sin sincronización**: todos los datos se guardan en el propio teléfono.

## Funciones

- **Resumen**: ventas del día y del mes, ganancia estimada, gastos y alertas de inventario.
- **Ventas**: registro rápido por producto y cantidad, precio sugerido y edición del historial.
- **Recetas**: costo por porción calculado a partir de ingredientes, empaques y rendimiento; precio sugerido con margen.
- **Gastos**: gastos operativos con categorías y notas.
- **Inventario**: existencias, mínimos y alertas de reposición.
- **Respaldo**: exportación e importación en JSON, exportación CSV para Excel/Google Sheets y borrado total de datos.
- **Extras**: modo oscuro automático, navegación inferior, botón atrás de Android y área segura para pantallas con gestos.

## Descargar e instalar

1. Descarga el APK desde la sección [Releases](../../releases).
2. En el teléfono, abre el archivo y permite la instalación desde esa fuente si Android lo solicita.
3. La app se instala como **Ninja Creami** y no necesita permisos especiales.

> El APK está firmado con una clave de publicación propia. Conserva esa clave si quieres seguir actualizando la app sobre la misma instalación.

## Desarrollo

Requisitos:

- Node.js 20 o superior
- JDK 21
- Android SDK con las plataformas y build-tools que usa Capacitor 8

```bash
npm install
npx cap sync android

# APK de depuración
npm run apk

# APK de publicación (requiere android/keystore/keystore.properties)
npm run apk:release
```

La interfaz vive en `www/index.html`; es HTML, CSS y JavaScript sin frameworks. La capa Android se genera con [Capacitor](https://capacitorjs.com/) y usa:

- `@capacitor/preferences` para persistir los datos (con espejo en `localStorage`).
- `@capacitor/filesystem` y `@capacitor/share` para exportar JSON/CSV con el menú nativo de Android.

### Firma del APK

Por seguridad, el keystore y sus contraseñas **no están en el repositorio**. Para compilar una versión release crea `android/keystore/keystore.properties` con este formato:

```properties
storeFile=keystore/ninja-release.jks
storePassword=TU_CONTRASEÑA
keyAlias=ninja
keyPassword=TU_CONTRASEÑA
```

y coloca el archivo `.jks` en `android/keystore/`. Sin ese archivo, la compilación release se genera sin firmar.

## Datos y privacidad

La app no recopila, envía ni comparte información. Todo queda en el almacenamiento local de la aplicación, dentro del teléfono. Los respaldos se generan únicamente cuando tú los exportas.

## Aviso

Proyecto personal sin afiliación con SharkNinja. «Ninja» y «Creami» son marcas de sus respectivos propietarios.
