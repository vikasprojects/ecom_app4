abstract class Usecase<Types, Params> {
  Future<Types> call({Params params});
}