class BaseBlocOption {
  BaseBlocOption({
    this.willShowBaseLoading = true,
    this.willShowBaseError = true,
    this.willInitBaseBlocStreamListener = true,
  });

  final bool willShowBaseLoading;
  final bool willShowBaseError;
  final bool willInitBaseBlocStreamListener;
}
