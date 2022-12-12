class Reply {
  Reply({
    this.result,
  });

  final String? result;

  static List<Reply> get replies => List.generate(10, (index) => Reply(result: 'reply_$index'));
}
