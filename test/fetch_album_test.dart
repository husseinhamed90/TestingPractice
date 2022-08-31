import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:testing/Models/Album.dart';
import 'package:testing/ApiService.dart';
import 'package:testing/counter.dart';

import 'fetch_album_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  group('fetchAlbum', () {
    test('returns an Album if the http call completes successfully', () async {
      final client = MockClient();

      when(client.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'))).thenAnswer((_) async =>
          http.Response('{"userId": 1, "id": 2, "title": "mock"}', 200));

      final apiService = ApiService();
      expect(await apiService.fetchAlbum(client), isA<Album>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();
      when(client.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'))).thenAnswer((_) async => http.Response('Not Found', 404));
      final apiService = ApiService();
      expect(apiService.fetchAlbum(client), throwsException);
    });
  });
}