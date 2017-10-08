package com.smarthouse.model.util;

import org.apache.commons.codec.digest.DigestUtils;

public class Md5Util {

    public static String toMd5(String senha) {
        return DigestUtils.md5Hex(senha);
    }
}
