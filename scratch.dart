import 'package:supabase/supabase.dart';
import 'dart:io';

void main() async {
  final supabaseUrl = 'https://kpjvngkgtpetnksfzdfh.supabase.co';
  final supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtwanZuZ2tndHBldG5rc2Z6ZGZoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzkzMzQxOTQsImV4cCI6MjA5NDkxMDE5NH0.mS9FQPect6r7pirJnx78Um74LI8QoaD8unKG_3TzpUA';
  
  final client = SupabaseClient(supabaseUrl, supabaseKey);
  
  final res = await client.from('transaksi').select('instansi_id, bulan_hijriyah, tahun_hijriyah, uraian, nominal');
  print('Total transactions: ${res.length}');
  for (var r in res.take(10)) {
    print(r);
  }
  
  final instansiRes = await client.from('instansi').select('id, nama_instansi');
  print('Instansi: $instansiRes');
  exit(0);
}
