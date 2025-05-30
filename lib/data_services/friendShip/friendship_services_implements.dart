import 'package:tencentcloud_ai_desk_customer/data_services/core/core_services_implements.dart';
import 'package:tencentcloud_ai_desk_customer/data_services/friendShip/friendship_services.dart';
import 'package:tencentcloud_ai_desk_customer/data_services/services_locatar.dart';
import 'package:tencentcloud_ai_desk_customer/ui/utils/error_message_converter.dart';
import 'package:tencent_desk_i18n_tool/tencent_desk_i18n_tool.dart';
import 'package:tencent_im_base/tencent_im_base.dart';

class TCustomerFriendshipServicesImpl implements TCustomerFriendshipServices {
  final TCustomerCoreServicesImpl _coreService = serviceLocator<TCustomerCoreServicesImpl>();

  @override
  Future<List<V2TimFriendInfoResult>?> getFriendsInfo({
    required List<String> userIDList,
  }) async {
    final res = await TencentImSDKPlugin.v2TIMManager
        .getFriendshipManager()
        .getFriendsInfo(userIDList: userIDList);
    if (res.code == 0) {
      return res.data;
    } else {
      _coreService.callOnCallback(TIMCallback(
          type: TIMCallbackType.API_ERROR,
          errorMsg: res.desc,
          errorCode: res.code));
      return null;
    }
  }

  @override
  Future<List<V2TimUserFullInfo>?> getUsersInfo({
    required List<String> userIDList,
  }) async {
    final res = await TencentImSDKPlugin.v2TIMManager
        .getUsersInfo(userIDList: userIDList);
    if (res.code == 0) {
      return res.data;
    } else {
      _coreService.callOnCallback(TIMCallback(
          type: TIMCallbackType.API_ERROR,
          errorMsg: res.desc,
          errorCode: res.code));
      return null;
    }
  }

  @override
  Future<List<V2TimFriendOperationResult>?> addToBlackList({
    required List<String> userIDList,
  }) async {
    final res = await TencentImSDKPlugin.v2TIMManager
        .getFriendshipManager()
        .addToBlackList(userIDList: userIDList);
    if (res.code == 0) {
      return res.data;
    } else {
      _coreService.callOnCallback(TIMCallback(
          type: TIMCallbackType.API_ERROR,
          errorMsg: res.desc,
          errorCode: res.code));
      return null;
    }
  }

  @override
  Future<V2TimValueCallback<V2TimFriendOperationResult>> addFriend({
    required String userID,
    required FriendTypeEnum addType,
    String? remark,
    String? friendGroup,
    String? addSource,
    String? addWording,
  }) async {
    final result =
        await TencentImSDKPlugin.v2TIMManager.getFriendshipManager().addFriend(
              userID: userID,
              addType: addType,
              remark: remark,
              addWording: addWording,
              friendGroup: friendGroup,
              addSource: addSource,
            );
    if (result.code != 0) {
      _coreService.callOnCallback(TIMCallback(
        type: TIMCallbackType.API_ERROR,
        errorMsg: result.desc,
        errorCode: result.code,
        infoRecommendText: TDesk_t("好友添加失败"),
      ));
    } else if (result.code == 0 && result.data?.resultCode != 0) {
      String recommendText = "";
      if (result.data != null && result.data!.resultCode != null) {
        recommendText = ErrorMessageConverter.getErrorMessage(result.data!.resultCode!);
      }

      _coreService.callOnCallback(TIMCallback(
        type: TIMCallbackType.API_ERROR,
        errorMsg: result.code == 0 ? result.data?.resultInfo : result.desc,
        errorCode: result.code == 0 ? result.data?.resultCode : result.code,
        infoRecommendText: recommendText,
      ));
    } else {
      _coreService.callOnCallback(TIMCallback(
          type: TIMCallbackType.API_ERROR,
          errorMsg: result.desc,
          errorCode: result.code,
          infoRecommendText: TDesk_t("好友添加成功"),
      ));
    }

    return result;
  }

  @override
  Future<List<V2TimFriendOperationResult>?> deleteFromBlackList({
    required List<String> userIDList,
  }) async {
    final res = await TencentImSDKPlugin.v2TIMManager
        .getFriendshipManager()
        .deleteFromBlackList(userIDList: userIDList);
    if (res.code == 0) {
      return res.data;
    } else {
      _coreService.callOnCallback(TIMCallback(
          type: TIMCallbackType.API_ERROR,
          errorMsg: res.desc,
          errorCode: res.code));
      return null;
    }
  }

  @override
  Future<List<V2TimFriendOperationResult>?> deleteFromFriendList({
    required List<String> userIDList,
    required FriendTypeEnum deleteType,
  }) async {
    final res = await TencentImSDKPlugin.v2TIMManager
        .getFriendshipManager()
        .deleteFromFriendList(userIDList: userIDList, deleteType: deleteType);
    if (res.code == 0) {
      _coreService.callOnCallback(TIMCallback(
          type: TIMCallbackType.API_ERROR,
          errorMsg: res.desc,
          errorCode: res.code,
          infoRecommendText: TDesk_t("好友删除成功")));
      return res.data;
    } else {
      _coreService.callOnCallback(TIMCallback(
          type: TIMCallbackType.API_ERROR,
          errorMsg: res.desc,
          errorCode: res.code,
          infoRecommendText: TDesk_t("好友删除失败")));
      return null;
    }
  }

  @override
  Future<List<V2TimFriendInfo>?> getFriendList() async {
    final res = await TencentImSDKPlugin.v2TIMManager
        .getFriendshipManager()
        .getFriendList();
    if (res.code == 0) {
      return res.data;
    } else {
      _coreService.callOnCallback(TIMCallback(
          type: TIMCallbackType.API_ERROR,
          errorMsg: res.desc,
          errorCode: res.code));
      return null;
    }
  }

  @override
  Future<List<V2TimFriendInfo>?> getBlackList() async {
    final res = await TencentImSDKPlugin.v2TIMManager
        .getFriendshipManager()
        .getBlackList();
    if (res.code == 0) {
      return res.data;
    } else {
      _coreService.callOnCallback(TIMCallback(
          type: TIMCallbackType.API_ERROR,
          errorMsg: res.desc,
          errorCode: res.code));
      return null;
    }
  }

  @override
  Future<List<V2TimFriendCheckResult>?> checkFriend({
    required List<String> userIDList,
    required FriendTypeEnum checkType,
  }) async {
    final res = await TencentImSDKPlugin.v2TIMManager
        .getFriendshipManager()
        .checkFriend(userIDList: userIDList, checkType: checkType);
    if (res.code == 0) {
      return res.data;
    } else {
      _coreService.callOnCallback(TIMCallback(
          type: TIMCallbackType.API_ERROR,
          errorMsg: res.desc,
          errorCode: res.code));
      return null;
    }
  }

  @override
  Future<void> addFriendListener({
    required V2TimFriendshipListener listener,
  }) {
    return TencentImSDKPlugin.v2TIMManager
        .getFriendshipManager()
        .addFriendListener(listener: listener);
  }

  @override
  Future<void> removeFriendListener({
    V2TimFriendshipListener? listener,
  }) {
    return TencentImSDKPlugin.v2TIMManager
        .getFriendshipManager()
        .removeFriendListener(listener: listener);
  }

  @override
  Future<V2TimFriendApplicationResult?> getFriendApplicationList() async {
    final res = await TencentImSDKPlugin.v2TIMManager
        .getFriendshipManager()
        .getFriendApplicationList();
    if (res.code == 0) {
      return res.data;
    } else {
      _coreService.callOnCallback(TIMCallback(
          type: TIMCallbackType.API_ERROR,
          errorMsg: res.desc,
          errorCode: res.code));
      return null;
    }
  }

  @override
  Future<V2TimFriendOperationResult?> acceptFriendApplication({
    required FriendResponseTypeEnum responseType,
    required FriendApplicationTypeEnum type,
    required String userID,
  }) async {
    final res = await TencentImSDKPlugin.v2TIMManager
        .getFriendshipManager()
        .acceptFriendApplication(
          responseType: responseType,
          type: type,
          userID: userID,
        );
    if (res.code == 0) {
      return res.data;
    } else {
      _coreService.callOnCallback(TIMCallback(
          type: TIMCallbackType.API_ERROR,
          errorMsg: res.desc,
          errorCode: res.code));
      return null;
    }
  }

  @override
  Future<V2TimFriendOperationResult?> refuseFriendApplication(
      {required FriendApplicationTypeEnum type, required String userID}) async {
    final res = await TencentImSDKPlugin.v2TIMManager
        .getFriendshipManager()
        .refuseFriendApplication(type: type, userID: userID);
    if (res.code == 0) {
      return res.data;
    } else {
      _coreService.callOnCallback(TIMCallback(
          type: TIMCallbackType.API_ERROR,
          errorMsg: res.desc,
          errorCode: res.code));
      return null;
    }
  }

  @override
  Future<V2TimCallback> setFriendInfo({
    required String userID,
    String? friendRemark,
    Map<String, String>? friendCustomInfo,
  }) async {
    final res = await TencentImSDKPlugin.v2TIMManager
        .getFriendshipManager()
        .setFriendInfo(
            friendRemark: friendRemark,
            friendCustomInfo: friendCustomInfo,
            userID: userID);
    if (res.code != 0) {
      _coreService.callOnCallback(TIMCallback(
          type: TIMCallbackType.API_ERROR,
          errorMsg: res.desc,
          errorCode: res.code));
    }
    return res;
  }

  @override
  Future<List<V2TimFriendInfoResult>?> searchFriends({
    required V2TimFriendSearchParam searchParam,
  }) async {
    final res = await TencentImSDKPlugin.v2TIMManager
        .getFriendshipManager()
        .searchFriends(searchParam: searchParam);
    if (res.code == 0) {
      return res.data;
    } else {
      _coreService.callOnCallback(TIMCallback(
          type: TIMCallbackType.API_ERROR,
          errorMsg: res.desc,
          errorCode: res.code));
      return null;
    }
  }

  @override
  Future<List<V2TimUserStatus>> getUserStatus({
    required List<String> userIDList,
  }) async {
    final res = await TencentImSDKPlugin.v2TIMManager
        .getUserStatus(userIDList: userIDList);
    if (res.code == 0) {
      return res.data ?? [];
    } else {
      _coreService.callOnCallback(TIMCallback(
          type: TIMCallbackType.API_ERROR,
          errorMsg: res.desc,
          errorCode: res.code));
      return [];
    }
  }
}
