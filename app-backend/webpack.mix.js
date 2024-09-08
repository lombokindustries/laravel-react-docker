let mix = require('laravel-mix');

mix.js('node_modules/sweetalert2/dist/sweetalert2.min.js', 'public/js/app.js')
   .postCss('node_modules/sweetalert2/dist/sweetalert2.min.css', 'public/css/app.css');