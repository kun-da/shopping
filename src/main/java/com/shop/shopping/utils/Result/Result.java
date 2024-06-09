package com.shop.shopping.utils.Result;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Result<T> {
    private int code;
    private String message;
    private T data;

    // 静态方法，用于快速创建成功结果
    public static <T> Result<T> success(T data) {
        return new Result<>(200, "Success", data);
    }
    public static <T> Result<T> success() {
        return new Result<>(200, "Success", null);
    }

    // 静态方法，用于快速创建失败结果
    public static <T> Result<T> error(String message) {
        return new Result<>(500, message, null);
    }

    // 静态方法，用于自定义返回码和消息的结果
    public static <T> Result<T> of(int code, String message, T data) {
        return new Result<>(code, message, data);
    }
}