class ApiEndPoints {
  ApiEndPoints._();

  static const String _base = "api/v1/";
  static const String _user = "user/";
  static const String _setting = "setting/";

  ///Authentication
  static String signup = "$_base${_user}signup/";
  static String resendVerification = "$_base${_user}resend-verification/";
  static String signin = "$_base${_user}signin/";
  static String forgotPasssword = "$_base${_user}forgot-password/";
  static String verifyOtp = "$_base${_user}verify-otp/";

  ///Settings
  static String updateUser(id) => "$_base$_user$id/";
  static String changePassword(id) => "$_base$_user$id/";
  static String contactus = "${_base}contactus/";
  static String deleteAccount(id) => "$_base$_user$id/";

  ///Dashboard
  static String inviteFriend = "${_base}invite-friend/";

  /// Home
  static String getOnGoingGames = "${_base}game/";
  static String getOnlinePlayer = "${_base}user/";

  /// statistics
  static String getPointTable = "${_base}game/point-table/";
  static String getPlayersRanking = "${_base}user/ranking/";
  static String getGameStateData = "${_base}game/statistics/";

  /// invite
  static String postInviteFriend = "${_base}invite-friend/";
  static String postVerifyInvite = "${_base}invite-friend/verify-invite/";
  static String putUpdateInvite(int gameId) => "${_base}invite-friend/$gameId/";

  /// Game
  static String postCreateGame = "${_base}game/";
  static String postCreatePuzzle = "${_base}puzzle/";
  static String getGenerateWord = "${_base}puzzle/generate-word/";
  static String getPuzzleTime = "${_base}puzzle/start-puzzle/";
  static String getCheckResult = "${_base}game/check-result/";
  static String getPuzzleDetail = "${_base}puzzle-detail/";
  static String getPuzzleRetrieve(num puzzleId) => "${_base}puzzle/$puzzleId/";

  ///CMS
  static String cmsGet = "$_base${_setting}get/";

  ///Socket
  static String socketApi = "${_base}game/socket/";

  ///RetrieveUser
  static String retrieveUser(id) => "$_base$_user$id";
}
