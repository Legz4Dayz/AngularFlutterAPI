class ProviderPageService implements IProviderPageService {
  ProviderPageService();

  String returnMyName() {
    return 'Mitchell';
  }
}

abstract class IProviderPageService {
  IProviderPageService();
  String returnMyName();
}
