# License Plate Scanner App
![app-icon](https://github.com/yassir56069/numberplate_recog/assets/62571794/79c3788e-7c4d-4170-b196-fa63b1960e20)

## Overview

The License Plate Scanner App is a mobile application developed in Flutter that provides two main functionalities:

1. **License Plate Scanning:** The app allows users to capture images of license plates using the device's camera or by selecting images from the gallery. It utilizes Google ML Kit's OCR library to identify and extract text from license plates.

2. **Storage Functionality:** The application features a storage system powered by sqflite, allowing users to view and manage previously scanned license plates. Users can store, retrieve, and delete entries in the local SQLite database.

## Features

- Image capture from camera or gallery.
- Optical Character Recognition (OCR) using Google ML Kit.
- Dialog box for selecting and adding recognized text.
- Local storage using sqflite for managing license plate entries.

## Screenshots

![Screenshot 1](https://github.com/yassir56069/numberplate_recog/assets/62571794/f1950696-8c1a-4c41-9ce3-5544d0f01753)
![Screenshot 2](https://github.com/yassir56069/numberplate_recog/assets/62571794/2df44cfb-b8fd-40b3-a3f5-b2405605482a)

## Getting Started

Follow these steps to run the app on your local machine:

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/yourusername/license-plate-scanner.git
   cd license-plate-scanner
   ```

2. **Install Dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the App:**
   ```bash
   flutter run
   ```

## Dependencies

- [Flutter](https://flutter.dev/)
- [image_picker](https://pub.dev/packages/image_picker)
- [google_ml_kit](https://pub.dev/packages/google_ml_kit)
- [sqflite](https://pub.dev/packages/sqflite)

## Contributing

Contributions are welcome! If you have any ideas, bug reports, or feature requests, please open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgments

- Special thanks to the contributors and developers of the third-party libraries used in this project.

## Contact

For inquiries, contact [Yassir Hoossan Buksh] at [hoossanbukshyassir@gmail.com].
