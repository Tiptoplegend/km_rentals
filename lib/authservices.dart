import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

ValueNotifier<AuthService> authservice = ValueNotifier(AuthService());

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get currentUser => firebaseAuth.currentUser;

  Stream<User?> get authStateStream => firebaseAuth.authStateChanges();

  // ─── SIGN UP ─────────────────────────────────────────────────────────────────
  // Creates a Firebase Auth account AND writes a user profile to Firestore
  // with the role ('renter' or 'owner').
  Future<UserCredential> createAccount({
    required String email,
    required String password,
    required String fullName,
    required String phone,
    required String role, // 'renter' or 'owner'
  }) async {
    // 1. Create the Firebase Auth user
    UserCredential credential =
        await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // 2. Write the user profile to Firestore under users/{uid}
    await _firestore.collection('users').doc(credential.user!.uid).set({
      'uid': credential.user!.uid,
      'email': email,
      'fullName': fullName,
      'phone': phone,
      'role': role,
      'createdAt': FieldValue.serverTimestamp(),
      'profileImageUrl': '',
    });

    // 3. Set the display name on the Auth profile too
    await credential.user!.updateDisplayName(fullName);

    return credential;
  }

  // ─── SIGN IN ─────────────────────────────────────────────────────────────────
  Future<UserCredential> signIN({
    required String email,
    required String password,
  }) async {
    return await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // ─── GET USER ROLE ───────────────────────────────────────────────────────────
  // Reads the Firestore profile for the currently logged-in user
  // and returns their role ('renter' or 'owner').
  Future<String?> getUserRole() async {
    if (currentUser == null) return null;

    DocumentSnapshot doc =
        await _firestore.collection('users').doc(currentUser!.uid).get();

    if (doc.exists) {
      return doc.get('role') as String?;
    }
    return null;
  }

  // ─── GET USER PROFILE ────────────────────────────────────────────────────────
  // Returns the full user profile as a Map.
  Future<Map<String, dynamic>?> getUserProfile() async {
    if (currentUser == null) return null;

    DocumentSnapshot doc =
        await _firestore.collection('users').doc(currentUser!.uid).get();

    if (doc.exists) {
      return doc.data() as Map<String, dynamic>;
    }
    return null;
  }

  // ─── SIGN OUT ────────────────────────────────────────────────────────────────
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  // ─── RESET PASSWORD (external — via email link) ──────────────────────────────
  Future<void> resetPassword(String email) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  // ─── UPDATE USERNAME ─────────────────────────────────────────────────────────
  Future<void> updateUsername({required String newUsername}) async {
    await currentUser!.updateDisplayName(newUsername);

    // Also update in Firestore
    await _firestore.collection('users').doc(currentUser!.uid).update({
      'fullName': newUsername,
    });
  }

  // ─── RESET PASSWORD (internal — from current password) ───────────────────────
  Future<void> resetPasswordFromCurrentPassword({
    required String currentPassword,
    required String newPassword,
    required String email,
  }) async {
    AuthCredential credential = EmailAuthProvider.credential(
      email: email,
      password: currentPassword,
    );
    await currentUser!.reauthenticateWithCredential(credential);
    await currentUser!.updatePassword(newPassword);
  }
}
