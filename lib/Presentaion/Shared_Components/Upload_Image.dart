import 'dart:io';
import 'package:image_picker/image_picker.dart';

Future<File?> UploadImageFromGallery() async {
  File? Image;
  var ImgPicker = ImagePicker();
  var PickedImg = await ImgPicker.getImage(source: ImageSource.gallery);
  if (PickedImg != null) {
    Image = File(PickedImg.path);
    return Image;
  } else {}
}
