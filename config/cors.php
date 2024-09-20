<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Cross-Origin Resource Sharing (CORS) Configuration
    |--------------------------------------------------------------------------
    |
    | This configuration determines which cross-origin operations are allowed
    | to execute in web browsers. You are free to adjust these settings
    | as needed to match your application's requirements.
    |
    | To learn more: https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS
    |
    */

    'paths' => ['api/*', 'sanctum/csrf-cookie'],  // Incluye 'sanctum/csrf-cookie' para usar Sanctum

    'allowed_methods' => ['*'],  // Permite todos los métodos (GET, POST, PUT, DELETE)

    'allowed_origins' => ['http://localhost:4200'],  // Añade aquí la URL de tu app Angular

    'allowed_origins_patterns' => [],

    'allowed_headers' => ['*'],  // Permite todos los headers

    'exposed_headers' => [],

    'max_age' => 0,

    'supports_credentials' => true,  // Para permitir el uso de cookies
];
