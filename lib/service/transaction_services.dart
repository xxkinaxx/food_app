part of 'services.dart';

class TransactionServices {
  static Future<ApiReturnValue<List<Transaction>>> getTransaction(
      {http.Client? client}) async {
    client ??= http.Client();

    String url = baseUrl + 'transaction';

    print("URL Transaction : $url");

    var response = await client.get(Uri.parse(url), headers: ApiService.headersGet());

    print("Response Transaction : ${response.body}");

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Failed to get transactions");
    }

    var data = jsonDecode(response.body);
    print("Data Transaction : $data");

    List<Transaction> transaction = (data['data']['data'] as Iterable)
        .map((e) => Transaction.fromJson(e))
        .toList();

    return ApiReturnValue(value: transaction);
  }

  static Future<ApiReturnValue<Transaction>> submitTransaction(
      Transaction transaction,
      {http.Client? client}) async {
    client ??= http.Client();

    String url = baseUrl + 'checkout';
    print("URL Submit Transaction : $url");

    var response = await client.post(Uri.parse(url),
        headers: ApiService.headersPost(),
        body: jsonEncode(<String, dynamic>{
          'food_id': transaction.food!.id,
          'user_id': transaction.user!.id,
          'quantity': transaction.quantity,
          'total': transaction.total,
          'status': 'PENDING',
        }));

    print("Submit Transaction : ${response.body}");

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Failed to submit transaction');
    }

    var data = jsonDecode(response.body);
    Transaction submit = Transaction.fromJson(data['data']);

    return ApiReturnValue(value: submit);
  }
}
