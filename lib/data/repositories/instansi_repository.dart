import '../models/instansi_model.dart';
import '../models/profile_model.dart';
import '../../core/supabase_client.dart';

class InstansiRepository {
  Future<List<InstansiModel>> getAll() async {
    final res = await supabase
        .from('instansi')
        .select('*')
        .order('nama_instansi');
    return (res as List).map((e) => InstansiModel.fromJson(e)).toList();
  }

  Future<InstansiModel> getById(String id) async {
    final res = await supabase
        .from('instansi').select('*').eq('id', id).single();
    return InstansiModel.fromJson(res);
  }

  Future<InstansiModel> create(Map<String, dynamic> payload) async {
    final res = await supabase.from('instansi').insert(payload).select().single();
    return InstansiModel.fromJson(res);
  }

  Future<InstansiModel> update(String id, Map<String, dynamic> payload) async {
    final res = await supabase.from('instansi').update(payload).eq('id', id).select().single();
    return InstansiModel.fromJson(res);
  }

  Future<void> toggle(String id, bool aktif) async {
    await supabase.from('instansi').update({'aktif': aktif}).eq('id', id);
  }
}

class ProfileRepository {
  Future<ProfileModel?> getMyProfile(String userId) async {
    try {
      final res = await supabase
          .from('profiles')
          .select('*, instansi:instansi_id(nama_instansi)')
          .eq('id', userId)
          .single();
      return ProfileModel.fromJson(res);
    } catch (_) {
      return null;
    }
  }

  Future<List<ProfileModel>> getAll() async {
    final res = await supabase
        .from('profiles')
        .select('*, instansi:instansi_id(nama_instansi)')
        .order('nama');
    return (res as List).map((e) => ProfileModel.fromJson(e)).toList();
  }

  Future<void> update(String id, Map<String, dynamic> payload) async {
    await supabase.from('profiles').update(payload).eq('id', id);
  }
}

class PengaturanRepository {
  Future<PengaturanModel> getSettings() async {
    try {
      final res = await supabase
          .from('pengaturan').select('*').eq('id', 1).single();
      return PengaturanModel.fromJson(res);
    } catch (_) {
      return PengaturanModel.defaultSettings();
    }
  }
}
