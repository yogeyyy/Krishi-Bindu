import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:solution_challenge/models/blog.dart';

class BlogService {
  static final apiBaseUrl = dotenv.env['API_BASE_URL'];
  static final baseUrl = '$apiBaseUrl/blogs';

  static Future<void> createBlog(Blog blog) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(blog.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to create blog');
    }
  }

  static Future<Blog> getBlogById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));
    if (response.statusCode == 200) {
      // Assuming the response body is a JSON array
      final List<dynamic> responseData = jsonDecode(response.body);
      if (responseData.isNotEmpty) {
        // Assuming the first item in the array is the blog data
        return Blog.fromJson(responseData[0]);
      } else {
        throw Exception('Blog not found');
      }
    } else {
      throw Exception('Failed to get blog');
    }
  }


  static Future<List<Blog>> getAllBlogs() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      Iterable list = jsonDecode(response.body);
      return list.map((model) => Blog.fromJson(model)).toList();
    } else {
      throw Exception('Failed to get all blogs');
    }
  }

  static Future<void> updateBlog(String id, Blog updatedBlog) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(updatedBlog.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update blog');
    }
  }

  static Future<void> deleteBlog(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete blog');
    }
  }
}
