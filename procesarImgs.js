const sharp = require('sharp');
const leer = require('recursive-readdir');
const esImagen = require('is-image');
const fs = require('fs');
const path = require('path');
let contador = 0;
const carpeta = '020';
// const rutaInicial = `public/system/artworks/avatars/000/${carpeta}`;
const rutaInicial = 'public/system/body_gestures';
if (!fs.existsSync('./comprimidos')) {
  fs.mkdirSync('./comprimidos', { recursive: true });
  console.log(`carpeta comprimidos creada`);
}

if (!fs.existsSync('./comprimidos/basura')) {
  fs.mkdirSync('./comprimidos/basura', { recursive: true });
  console.log(`carpeta basura creada`);
}

leer(rutaInicial, (err, archivos) => {
  archivos.forEach(async (ruta) => {
    const datosImg = path.parse(ruta);
    const img = fs.readFileSync(ruta);
    const carpetaDestino = datosImg.dir.replace('public/system', 'comprimidos');
    const destino = ruta.replace('public/system', 'comprimidos');
    const procesador = datosImg.ext.slice(1).toLocaleLowerCase();

    if (!fs.existsSync(carpetaDestino)) {
      fs.mkdirSync(carpetaDestino, { recursive: true });
      console.log(`carpeta creada ${carpetaDestino}`);
    }

    try {
      if (datosImg.name.charAt(0) === '.') {
        fs.copyFileSync(ruta, `./comprimidos/basura/${datosImg.name}${datosImg.ext}`);
      } else if ((esImagen(ruta) && procesador === 'jpg') || procesador === 'jpeg') {
        if (datosImg.name !== 'missing') {
          await sharp(img).jpeg({ quality: 80, mozjpeg: true }).toFile(destino);
        } else {
          fs.copyFileSync(ruta, `./comprimidos/basura/missing-${carpeta}-${contador}.jpg`);
          contador++;
        }
        console.log(`Procesado: ${ruta}`);
      } else if (esImagen(ruta) && procesador === 'png') {
        await sharp(img).png({ quality: 80, compressionLevel: 8 }).toFile(destino);
        console.log(`Procesado: ${ruta}`);
      } else if (esImagen(ruta) && procesador === 'gif') {
        await sharp(img).gif().toFile(destino);
        console.log(`Procesado: ${ruta}`);
      } else if (esImagen(ruta) && procesador === 'tiff') {
        await sharp(img).tiff().toFile(destino);
        console.log(`Procesado: ${ruta}`);
      } else {
        fs.copyFileSync(ruta, destino);
        console.log(`Procesado: ${ruta}`);
      }
    } catch (error) {
      console.log('Problema en imagen:', ruta);
      throw new Error();
    }
  });
});