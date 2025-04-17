import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final LocalAuthentication auth = LocalAuthentication();
  String _authMessage = 'Not authenticated';

  Future<void> _authenticate() async {
    bool canAuthenticateWithBiometrics = false;
    try {
      canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
      final bool isDeviceSupported = await auth.isDeviceSupported();

      if (!canAuthenticateWithBiometrics && !isDeviceSupported) {
        setState(
            () => _authMessage = 'Biometric authentication not available.');
        return;
      }

      final List<BiometricType> availableBiometrics =
          await auth.getAvailableBiometrics();

      if (availableBiometrics.isEmpty) {
        setState(() => _authMessage = 'No biometrics enrolled.');
        return;
      }

      final bool didAuthenticate = await auth.authenticate(
        localizedReason: 'Please authenticate to continue',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
          useErrorDialogs: true,
        ),
      );

      setState(() {
        _authMessage = didAuthenticate
            ? 'Authentication successful'
            : 'Authentication failed';
      });

      if (didAuthenticate) {}
    } on PlatformException catch (e) {
      switch (e.code) {
        case auth_error.notAvailable:
          _authMessage = 'Biometric hardware not available';
          break;
        case auth_error.notEnrolled:
          _authMessage = 'No biometrics enrolled';
          break;
        case auth_error.lockedOut:
        case auth_error.permanentlyLockedOut:
          _authMessage = 'Too many attempts. Locked out.';
          break;
        default:
          _authMessage = 'Error: ${e.message}';
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            const Column(
              children: [
                // Image.asset(
                //   'assets/driver_logo.png', // Replace with your logo path
                //   height: 120,
                // ),
                SizedBox(height: 20),
                Text(
                  'Welcome, Driver!',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                  child: Text(
                    'Use Face ID or Fingerprint to log in securely.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: _authenticate,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.fingerprint,
                  size: 48,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              _authMessage,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
