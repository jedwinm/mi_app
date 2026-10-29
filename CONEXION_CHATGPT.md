# Plan de alimentación con ChatGPT

Se agregó un botón en `lib/pantallas/inicio.dart` que abre
`lib/pantallas/alimentacion.dart`. El formulario pide edad, entrenamiento,
preferencias/objetivo/presupuesto, alergias y entre 1 y 7 días.
La tabla empieza el lunes y muestra desayuno, almuerzo, cena y merienda.

## Dónde conectar

1. **Flutter → servidor:** `apiUrl` en `lib/servicios/alimentacion_service.dart`.
   Se configura con `--dart-define=API_URL=...`. Flutter envía el brief por POST.
2. **Servidor → OpenAI:** el `fetch` en `servidor/server.mjs` llama a
   `https://api.openai.com/v1/responses`. Ahí puedes cambiar las instrucciones.
   El esquema JSON permite convertir la respuesta en filas de la tabla.
3. **Clave y modelo:** variables de entorno `OPENAI_API_KEY` y `OPENAI_MODEL`
   del servidor. Nunca pongas la clave en Dart ni en `--dart-define`.

## Ejecutar una prueba local en Windows

Necesitas Node.js 20 o superior, una clave de la API y un modelo de tu cuenta
que admita Responses y Structured Outputs. El servidor no necesita paquetes npm.
En una terminal PowerShell, desde la raíz del proyecto:

```powershell
$env:OPENAI_API_KEY = 'TU_CLAVE_DE_LA_API'
$env:OPENAI_MODEL = 'ID_DEL_MODELO_DE_TU_CUENTA'
node servidor/server.mjs
```

En otra terminal:

```powershell
flutter pub get
flutter run -d chrome --web-port=5000 --dart-define=API_URL=http://localhost:3000/plan
```

El servidor permite el origen `http://localhost:5000`. Para otro origen,
configura `APP_ORIGIN` en la terminal del servidor. Reinicia Flutter cuando
cambies API_URL. Sin esa variable, la pantalla explica que falta configurar
la conexión; no muestra menús simulados.

## Android y publicación

El permiso de Internet ya está agregado en el manifiesto principal.
Para un teléfono o una app publicada, usa un servidor accesible mediante HTTPS
y pasa su URL a API_URL. `localhost` en el teléfono se refiere al propio teléfono.
La prueba HTTP anterior está pensada para Chrome en el mismo computador.

El servidor incluido escucha solamente en el computador local. Antes de
publicarlo agrega autenticación y límites de uso, y configúralo detrás de HTTPS.
No publiques esta demostración como endpoint abierto: las peticiones consumen
tu saldo de la API. Los datos del formulario se envían a OpenAI; evita incluir
datos personales innecesarios. No se guarda el brief en archivos y se envía
`store: false` a la API; esto no equivale a garantizar retención cero del proveedor.

## Documentación oficial

- Responses y formato de respuesta:
  https://developers.openai.com/api/docs/guides/structured-outputs
- Autenticación y custodia de claves:
  https://platform.openai.com/docs/api-reference/authentication

La generación real requiere tus credenciales y acceso al modelo configurado.
El menú es orientación general para adultos, no una dieta médica personalizada.
