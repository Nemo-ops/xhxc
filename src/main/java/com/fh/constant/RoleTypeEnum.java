package com.fh.constant;

public enum RoleTypeEnum {

    //志愿者
    HELPER("3264c8e83d0248bb9e3ea6195b4c0216","志愿者"),
    //待资助学校
    SCHOOL("68f8e4a39efe47c7bb869e9d15ab925d","待资助学校"),
    //援助机构
    GROUP("de9de2f006e145a29d52dfadda295353","援助机构");

    // 角色编码
    private String code;
    // 角色名称
    private String desc;

    RoleTypeEnum(String code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public String getCode() {
        return code;
    }
    public String getDesc() {
        return desc;
    }
}
