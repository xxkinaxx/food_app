part of 'services.dart';

class UserServices {
  static Future<ApiReturnValue<User>> signIn(String email, String password, {http.Client? client}) async {
    // await Future.delayed(Duration(seconds: 3));
    //
    // // login berhasil
    // return ApiReturnValue(value: mockUser);
    // login gagal
    // return ApiReturnValue(message: "Email atau password salah");
    if (client == null) {
      client = http.Client();
    }
    String url = baseUrl + 'login';
    var response = await client.post(Uri.parse(url),
        headers: ApiService.headersPost(),
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }));

    if (response.statusCode != 200) {
      return ApiReturnValue<User>(message: 'Login Failed, please try again');
    }

    var data = jsonDecode(response.body);

    User.token = data['data']['access_token'];
    User value = User.fromJson(data['data']['user']);

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<User>> signUp(User user, String password, {File? pictureFile, http.Client? client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseUrl + 'register';

    var response = await http.post(Uri.parse(url),
        headers: ApiService.headersPost(),
        // melakukan request
        body: jsonEncode(
          <String, String>{
            'name': user.name!,
            'email': user.email!,
            'password': password,
            'password_confirmation': password,
            'address': user.address!,
            'houseNumber': user.houseNumber!,
            'phoneNumber': user.phoneNumber!,
            'city': user.city!,
          },
        ));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Register failed, please try again!');
    }

    var data = jsonDecode(response.body);
    User.token = data['data']['access_token'];
    User value = User.fromJson(data['data']['user']);

    // upload picture
    if (pictureFile != null) {
      ApiReturnValue<String> result = await uploadPicturePath(pictureFile);

      if (result.value != null) {
        value = value.copyWith(
            picturePath: "https://food.rtid73.com/storage/${result.value}");
      }
    }

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<String>> uploadPicturePath(File pictureFile, {http.MultipartRequest? request}) async {
    String url = baseUrl + 'user/photo';
    var uri = Uri.parse(url);

    if (request == null) {
      request = http.MultipartRequest("POST", uri)
        ..headers['Content-Type'] = 'application/json'
        ..headers['Authorization'] = 'Bearer ${User.token}';
    }

    var multiPartFile =
        await http.MultipartFile.fromPath('file', pictureFile.path);
    request.files.add(multiPartFile);
    var response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      var data = jsonDecode(responseBody);
      String imagePath = data['data'][0];
      return ApiReturnValue(value: imagePath);
    } else {
      return ApiReturnValue(message: 'Upload Picture Failed, please try again');
    }
  }

  static Future<ApiReturnValue<bool>> logout({http.Client? client}) async {

    client ??= http.Client();

    String url = baseUrl + 'logout';
    print("URL Logout : $url");

    var response = await client.post(Uri.parse(url), headers: ApiService.headersPost(token: User.token));

    if(response.statusCode != 200){
      return ApiReturnValue(message: "Logout Failed");
    }

    return ApiReturnValue(value: true);
  }

  static Future<ApiReturnValue<User>> updateProfile(User user, {http.Client? client}) async {
    client ??= http.Client();

    String url = baseUrl + 'user';

    print('URL Update Profile : $url');
    
    var response = await client.post(Uri.parse(url),
    headers: ApiService.headersPost(token: User.token),
    body: jsonEncode(<String, String>{
      'name' : user.name!,
      'address' : user.address!,
      'city' : user.city!,
      'houseNumber' : user.houseNumber!,
      'phoneNumber' : user.phoneNumber!,
    }));

    if(response.statusCode != 200){
      return ApiReturnValue(message: 'Update profile failed, Please try again');
    }

    var data = jsonDecode(response.body);

    User value = User.fromJson(data['data']);

    return ApiReturnValue(value: value);
  }
}
