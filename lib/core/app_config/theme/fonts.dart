import 'package:google_fonts/google_fonts.dart';

Future<void> loadFonts() async {
  await GoogleFonts.pendingFonts([
    GoogleFonts.roboto(),
    GoogleFonts.raleway(),
    GoogleFonts.rubik(),
  ]);
}
