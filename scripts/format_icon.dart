import 'dart:io';
import 'package:image/image.dart' as img;

void main() {
  final inputBytes = File('/Users/mapps/Downloads/warehouse.png').readAsBytesSync();
  final image = img.decodeImage(inputBytes);
  if (image == null) return;
  
  // Create a solid white background of the same size
  final background = img.Image(width: image.width, height: image.height);
  // Fill with white
  for (final p in background) {
    p.setRgba(255, 255, 255, 255);
  }
  
  // Composite the original image over the background
  final result = img.compositeImage(background, image);
  
  // Resize to all required sizes natively and losslessly
  final sizes = [64, 192, 512];
  for (final size in sizes) {
     final resized = img.copyResize(result, width: size, height: size, interpolation: img.Interpolation.cubic);
     final png = img.encodePng(resized);
     if (size == 64) {
       File('web/favicon.png').writeAsBytesSync(png);
     }
     if (size == 192) {
       File('web/icons/Icon-192.png').writeAsBytesSync(png);
       File('web/icons/Icon-maskable-192.png').writeAsBytesSync(png);
     }
     if (size == 512) {
       File('web/icons/Icon-512.png').writeAsBytesSync(png);
       File('web/icons/Icon-maskable-512.png').writeAsBytesSync(png);
     }
  }
  print('Success');
}
