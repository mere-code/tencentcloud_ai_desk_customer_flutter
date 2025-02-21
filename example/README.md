# Tencent Cloud Desk Customer UIKit (Flutter) Example

This repository provides an example app for **Tencent Cloud Desk Customer UIKit** (Flutter). It demonstrates how to seamlessly integrate the Flutter Customer UIKit into your app with minimal effort.

## About Tencent Cloud Desk Customer UIKit

**Tencent Cloud Desk Customer UIKit** is a Flutter library designed to simplify the integration of Tencent Cloud Desk customer service features into your app. With minimal code, you can implement a professional chat interface tailored to intelligent customer service scenarios. This package eliminates the need to manage complex chat integrations while offering a customizable and efficient solution for customer interactions.

## How to Use

### Step 1: Configure the UIKit

1. Open the file `example/lib/config.dart`.
2. Replace the placeholder values with your Tencent Cloud Chat credentials:
    - Set `sdkAppID` and `secret` with the appropriate values from the Tencent Cloud Chat console.
    - Fill in the `customerServiceID` from your Tencent Cloud Desk console.

### Step 2: Run the App

Once the configuration is complete, you can run the example app using Flutter.

```bash
flutter run
```

### Step 3: Test the Example App

1. **Enter a User ID**:  
   Upon app launch, you will see an input field. Enter a test `User ID` to initialize and log in to the Customer UIKit.
    - Click the **Phase 1** button to invoke the `TencentCloudCustomer.init` method for initialization and login.
   
      <img src="https://github.com/user-attachments/assets/a0743e54-5450-4c1a-93ac-e0774934a91a" alt="image" width="300">


2. **Start a Chat Session**:  
   After successful login, click the **Phase 2** button to begin chatting with the customer service agent specified in the `customerServiceID` field in `config.dart`.

    <img src="https://github.com/user-attachments/assets/62cd6a6a-02cb-46dd-b112-7b10a942c031" alt="image" width="300">


Below is a brief description of the two phases:

| **Phase**        | **Action**                                                                                                     |
|-------------------|---------------------------------------------------------------------------------------------------------------|
| **Phase 1**       | Initializes and logs in the customer service interface by invoking `TencentCloudCustomer.init`.                |
| **Phase 2**       | Navigates to the chat session with the specified customer service agent using `TencentCloudCustomer.navigate`. |


# 腾讯云智能客服用户端 Customer UIKit (Flutter) 示例

该仓库提供了一个 **腾讯云智能客服 Customer UIKit**（Flutter）的示例应用，展示了如何以最简单的方式将 Flutter Customer UIKit 集成到您的应用中。

## 关于腾讯云智能客服用户端 Customer UIKit

**腾讯云智能客服 Customer UIKit** 是一个 Flutter 库，旨在简化腾讯云智能客服用户端的集成。通过极少量的代码，您可以实现一个专业的聊天界面，专为智能客户服务场景量身定制。此库无需复杂的聊天功能管理，同时提供了一个可定制、高效的客户交互解决方案。

## 如何使用

### 第一步：配置 UIKit

1. 打开文件 `example/lib/config.dart`。
2. 将占位符值替换为您的腾讯云 IM 凭证：
    - 使用腾讯云 IM 控制台提供的 `sdkAppID` 和 `secret` 填写对应字段。
    - 填入腾讯云智能客服管理端中提供的 `customerServiceID`。

### 第二步：运行应用

完成配置后，您可以使用 Flutter 运行示例应用：

```bash
flutter run
```

### 第三步：测试示例应用

1. **输入用户 ID**：  
   启动应用后，您会看到一个输入框。输入一个测试用的 `User ID` 以初始化并登录 Customer UIKit。
    - 点击 **Phase 1** 按钮，调用 `TencentCloudCustomer.init` 方法进行初始化和登录。

2. **开始会话**：  
   登录成功后，点击 **Phase 2** 按钮，即可开始与 `config.dart` 文件中指定的客服号进行聊天。

以下是两个阶段的简单说明：

| **阶段**       | **操作**                                                                                     |
|----------------|---------------------------------------------------------------------------------------------|
| **Phase 1**   | 调用 `TencentCloudCustomer.init` 方法，初始化并登录客户服务界面。                              |
| **Phase 2**   | 调用 `TencentCloudCustomer.navigate` 方法，进入与指定客服号的会话界面。                         |
