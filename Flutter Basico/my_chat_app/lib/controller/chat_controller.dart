import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_chat_app/config/routes/app_pages.dart';
import 'package:my_chat_app/constant/constant.dart';
import 'package:my_chat_app/model/message_model.dart';
import 'package:my_chat_app/model/profile_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatController extends GetxController {
  late final Stream<List<Message>> messagesStream;
  final Map<String, Profile> profileCache = {};

  late final TextEditingController textController = TextEditingController();

  @override
  void onInit() {
    final myUserId = supabase.auth.currentUser!.id;
    messagesStream = supabase
        .from('messages')
        .stream(primaryKey: ['id'])
        .order('created_at')
        .map((maps) => maps
            .map((map) => Message.fromMap(map: map, myUserId: myUserId))
            .toList());

    super.onInit();
  }

  Future<void> loadProfileCache(String profileId) async {
    if (profileCache[profileId] != null) {
      return;
    }
    final data =
        await supabase.from('profiles').select().eq('id', profileId).single();
    final profile = Profile.fromMap(data);
    //setState(() {
    profileCache[profileId] = profile;
    //});
  }

  void signOut() {
    supabase.auth.signOut();
    Get.offAllNamed(Routes.login);
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void submitMessage() async {
    final text = textController.text;
    final myUserId = supabase.auth.currentUser!.id;
    if (text.isEmpty) {
      return;
    }
    textController.clear();
    try {
      await supabase.from('messages').insert({
        'profile_id': myUserId,
        'content': text,
      });
    } on PostgrestException catch (error) {
      Get.snackbar('Error', error.message);
      //context.showErrorSnackBar(message: error.message);
    } catch (_) {
      Get.snackbar('Error', unexpectedErrorMessage);
      //context.showErrorSnackBar(message: unexpectedErrorMessage);
    }
  }
}
