import 'package:supabase_flutter/supabase_flutter.dart';

// Supabase credentials dari sikap-app .env
const String supabaseUrl    = 'https://kpjvngkgtpetnksfzdfh.supabase.co';
const String supabaseAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtwanZuZ2tndHBldG5rc2Z6ZGZoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzkzMzQxOTQsImV4cCI6MjA5NDkxMDE5NH0.mS9FQPect6r7pirJnx78Um74LI8QoaD8unKG_3TzpUA';

SupabaseClient get supabase => Supabase.instance.client;
